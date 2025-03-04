Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80674C021B8
	for <igt-dev@archiver.kernel.org>; Tue,  4 Mar 2025 10:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8B710E307;
	Tue,  4 Mar 2025 10:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XK3UvPfi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE8210E307
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Mar 2025 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741082841; x=1772618841;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OyYiCtaHgMaw6dxOdJpqan+p/5kjh+oxWUynp9zwLHo=;
 b=XK3UvPfiXlFwpqflJtPYCcbCKb/yPtjBYqlC795zBpIglhT8sAXUFWgb
 unkveTKyWCfJK7k9EyAAKDVEvJg/HDUztqIYe5+AsSyykOyctnxaA9D6Z
 LNwRuE6KSCOK1ulwQGECubqN2Q/fu226yWZffAseLqAvdyL0KEl1duHNB
 5bcqxQFU2l4XMy+SVfmCppHdYkP1qvOzmGWRXOPrDtshWNFajDQHAVQeS
 IhFdHyzsCnsV5YPDK2HX6/RP+E0kmyCoOLhrz8F+zJb2hN8cSRwng74Uq
 gBKdPGURcZzlNEXHnvQth+aHqcZJGwZ4aF+5cxdOvPzGBCnmHrclGbzdW Q==;
X-CSE-ConnectionGUID: rrIrxpLJRoquUDPf9wx0mA==
X-CSE-MsgGUID: NutF2I+NSwOIc3gBbWmeOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41849212"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="41849212"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 02:07:20 -0800
X-CSE-ConnectionGUID: T1Bu41brQUKxXVNjeqwqSA==
X-CSE-MsgGUID: 5WDQ/61+TM6o+rrz1lN5KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; d="scan'208";a="119023435"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Mar 2025 02:07:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Mar 2025 02:07:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 02:07:19 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 02:07:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxVr/q05vDx6KrgX/aFhyktMuiyrj2RRY/FU3lZAonTesuaIkRuKSneLn4V1i5h8ABafSKzH/q35f1o6JRDjCdNgBltjamqFDxeLQx38vLVZUFcOuQKgHRlwniHRI0TuXZdVaxVq64hIrLFWfaeBzV9f7m40lVUHgXdWFU1SGO1J2ioayWHnFc3JQFagmv7bo1hE7Ru64/M8dFJORc8eVCsG7Tn+Fhm3DpU/nleC9GnzFIVbN/1WdxUlQQKO4NrPZuvjjDId7ZBuNSvuhZJc0gX6BwNYRo6uK814HBMqPHVMzsXTV978/oRY3gIZ5zMhBiS7IssTsjM1jYCxca7Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rIsDL9Dw0fT4sfYQDskzlo0M5lN0C2iMzJ+yOM5FPmU=;
 b=RxUrHQKCLsbNjk+zSOc8xyRxS6PSTOq3fsrlDLv3JkvM9i5MdxTfijIGJ/aczQUXhqsUrBqCe0owO5kJEyd4lu4Ufjo0JpijcOCxAUECkdJWqj5ikgbmzSFIH6ow1fBG6G8vzNx0CckeXhMPYfkdMcdDgM/KGjW6CSgGIbQuqzFZs7sxibpmKVRmF3ShOTnuEl6TXUgQ+6oBZgPtv+gDwvGplzuLClMu/oT4HLiBdqY3jLFjeTjkdX3gge3BWJAv+BVQHSeM350AY31NHUTtFtF3+13Qnl9nxCawcPgdHcyW8lJubJOZqwVBVv0C1c/V097jJBDKlmuxK5GyF5pzQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA0PR11MB7695.namprd11.prod.outlook.com (2603:10b6:208:400::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8489.26; Tue, 4 Mar 2025 10:07:17 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8489.025; Tue, 4 Mar 2025
 10:07:16 +0000
Message-ID: <31284f0d-4d38-440e-b087-6f5493521377@intel.com>
Date: Tue, 4 Mar 2025 15:37:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/4] Add gputop functionality common to all
 drivers
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <jonathan.ming.jun.lui@intel.com>
References: <20250228141810.1417657-1-soham.purkait@intel.com>
 <20250228141810.1417657-3-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250228141810.1417657-3-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0012.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::13) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA0PR11MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6e2970-e59d-45ab-d141-08dd5b0457a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QVhKZ25Xakg1ZFFUeC90WExLRGpYNnVGVDl3ak54c3Y1RktaelVESEo4VFBn?=
 =?utf-8?B?SnB2bUxnRkdaTVpWLzVZZWdjUkd5TC8xQ2ZScHNjdVRBNlp1U0tqZWlKcE1t?=
 =?utf-8?B?bDRjSlNOVWxHVlRnOVNzSUpXMUxVTGNUUXQ0NzVyTlZ4d2FBY21hNk1iKzdx?=
 =?utf-8?B?dGcrQ20vYmx5QWY0UWVHaFdaUTNxTWw4QnJqK05OUFVyUkE1aGtyNTB5STBT?=
 =?utf-8?B?bmNFcWhQRm82amVFZXNITlBkVk1EVGVDbDRJOVhXQmRISXJnVUFlZUp4VHZM?=
 =?utf-8?B?RTY3M2U0OXdoZ1JjV2lEcXFhRTB5NG9oOEFCZDBBUjI2S3FqUHE2R1FCQ3U0?=
 =?utf-8?B?UTFXNE12MFdjeFpGRGgvbE1rQzh4QnF2WVFuNXdLV3JrUlBQSnZUWFhRcHRy?=
 =?utf-8?B?all3TG90NWpqVjN0elg2Qmt6bFIwMFY5QU02cnpiZkFjOHB5L3lzb2dHc0NW?=
 =?utf-8?B?WUNsR1ppQ2RMeXAwVHlNWUtWRDZZRVhDMlFSb053TWN2TW5LQzZXRU5acWZC?=
 =?utf-8?B?eDVLaWdIa0daajFKRWdRejRDdzcxS2swWW5LSGZHNEtTY0Q2cFBBSUtKdXU0?=
 =?utf-8?B?dDZETXNVTzdIZVFiNVlMTEVoVW1NOXUrZ1lNOXJiZllDbW11M2xhOFhXU05w?=
 =?utf-8?B?dkdmdk5ZQ2VVZks5WW1HVm1TQVhoMTVmR3ZWVGloQkE3eHJlRWhmaHp5aHVh?=
 =?utf-8?B?NHNDNHA0YXYzckIydFJQVlpwa0k0TjEwZFpVVlNrWldBVGNIVTN2WDZTWnZj?=
 =?utf-8?B?NEVtL3huRklKd2F0clJ4a1pIVFlvQ2tQNG9GYmpxVnlISFVDUTdIMlJ5NkJn?=
 =?utf-8?B?Z0RXb2hsNVVJT1lEVTd5d0JZRCt3b2tZTS9zVWs2Z1BFYlZhbTZkVTE2TEE5?=
 =?utf-8?B?cVgvUlVSRWphdXVCelYxT0hRWDFOOGlyRkFiM0RVT2tKU1FsRWNXSDJ1NDZJ?=
 =?utf-8?B?WWFleTVPcXVRdzdaSFUxSkw5VENDTVY0NFJCcFhjM3NzWnhnQlNWbW5meTBB?=
 =?utf-8?B?cWlxZzlPamc3TzlTNitmcXdQOUhPaUZML2w4M2cydjBWU3k4dGRVVmgvMk1N?=
 =?utf-8?B?VGgxTHM3T1VZNlYyS2RiQ0NsYkFxSEsyaGROZmZqL3VNWXdGZEVmZnBNYk90?=
 =?utf-8?B?MzJSdlNvb0VTc0tIZGJrKy9WWlB0QWhBY3JwUXFEUDdqV2k2aW9WVDdZaDlM?=
 =?utf-8?B?bGJVc0dqSjFEVGh1WWJXL0piRytpMG9GdmZZd21IVGdiMWdWUDhldmtyaEJp?=
 =?utf-8?B?aG9TWlZ3bUkrSDJsc3ZTV1NFYVRDOTBZS25kTEoxakdjcEpmQWNEQ1g1T0tp?=
 =?utf-8?B?QjNXZjFFMGw5cFhYbVJsb1d2emtHdU5jR2J6VGxWS0Z4Vml5dHpKL3RVRXVG?=
 =?utf-8?B?eXpkOFdBc29FTU56UXVzUTQvdk1Qd0U0MWM5QVlPbjYraVVoZS9PdWxBWWRZ?=
 =?utf-8?B?RzJiNnlTazZKQW1FV1ZPQ21xL2ZnSHJqNVUxelZOVEQ3WldFVkZab0xqdmhC?=
 =?utf-8?B?M0F6OWpsSkE2WnY4YTg0eUZGMFp3TWlUQTkvbjViUWFCZFJhaVNENzRuWlNC?=
 =?utf-8?B?NWg2Z05Sd1RQNVFNMVk5T3hwdFdUeCt1cEQyYzhkdVUwUk9ML3pHU1Y2bWZl?=
 =?utf-8?B?K0JCd1hQdmNiOE5yWkRYYVU5WHV5UEJGWEdvNVJJNzhmSVl3SW11NVVCUmgr?=
 =?utf-8?B?Rzlyd0lRSGhETjc1bzVrV1hBdVIzbDZQLzdNMHh1ZnozZ1dHQm9DTDJhMzZn?=
 =?utf-8?B?RXFEYi9UZ05JSU5lejhrNlBIbzRjSlJOTy8vTHo1YWZMU0Z6YklPR0hJRE9t?=
 =?utf-8?B?M000WFJFazM4cUVzazBMRXVySi9idWFjZXlqOGlNL3BPdnoyM05PdjFqaTZ5?=
 =?utf-8?Q?9AUI/jTG+8CCe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJvZTU1cXM2QS9aQzdicUMrYVlkK3B2bmVQMllZcXFIYnBvMUlFSFRPQnBX?=
 =?utf-8?B?aGR6WVJ1VUYzNmhGS3hKMnVXUDB1RkliN3dnQ2QvYXExcVBqalVlaXgvcFF4?=
 =?utf-8?B?c3lKakJiRld4M0NDVTBQZHRVaHFhcGNJSmxYUHl0KzNzOUNSd3pGUVVxOXgy?=
 =?utf-8?B?dU1xYlAzTi93MU0wSkVnNmtPeTV5dU9qMi9GdG5rbmVKWExVV2l5dld6Vjdr?=
 =?utf-8?B?b0dVL2kzWG9ZTVZGNUJreFgzWU81dkY5ME84UmNjK1JOZlgyWmdLcTJWMHJM?=
 =?utf-8?B?TUU4Q3puc3hqcjdZbURtVTNzZktlRXVzbXM4UWtCNWxHRXdvRndsaXV5VFp5?=
 =?utf-8?B?cDBYT0daTFoyU1R6K0Jndnd3NHB3blVBOTN1T05HV3BLNnhwdnpNbFU0Nzdl?=
 =?utf-8?B?OTZsR0RIR1A1ZDRUeTVmT2xNRTdVS1dHZUFkcnY4UFFTRENRRlF3cm5vZ1NU?=
 =?utf-8?B?a3BielhHRDEycEtLdFdoaDdqenp6NVo4S1pRakRFaHhWa0UxYmR1VUF6S2l5?=
 =?utf-8?B?ZlNMWGNYeFlRNklNZXoraVJ0QWFYMFpOWnZieUpJUU1jQWFxY3A5dzBVZ0Jp?=
 =?utf-8?B?M1BOZlRPdmV5TmF6NWZwdm0yZjJHTWVwQi92TExaQTlQbUZvZ1N1dnJvUEdE?=
 =?utf-8?B?UXNkd0VMZy9waWs2NUpKZ2w2Nlh2MDFCdHhKMDFJQTBXOHdPbVRjUEU1VVRS?=
 =?utf-8?B?eG5zdDBjM01Ka0ppZ2ZaOWw5NlR6R01pb3RYcmdzWlRzb2FNc2wwdTdPQ2NI?=
 =?utf-8?B?OTNYQTlaSkNraEJteE0rWGR3aldwWGNMYWFJdldjNGl6WmdNcGNyUk9jSEwv?=
 =?utf-8?B?OVB6c1hvWDhvYVRrOXpxR3pZSXdGZzVLajJua0d4Rmxva1YrU2hEaG16UWlj?=
 =?utf-8?B?QUs4OE8xTVFXcHd5QitEYnN0ZmFoUkhtMWpxQmI5cnpPM3NsUjJQQkxRb3R4?=
 =?utf-8?B?cm5QdE5WakdNQi9NOTZzYmpPTG5DRmhFZkxDaXJjVGFIaFI4NjJ0TXBLOElM?=
 =?utf-8?B?QzQ2SUttQWJGUEp4c0hEZUc0a20yMy9yR1Ewa2J4WHlTSkVTRnB2dGVaSk9q?=
 =?utf-8?B?WWh1b0RwS2RNaWttcnJOM2p6dWo3RFg4MUVqaHNkN0Mzc1lVUWt6bklrNUMz?=
 =?utf-8?B?dlRYTHAzTTc0eWNrOXJUSXY1MlZveFphcHZhY3FtRC92VUkrZVFyRGJkai9F?=
 =?utf-8?B?WDhlRXE0ZXdDR1RpNXZoNXpBTmtmWERXK25XZTlGTExZTVJOa0txOFVkeXZL?=
 =?utf-8?B?TnMzU2EzZStheXRpMU5yckFzc1JHTG04Rm9PbjJnNFhoMUp3RnR4RytUenha?=
 =?utf-8?B?Q3d3SW9xcldzM1J2Sld6NWxGNURxUk9vSmsxbGdPOEZ6NmFsL2NBSFJkYjNp?=
 =?utf-8?B?NzRCcGVDTy80Y2NiWFFyd0JNQ0lOdmVEeXQwSFo0Mi9sWG5lTVVCNEhNdkJ1?=
 =?utf-8?B?ZUs4SEV6bWN6MS9acDlFVURVaFNsb0hmemRBUWtueXA2cHUxcXlTZThHVDF2?=
 =?utf-8?B?amd0YkswdUZOZkFoWWtqUVpsVU1pd0NRVkp0dXBkdk1pRmFwSno3Wlk1R3FM?=
 =?utf-8?B?UkpGbXU0Q3dwK3lBeWZDZGhtZzlxSk8wZmd1ZXlhNzQ0cG51VG1lV2pEL0tD?=
 =?utf-8?B?NHJXTktJWnNtYXNBcGRUTkJzcFllNHE3OGh6N0ZEYVpqb2N3RDc2WjlKRzZk?=
 =?utf-8?B?RTFTaGV6UlJ4OU9KbE96SFE2d2gyMFo3dnc2OG1RV1FyVDZvZEZxakFYUUpJ?=
 =?utf-8?B?Rm5YVHpHbnJRU0luV3hId09nbnBBWjUvSkVHM2RXRVkyOVgwc2dONWljQUJo?=
 =?utf-8?B?TVhqNXF4WnptTjQ4WEhLSTdHTk9tOEJUSTRsMFVVV1BCWloxRDRrc1VXRU5v?=
 =?utf-8?B?QmZxTTZjMXdIZ1ZQaUtPV2JKTlpSOXpzaXpvWEo5eGpjUmZlSzk5cE5RaTV4?=
 =?utf-8?B?NnI2Yk9kRGNOYmZnRmNtbys3VGhqNlArQTVDcnZ5aTlFMjlxL1cwblZiYWUw?=
 =?utf-8?B?dGJ1MlVjMGdHU3pRUExIcUh6WE5LV0FVUmNpRWRyNUZPZGlMUHh5L3h3RmdU?=
 =?utf-8?B?NmtGM054aHpxN0pPbWNXTXhWcmkyRUsrblZkd1FFK3YzQjd1RjBtN3lTVjlp?=
 =?utf-8?Q?6il7dF/VHqUkgI9+GuZGTtUBo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6e2970-e59d-45ab-d141-08dd5b0457a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 10:07:16.8375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Zvj55WQxlrFibv9Djrs3blwrBUTf21VGvITXS3+x4Dk5d3bH05Vx63xwg+L9IUZhhY+V2SOhRQJTCRgV98V2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7695
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Soham

