Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B748DD2D0FD
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 13:42:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A48A10E4E7;
	Tue, 13 Jan 2026 13:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwS8nHLC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4286210E4DB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 13:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768311744; x=1799847744;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xctKApxv4Sv+M/K0gbEUR0nKzljTp4jN6OECywc5S2A=;
 b=AwS8nHLCvy3ZqPrzn4zHXymSDI/437MTJCM7bFKUvuP+U+cru40RUgJf
 8OEoTT8zNajFpkunjk3WR846jlU47mVAcGw0oHxdJr0eqC1Y180T5MWd4
 9ML+gjaZgpXbXFKboIIB8YP644UrEl8O63T3Aa3BY5t4AyDRNT1cFJywP
 hq6vpIM9NBOGcs8qJ/qN/65qgIQ/SwlwxlCGaBH8bZnF+FVkga004BVRi
 nxzk1pX80jpHCxDI69XY7HSMf2WVi+HDK1J3TXJ9bM2+NK6QuoeJAh4AU
 TQ0hywCmQX+Nyy6/MaZnP5ka1Myk2rq1zM1itnJm4hcXMHHdBMvn49FrQ w==;
X-CSE-ConnectionGUID: dcpMNBdER62bnml8oqPEzA==
X-CSE-MsgGUID: /lQnW6SwTpeub9emzemZnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69326907"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69326907"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 05:42:24 -0800
X-CSE-ConnectionGUID: LnjzwagtShyqBEOYINpj5A==
X-CSE-MsgGUID: uOR/XH6VQL2nHk4g6Qp2rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208855208"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 05:42:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 05:42:23 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 05:42:23 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 05:42:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXm2HdAdcA7jaxZmPNDIWJ3N/+LD/yvxeVmTa/JPETcOazBL2q/urVXNQXKMAJhFY4xRg7mIalvdDE+zPn8KvzelZTEUcuvFDig8epNcQ1IquB9aKF7r6VzGgMXgMH/ICTs+gh7SizZWgk7ozTxTiesFUAuNOLMBkejuVUJpwDrr7Mu8WkwIEJFIRc6Ecj0SPWKJcC7od0ldbQwj1Mp/AeKRoUD23IXWNxe3Ji5dEmGNAI5JnY9P4toDEofWRMS8RrG2ioaY7zZk8wA7i331ywNQ/ANnMzgktQyv4sCqMogjoUoze3up4ZUKrH9HN9lTxVxGTBcc/lx8tDLNxSq/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7fnruo8M3T7N1x93HHNn668cPVH7cSlDz7BJXK2w9eU=;
 b=YDfor45/EdTgv9F+3QG2WI9BB7ImH9VBqX5tgoZBmM6uYXJiwDmoXB7oRP3h6ohVcAg/u7QvsP5rp2p0TSiDVxyxgz37D2q7W2nqKGoXcHmkj1arXxLK6Vi+yBZhM1nq2Wu88+pfI/nKr16jjG0neG/79KqN3bqD3eAr20lKhXC4Z8Tui4LnUYq0wPysq7OFt6yG87tjLeNky4eZzWAmSi5ND44eVb8O6oo0vTURX3qXXsKNOgEV+ChDT091bmJkOiWz43h0T4H9UhaFW7hudtsCAH7FndhtXhxMp/2LrNUUvgJwpmcdZ5XJEOgNk3vnxpnaifJQir998Sc3dFNtQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DM3PR11MB8715.namprd11.prod.outlook.com (2603:10b6:0:1e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.5; Tue, 13 Jan 2026 13:42:15 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 13:42:15 +0000
Message-ID: <cd5dbc88-8a0e-4c7d-a0c8-1eb2f3852965@intel.com>
Date: Tue, 13 Jan 2026 19:12:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <rodrigo.vivi@intel.com>, <raag.jadav@intel.com>
References: <20251211194251.16988-1-karthik.poosa@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20251211194251.16988-1-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DM3PR11MB8715:EE_
X-MS-Office365-Filtering-Correlation-Id: b04f9f8d-3d88-4e1c-308d-08de52a99019
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm5uK2Jmd1Vyd0lTMk9NYjBXdzBwTFZFMkxteGJLbi9Yb1d6c3hYcllPWXRG?=
 =?utf-8?B?QW1NQVBERXJIdlBtQ2xXcStKTlk5bnp6Q2Zjd2wvNzJiUC8xUmFXLys4WXU4?=
 =?utf-8?B?TFVBYWJSVEdSSzFBNWZobUFTNkFSeUhNcmYvbXNhQzBtMU5LM3hqNFovZzVC?=
 =?utf-8?B?RUxZdFdwbFd1bDVDZEhsS1RucFBmQUFFKytZMXBWb3o1UWl3VFY0b1AyWTRW?=
 =?utf-8?B?cENvZHUvc0lOTmdCblFybTJaQXBIV0F2aEVLbjBSc0tvQzQ2OXhZMnBBOFlM?=
 =?utf-8?B?MHdMVFhmdFp1cjY4ZE44Y0U0NHNpRG1TZUJBOHJOdjhXMEtER3ZrZmpoMlpM?=
 =?utf-8?B?ekYxMEdselBWejdOeGpVUHlBMW9mQ0paSy9RbHEveEZ5a1pCY3RLZkQ2bVJl?=
 =?utf-8?B?L08wTXk0bEJpN1A5U3NiZy82ZHpBNjB1OEpleUxMdjBIcmd2bXk1VHhxN3NR?=
 =?utf-8?B?aWdvd1h5cS81cTJMeGhpWEc2WE0weHNOSjkxUWN2aHdLakRzSlh1aFJLa0xy?=
 =?utf-8?B?S1l6dldUWjNoejBJcmF3NGpabDF4b3U1dVhCQmpvTG84MThYeDgxZElhbWxE?=
 =?utf-8?B?SVpwUnFEVWhCODJPYnVxK0xrZHBKMlovbWM2eGNUU2tjNWxMejZ1cm1KL1Jx?=
 =?utf-8?B?eE9UZGRMWjRJblFOS0JtQ0FWSlhkdjI0a1VuOGVEY1A1WEdiQU82T28wMFRH?=
 =?utf-8?B?SkRSc3lKdmI4NWRQdHFXaTVWcXVBYWx0aXRUZnJKRm5mSThoR2hYeVFIWDBh?=
 =?utf-8?B?ZVR5dUhicU4xMFVmYWRZem40YTVYYkI5QUZPb1dldWg3M1pYVnI0ZW5OYnY2?=
 =?utf-8?B?NGtROEZrbjlseE1MdEI5ZkdwSUcrTk9YN3hpdmFJMUJKQjdjNm5wSEhaM1dQ?=
 =?utf-8?B?c2NtSi9qV1FlTXp2d1Ezd2x4d2E5QVJIZzl0YlZGS3RWa1JsNlB1L2JHZ3h3?=
 =?utf-8?B?QVRvMEp2QTlrdTJvMElHVFZBb2V1ZkZaTUZldGI2TW9peVJ3eXJLdDNNQVlD?=
 =?utf-8?B?aGJpTVh5TEpXY25oRnpER3ExWVh6d0pQbk9XVnVwaXk3TzhnOEYxTERQK3Bz?=
 =?utf-8?B?VmMvZjF2OE9iZHhNblhkb1RiTmsxOG9wcG5nVHFWRjA2ZjE3cHJjdUJLOHVk?=
 =?utf-8?B?ZzRrS0pZVm9CSHBBUmxCRmlRZ0FLUlFSaFE4RGNESlBycXp2ak9UWXp4WFRz?=
 =?utf-8?B?RXkrQkFza1paYmludGNXcWVqTEJWa253U3pSclJpa1dSNUEvWGRFbFJVak1z?=
 =?utf-8?B?SHVXblZ5K3ZYTjR3djFEektuL3BZMFdXd0Y4OVFZcmtCMEg2c2RtOW9MU2Yv?=
 =?utf-8?B?V2FmT0Fic0VBRFgwSDlxRGVqbXRaODBUODBWNVpvWUZ3TjYwYVNLWHVvTVln?=
 =?utf-8?B?WTFBVHc2Tm16Y0hxR3hTRU9vemJHaWx5d3pZT3Fhbi9KMEhRVGljT0kxaTBt?=
 =?utf-8?B?a2JoaU85MWd5ZEVDZ29pUDAxQVFtQVRITm1OakNYbTlxY21VZVhkOFpnemZt?=
 =?utf-8?B?ck5HRmlkTEtzWUVLNCt1Z0YzQUVFTERkY0JPS1AvNjhua1B2V2V0ZklVcmtG?=
 =?utf-8?B?WmVjbVMwWFVZZUlZc1FUVzFhczA1YkFzR2txN2c3N05zcGo1WkllMlV3MDF6?=
 =?utf-8?B?VncxY1BtS3M3TGhwcFJrdXhxeFcyUnhRRU1BcndFSnR1WlM5RUVsVVc4R1JE?=
 =?utf-8?B?Szg0UHBuUkt0Mnk5WnJLUzF3STNWN21EWUk4ekRMRU5abHlaZGpmSVRrc28x?=
 =?utf-8?B?aEZKaUVENXBhU2FxNlZ1Q3AxQW5mcFdaZFFzN1NlT2JXZUdWMGtaRTF5UkJp?=
 =?utf-8?B?dXI3dFZhb2I1RTV5bm9iQ0pGMUtseFZzak9RVGVFcUlMLzE1bzhqZE1BSGNs?=
 =?utf-8?B?QmRxVThvRTJVYldDT0NlRFBadVRZQ3lWR0hzUHdmdXZkWlZhMzkvMGxsTFQy?=
 =?utf-8?Q?wrZ9WaYPcKZ1Aottsrk8a0ImgFDwNg5W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2hCb1hSbkhMem16bGhHOGpwY0ltMjBpS2Y5SFh6WnJaYXNPeCtYYTBTTkVN?=
 =?utf-8?B?ZzYrNEZHdjh5cnlERGlBMTZpSlQvMHdBYmtFeDF5YTFLbHBaenFBb3l6c0Qw?=
 =?utf-8?B?cTZ3elZwTDZURU9VQUI3Y3N3ek9ZTzZmdW95M2ZjdGk4VVhOSDJUSExxK0Y2?=
 =?utf-8?B?RkhtYUJFOGVsdzJsVnNBNjhSRlZkWXN1OFRMMGF2bEgyMit4QkRkQVRrQWFq?=
 =?utf-8?B?a0pKUTRGVU9zRlExanBNK0Rza3BueDIweFc5LzBoZHBVVEdPM29ONDVnRXor?=
 =?utf-8?B?d25sUFgrNHhoTkpubGxQNFhwNXBPKytueGdmQVg0aFNNVmlLVXVYblhRS09m?=
 =?utf-8?B?eSswZHRJSktld0E4eU9oYnArci9sRnNSUm9LMFROYlg5T0EyZWV6NGhyZzBM?=
 =?utf-8?B?c0ZjZnVzaEZCbDBTV08ydktUOVNEUFlmTUVSa2lGOSsvM2RRS2RmWlRHSUto?=
 =?utf-8?B?c2FHSXlrNUpOZUd2MSttaWFXdmJteEtRZVlYaTE3Q1Jsd0dibWwzQkY4ZWEz?=
 =?utf-8?B?K3BibFNqODVLVzl4TnNpa0pLK3p4MjkxbWp3YU5GL3lBZlQyWFhQYVltWmRn?=
 =?utf-8?B?YWNMZWp0RSthMWxod1JQTmt6bE5remk2MjZ3eXMySFBRcmJHOGxxa0Y1Z0F0?=
 =?utf-8?B?eFQ4ZHpDUUlDT1pldWNqRVJsbURoNyt2aldkb3p1Zk9Ebll6U0JNYTVuYkU3?=
 =?utf-8?B?TVNqdnpqSDhNUGE0anQwRjJVK2ZqVFMxM1UxOFFjWkMvNE5PeDEzaTdXRnVT?=
 =?utf-8?B?OHIzZmpLZGYvS21qeXJnLzNDZDhhcVNJa29yV3BCLzVzNXFnSlRLL0hpQUdI?=
 =?utf-8?B?NXhZQ2wwNzVzeUJQbkpSOFFuSWM2aEpqdTZHaHZRWHNLZGlReDE1eW5uency?=
 =?utf-8?B?ZFA4ZzRzQ0FYUUdyNE1wbVdFbjV1elFHZGFIK1F3MlpnYUJWYTVxYlRzVUIv?=
 =?utf-8?B?OUtoYUpIZmRNeExqajZ5S3kvaVBOVjhmRExvbnhzQXFUNms3OHJhSmwxVFpo?=
 =?utf-8?B?emVmME1VMUNDRWJSQnZyVlkveFdDZ0hrRDJMalZGdEhqM0hKN2JPNFk0WlFz?=
 =?utf-8?B?SDBsbXUvKzlnWVBFeFQzNGJpNjV3aGwreWNDVzFQV0lNR0ZXS2ZqL2cwN3RH?=
 =?utf-8?B?aEcxWW5mNnlIVG5YNU83R2JyMUhCR2xjc1AwUWxJWUFJOTlkUDQ1OHM4VkZZ?=
 =?utf-8?B?dFZqa3J3elZaZUQyaDVVS0lTUzNXdXZLS0VHRVhYRERjWlZYY016N2g0RDNE?=
 =?utf-8?B?Vkc1b3dJOXFjZEdRUkZaR3lTODdpZGF0VitteXRIS1hBK0ZqeVQ3WFFGU2tG?=
 =?utf-8?B?N0FnZTdPUUc4aWlkeVhmb1ZpZkFtWXdlMUhkTDJSMFRJM2w2ZFJIR2tqZURC?=
 =?utf-8?B?eG01YVNDaTVZSUlGbmpia2RMdzgrSlJMWjFYUTVYVkg5K3RHMUtHcTB1cHN1?=
 =?utf-8?B?a1hOOTRRZElyVW50U2p6alZWMFQ3UUNEZGw0aDVLWUtKN1hiZWxMcW85OXRs?=
 =?utf-8?B?VXBxcUtmR1VJRlNUVkFTcEQwTDFkckVaOTltcXJ6TFJnTUJ6ajRHc01XOWhP?=
 =?utf-8?B?UHppb0ZqeU9XMmdaWVp4ZXRaTkJ3Q0k1UmtJOFJZcE1ONkVyUElSRUJrck92?=
 =?utf-8?B?bDVIZkt2Zi9RazRPaFliZzQ1aFk0SWg4SzZ0NGl3b1AraUMwamJ3NE1XS242?=
 =?utf-8?B?aHNsazEraEwyZTAwSUU2ZnpSeERIQ3BrYm9UR1dGd2oxM3RPdndHYTZVVGpO?=
 =?utf-8?B?alE5RHg1KzExQ2dCNTIwa21CLyswdkNRUG1xQ0NsZ2U2eU1PMWZIOGxaM2RN?=
 =?utf-8?B?ZVE3L1U2TEphNzErQ2k2b0hMM0dRTkFVZFFZMTlFZ2dqTmdnZ2tGamNqdmt4?=
 =?utf-8?B?NkdicUhsOGpBQklnVmJqY1FGeTNsM0w5VHpLWVAvcVFBbFVKejJPdEplSkt3?=
 =?utf-8?B?RlVjdVVQTEVHTFd1Z3ZIYVVvVEFTZ1cxOW9mMk9VK3B0QjRZSGVwSzRoYmlh?=
 =?utf-8?B?ZDQ5OGtqc01vV0hwdzdWNDl2RkFWcTJUWXlRMXpEekZBckpsVk9xZStsaVFI?=
 =?utf-8?B?V1VXcFQxbXcxNU4yZktIWE5rZGdidVhQc2pYLzlvYWxMc0NEU2pEQUNIVDFW?=
 =?utf-8?B?TWFZOGNvN3N2aTEyVStNMmhmejVqWjZvcmsyQ091Z2o1eXdpK3B2eHhrS0o1?=
 =?utf-8?B?SVp0bk80VUt1a0l2SzdrODVCbGpsbUFTN0F1OUZVNk9zeGxVNmdqbFQ1UHhY?=
 =?utf-8?B?ZUNqNGxwZ2JmN0xHQzVGRGNCRlFrZkJWeVNuVGNBSzF5RENTM2Zka0ZoWUpa?=
 =?utf-8?B?K3pTQnA3dk9Ka2dDTmFaNDVQZ1lOSjZCUWNxaVhWdkhJTnpKVDVOK2xsUERw?=
 =?utf-8?Q?CrOY11MDVP6K0cOk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b04f9f8d-3d88-4e1c-308d-08de52a99019
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:42:15.6919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ump7badbQvVLmiI01JF69x2UkQcv6BhWxEKqVGTyzHQ6dDbNn/eK1+JXNvWwjmSsySRbD7Wfc2ZZghZDhaB1UufkDf7n0dYQ3EPoh2wGFU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8715
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

Hi Karthik,

On 12-12-2025 01:12 am, Karthik Poosa wrote:
> Improve hwmon-read test to check if current temperature
> is above critical temperature limit in hwmon-read test.
> This will help identify any thermal issues with the
> setups during test runs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/intel_hwmon.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
>
> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
> index 103ae69cd..b19868440 100644
> --- a/tests/intel/intel_hwmon.c
> +++ b/tests/intel/intel_hwmon.c
> @@ -26,6 +26,25 @@
>   
>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>   
> +static void check_if_temp_valid(int hwm, char *sysfs_name, u32 cur_val)
> +{
> +	char str[32] = {0};
> +	uint8_t ch = 0;
> +	s32 limit = 0;
> +
> +	sscanf(sysfs_name, "temp%hhu_%s", &ch, str);

Please add sscanf validation

> +
> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
> +	if (!strncmp(sysfs_name, "temp", 4) && !strncmp(str, "input", 5)) {
> +		sprintf(str, "temp%d_crit", ch);

ch type inconsistency (%hhu and %d)

Thanks

-/Mallesh

> +		if (!faccessat(hwm, str, R_OK, 0)) {
> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
> +			igt_debug("current value = %d limit = %d\n", cur_val, limit);
> +			igt_assert_f(cur_val <= limit, "current temperature exceeds limit!\n");
> +		}
> +	}
> +}
> +
>   static void hwmon_read(int hwm)
>   {
>   	struct dirent *de;
> @@ -43,6 +62,8 @@ static void hwmon_read(int hwm)
>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>   		igt_debug("'%s': %s\n", de->d_name, val);
>   
> +		check_if_temp_valid(hwm, de->d_name, atoi(val));
> +
>   	}
>   	closedir(dir);
>   }