Add description for each patch

On 2/28/2025 7:48 PM, Soham Purkait wrote:
> v2 : fix for refactoring GPUTOP into a
>       vendor-agnostic tool (Lucas)
> 
> v3 : Headers in alphabetical order (Kamil, Riana)
missing signed-off-by

use git commit -s
> 
> ---
>   tools/gputop/common_gputop.c | 79 ++++++++++++++++++++++++++++++++++++
>   tools/gputop/common_gputop.h | 58 ++++++++++++++++++++++++++
>   2 files changed, 137 insertions(+)
>   create mode 100644 tools/gputop/common_gputop.c
>   create mode 100644 tools/gputop/common_gputop.h
> 
> diff --git a/tools/gputop/common_gputop.c b/tools/gputop/common_gputop.c
> new file mode 100644
> index 000000000..578bd0a01
> --- /dev/null
> +++ b/tools/gputop/common_gputop.c
since this file has formatting and printing related functions.
different name?
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <assert.h>
> +
> +#include "common_gputop.h"
> +
> +static const char * const bars[] = { " ", "▏", "▎", "▍", "▌", "▋", "▊", "▉", "█" };
> +
> +/* tr_pmu_name()
> + *
> + * Transliterate pci_slot_id to sysfs device name entry for GPU
> + * from type struct igt_device_card.
> + * GPU PCI ID   ("xxxx:yy:zz.z")       device = "xe_xxxx_yy_zz.z".
> + */
> +char *tr_pmu_name(const struct igt_device_card *card)
> +{
> +	int ret;
> +	const int bufsize = 16;
> +	char *buf, *device = NULL;
> +
> +	assert(card->pci_slot_name[0]);
> +
> +	device = malloc(bufsize);
> +	assert(device);
> +
> +	ret = snprintf(device, bufsize, "xe_%s", card->pci_slot_name);
this file is named common but has "xe" in this function

you can use below from lib/igt_perf.h

const char *xe_perf_device(int xe, char *buf, int buflen)
const char *i915_perf_device(int i915, char *buf, int buflen)

or add a common function in igt_perf and re-use

> +	assert(ret == (bufsize - 1));
> +
> +	buf = device;
> +	for (; *buf; buf++)
> +		if (*buf == ':')
> +			*buf = '_';
> +
> +	return device;
> +}
> +
> +void n_spaces(const unsigned int n)
> +{
> +	unsigned int i;
> +
> +	for (i = 0; i < n; i++)
> +		putchar(' ');
> +}
> +
> +void print_percentage_bar(double percent, int max_len)
> +{
> +	int bar_len, i, len = max_len - 1;
> +	const int w = 8;
> +
> +	len -= printf("|%5.1f%% ", percent);
> +
> +	/* no space left for bars, do what we can */
> +	if (len < 0)
> +		len = 0;
> +
> +	bar_len = ceil(w * percent * len / 100.0);
> +	if (bar_len > w * len)
> +		bar_len = w * len;
> +
> +	for (i = bar_len; i >= w; i -= w)
> +		printf("%s", bars[w]);
> +	if (i)
> +		printf("%s", bars[i]);
> +
> +	len -= (bar_len + (w - 1)) / w;
> +	n_spaces(len);
> +
> +	putchar('|');
> +}
> +
> +int print_engines_footer(int lines, int con_w, int con_h)
> +{
> +	if (lines++ < con_h)
> +		printf("\n");
> +
> +	return lines;
> +}
> diff --git a/tools/gputop/common_gputop.h b/tools/gputop/common_gputop.h
> new file mode 100644
> index 000000000..4e6f632af
> --- /dev/null
> +++ b/tools/gputop/common_gputop.h
> @@ -0,0 +1,58 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef COMMON_GPUTOP_H
> +#define COMMON_GPUTOP_H
> +
> +#include <math.h>
> +#include <stdbool.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +
> +#include "igt_device_scan.h"
> +
> +#define ANSI_HEADER "\033[7m"
> +#define ANSI_RESET "\033[0m"
> +
> +/**
> + * struct gputop_device
> + *
> + * @driver_present: It is set if at least a
> + * single device found of the respective driver
> + * @len: Number of total device discovered
> + * of the respective driver
> + * @instances: pointer to the array of
> + * discovered instances of the devices
> + * of the same driver
> + */
> +struct gputop_device {
> +	bool driver_present;
> +	int len;
> +	void *instances;
> +};
> +
> +/**
> + * struct device_operations - Structure to hold function
> + * pointers for device specific operations for each individual driver.
> + * @populate_device_instances: Function to populate device instances.
> + * @discover_engines: Function to discover engines.
> + * @pmu_init: Function to initialize the PMU (Performance Monitoring Unit).
> + * @pmu_sample: Function to sample PMU data.
> + * @print_engines: Function to print engine business.
> + */
> +struct device_operations {
> +	void (*populate_device_instances)(struct gputop_device *dv);
%s/dv/dev or device
> +	void *(*discover_engines)(const void *obj);
> +	int (*pmu_init)(const void *obj);
> +	void (*pmu_sample)(const void *obj);
> +	int (*print_engines)(const void *obj, int lines, int w, int h);
> +};

Why not combine both? Both are device specific.

Thanks
Riana Tauro
> +
> +void print_percentage_bar(double percent, int max_len);
> +int print_engines_footer(int lines, int con_w, int con_h);
> +void n_spaces(const unsigned int n);
> +char *tr_pmu_name(const struct igt_device_card *card);
> +
> +#endif // COMMON_GPUTOP_H

