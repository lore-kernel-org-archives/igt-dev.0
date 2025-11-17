Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6113CE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 05:48:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784DB10E2E6;
	Mon, 17 Nov 2025 05:48:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdXsu40l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D8210E2E6
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 05:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763358500; x=1794894500;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KZMSdatYVDxlWhSV6So7dCgHrKIOYNqP9lPFCPV1xzs=;
 b=UdXsu40lgXjpQmibiK7aUVjISeIs+0BA2GSCySYF7B+XCB1mH/XGCD6g
 snjoJ/bB6U1XKjXCHAaP6k1W8QxdASyquq5jDzQqO5wkO9q99AvoIsEQ2
 EAmKrODmpvAVeCG7KoLZ3PUadinnB4EbLeUv9VJkJv9jLNs1aP0eSzeIm
 L5oVuFEWCFZFf/AL+Z2I2CfnGDAcRUzHjGzgqOi7wzOs7bDI7z1z2ftSm
 QNMDJbs2VOQNEXObopKPSevsTxzbHPrNQdGTLVyxyLV+9d4kk2ykUW9+l
 lBgLn1qiC/ndkeSvRuTlN8cgaOWAKpeosUaEYkltgoAUtW1piDWodYqMN Q==;
X-CSE-ConnectionGUID: ELJajqYnTQOPWyUveMyIxw==
X-CSE-MsgGUID: UZe5O1YdSXC7M6YdEDSTfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82738549"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="82738549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:48:19 -0800
X-CSE-ConnectionGUID: SXO01erjR6qp/Wz12jQ7YA==
X-CSE-MsgGUID: 6JHZlXJmRlGYeHBDbdJzjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="190154592"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2025 21:48:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:48:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 16 Nov 2025 21:48:16 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.26) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 16 Nov 2025 21:48:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=loIcASnOYQmvqleNIHKp01t3WkQvRKv+46ZCX68GK4S6oVTCgw60oWEo+YrHdfslcr6uolNUVzjtjCrnAb/FxUcb3CKQJIHe4qaIe1E/g5+NiZ1Zm7VU9uxojrd16cD1Qyk8hV3qRRFJ151vp5KPEeGm0pCR7/z5lyeFHfm0ot51iVAwHgGgrISkZrCTNMTzjMmAVCuBVThgG6LWXHMN9fSGkXRxQtdplOzBFqh9iWuc/0Kqlc/w4LjiS2PGWartw5iejJta7eQgXR6cLUhysoTuc+mxfjYRiEiLSuvfsmoaQnh5jDAgivCG4VwxxupcCnl4EW7f+Qyruddm3FBRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZrJ3DMmmPLmrlNNleO77VDxYvIFCkxiUueERECtXck=;
 b=tGFvzE/7Nq/nyo75djatbaqdZlE6kcSDDRaNfn5p2zY+LtcPWC1hzVyhwGLtSIUIrUn6EjgvxqulSb5sj06ZSZHgKLjVSfsfAifCgfAyBhdBO5cwDafRklMWMT6JHOcqy1bcm50/XjzodUYsuhe0kgtT578CFtWBbtiTpHSLwrd6h5hA90WPV1ddK2LQDWzSWwhlw2SGawk9/zMWua0L0uSeBUSpKR3jN6GwR+/kp3G2Ks1thl4lfUt5IbVOErgidcdHK2aHKwV2Zh+IhH1oRBLRsWmQi+z2WAToV9dWlOG7zIwABMqwfQ7QHQgv1sUQuT0scysfbIOyeoh52AOQ4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5177.namprd11.prod.outlook.com (2603:10b6:806:11c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 05:48:13 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 05:48:13 +0000
Message-ID: <65ac2812-0913-40ea-a96c-f75c0c8bfed2@intel.com>
Date: Mon, 17 Nov 2025 11:18:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/4] tools/displaytop: Add Display debugfs entry
 for display top
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>, Adith Narein T <adith.narein.t@intel.com>
References: <20251105060914.673664-1-pranay.samala@intel.com>
 <20251105060914.673664-3-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251105060914.673664-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0037.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5177:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a361f96-5f26-4a60-9d5e-08de259ce55d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|376014|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGs4dk5tQmRQVVJMM1RnVXR4YXZCTkNEN1RmVGxzdXh1Z2ZVQTBuZzc0cDlK?=
 =?utf-8?B?MmZmVkd1Z2NvSFpZbVo5cXIxM3pEN2hQVHQvQ1MzN2M4RktaTDIvSXhpclVV?=
 =?utf-8?B?SCtlekZwSSttbzllMTRyZ2NBUGoxdWFQN3A0UStxTVZFeUFyUGxqS1l6U1J4?=
 =?utf-8?B?eDVaM3Y3akRULy9CZUhRQnZNVFhuejdPeGtiQUZieUZaMUZSNkorU2txWTMz?=
 =?utf-8?B?UmMxQ0dUKzVtV0ZYN0JKZFpzUWpqb0tlcnRLdXV3aEZCenZPNmpvQ1B2S2V3?=
 =?utf-8?B?YUZ6WFdHOGx6NWRkeCtXS0pldERiSkJRcGpFNVA0cGx1Z0pGdWxSc241dUdP?=
 =?utf-8?B?WG1QVnk1T3ZIWko5UVUyR0d6ZHJlZ0NMZHR5STVPeFhlVTBqR0I3QTcwY1ll?=
 =?utf-8?B?TVgra0RGSXZhNElvZ05FdzFEUm1VRm93ZlJmRDBBU0I3Qkc0WEsyeVY0UGtX?=
 =?utf-8?B?N25jZFRjc21QV05CaVpJRnVNZ1JFY0kvNkJpZ1dMWTZ3SXVWV3FEZndNbUxL?=
 =?utf-8?B?d1E0dk52YVhaMGs0dnFDOTdIUVhEQXN1TzhtYkZHQStyVlNBU0dXbjNxdFFD?=
 =?utf-8?B?SnlZa1lXaGllaExoM3BEdGdHQlBDYVRqdkZhaWZUOHNDbjcyUFZyUEgxbVpG?=
 =?utf-8?B?RE9EK1RTeCtFWEdMMWxpM3Y2cUh4L0dwVnpaaU56azMwdTBqcjBnQS9teGxS?=
 =?utf-8?B?RklCemg5bjRpL3QxR1FWaTFtWFBSSy9VTzZxbnY3QkZxb0xmcTlaV2NrZWoz?=
 =?utf-8?B?YlpqTktYK2w3OFhRb3A5TE9xUE1COU1rUy8zOGtJWGdFS2NTelVDSkY3cVVp?=
 =?utf-8?B?RVZwMDhIRWI1M1EraEVUNXRIenRuYVhKYmRFWGROZkNmK0tGR3M3OSt2R1ha?=
 =?utf-8?B?b0RaRU9NWjY3WEtsUU82MDVHN0JzbEtZMkhEbk5qbjhYWTYzMU90YzdTRVpL?=
 =?utf-8?B?dlJVN1l1NzhNUks5aUIrdW9hTkdXcjZZbWNoQkZBWHdMOG5UY1BYUXphbEVG?=
 =?utf-8?B?amd5U0NzaTJ0ZGIwNE1QK2hKZkNVelJQbXVMemtieExpM1pTTFJmNDVmbFY4?=
 =?utf-8?B?S2s2UUhJUFcrMEt2RUovb2FYT3dxQkNiMGdnMktiUzBEdW1oMGpKU3I2V3VT?=
 =?utf-8?B?a2hscDJUd20zMjJFSmsyV3JVelp4WlZRUGo1ZkFNbENwOWlMWnoxR0lBZGdw?=
 =?utf-8?B?UTBjNXVFWlBibkNQRmZNUktyczkwZkJ2MHJGWXhEMjdodmlxY2VzdFdqTnRr?=
 =?utf-8?B?MnMxTktQOFRTajY2Si9HR2JmUDlwMStGWXBlcUxCR0pOaUNJWUdzU0ZWV01Z?=
 =?utf-8?B?N3FSVlF4SDg4NXR1MG44Mm9IRTNmVmJoRzZMaUNYSTBYVnlIamdpNC9kSVhL?=
 =?utf-8?B?Q1RReUpWbkRPWTM2ZytFejBSRGZHZFovNmVUR20rbkxtc01BZ3ExMzcwUjFZ?=
 =?utf-8?B?WWFTa0cySVdLc2J0Mm55TG5vZlBGelcxVFN6bEd2M0w4bXVuL3pzeWFJZytO?=
 =?utf-8?B?UTJiVzROTC9IMHg2cTJ3bTdhVlN1Q3FUY3BHTVBpNFZkbEFJcjIvb2J6OU9Z?=
 =?utf-8?B?MzloQnVhRTdPVGhGeFo2QmpVSGJHcDFIbGFxaXRsQ3pycEdtUTA0U3I1b2VD?=
 =?utf-8?B?Q1ptNWlnZnkzNS9vK2pNOWpheEY1UkRpUDNjTkZvbzNLVnZqTGZvRGlISEtu?=
 =?utf-8?B?ZWl2K3IyQVFRZndmcHFpaGJ3N1RVblRPbkVRbUJHcE5yV0lQeHl3TkNwK1FO?=
 =?utf-8?B?SzFCY2s5c003WVp2cE9WMTQvNHNXcU9QUVNZVmFFcEFRMGhPV3VWalhVSXZ0?=
 =?utf-8?B?K211b1JWb3JHaGlGT0Z1cVZraFE3Vmx5R2trOFFPMjJuL0FzSCtramVOMUt3?=
 =?utf-8?B?VXVQcllWQnA4azZzT040b0k0bFZ0c0FPSUdzMEY4NjFZRDcxeHpnWGJnUkd0?=
 =?utf-8?Q?k0P0ySh3nUNF0QY+HLOflvj9M5YXXu3X?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJlNkZ2UCtBdzlUUlA3RU1wUkVxSlhTMHZGVDBKb0pWZXdtOFZNcEFlMzNv?=
 =?utf-8?B?OWFnVXhjWlpwT0MzSlU0SjBrR2drdjQ4cU1nRUMvd2ZJWk5WdFpZY0JQTk1E?=
 =?utf-8?B?cDZ3RmUrcWxEQUVvaDFzUGVpSVRaSVpBNkFIeXJ4a0NZT0FMMXp2c1ZwRWNL?=
 =?utf-8?B?SENoVUpjMjAzNlVIdFpyLzlYcHM0bWd3ZW1hNEhVOEU3T0k3amtyNE1LMTZz?=
 =?utf-8?B?VHNkVXpSTFYrKzZjQlljMVc1U1JlWEFVaitvdHJnUFpqQzBLZzQ5N2prblcz?=
 =?utf-8?B?UkpIR3hiTzNWTitxNVVjSUYwSWtLSkR6aFdORU1hUUg5SUp0RmhucWR1REx3?=
 =?utf-8?B?bjRPQmtGMzk2VTZlK0RML3g5Wnl4alpPeHF6MWVNeU9xWk91NmJKMisyRnZT?=
 =?utf-8?B?c2d1Z1M1SFVhS3ZvcWZRVjY3dWppZGNmdno4SkdVWW1HclBUTTBpVks0YUxR?=
 =?utf-8?B?UmFKK0ROdFAraVlxZTJzRmZaaHdxUG9HSms5blp0MkQvTlJjWU1FV0drbUNL?=
 =?utf-8?B?YlhwTWxNbjNqZ0hKV0NrWXZvVzlQRXBEMUV6Y1BaZlRzanZUaHI2Y1d0N2xY?=
 =?utf-8?B?Qmt1UzVyR0d3Y1RDbkVaWUhsZGdZbWdqZnd0TEI2dys4R2NaVGZvNXMzTm9X?=
 =?utf-8?B?a1dmdG8wYVV0L2x1OXY1NVgwWng5aVFnZ1lMVnRoeEl6MHZPcnRSbmlBUXhB?=
 =?utf-8?B?d0FUNXVleVZva1g1bnU2dFp1eUQ1K2lReWtVMzU0QVhlVTBpc05WSUtZZy9o?=
 =?utf-8?B?RXAvc0pVL0ZBeGJVZkR1akp4bTZCMXZXa1lDdE9QbmtoTGs2OVRtOG5UOUdn?=
 =?utf-8?B?bnRubVhTeS9YM0pCMDBiV3lyeGQreFVMN2VCMkNqcTgySENpQTJ0WWdGRmxv?=
 =?utf-8?B?M2tlYy9sOFNIR2F1akxubTZmb3YxQUFqcm5WVEZSMk5oeDdnZmxIMmxHTWta?=
 =?utf-8?B?czhYM0VHTzl5KzE1M3phUUVNaFVHL1hPc25tS1BBTHN4ajhXekEzSTVEMXNl?=
 =?utf-8?B?WjlqaXRMekVoWVNqRnNXZ1YxQ3Z3WTNOUHU1dW1SMFdvWGZVQ1NrazBTZFNZ?=
 =?utf-8?B?SzF4QjA0c29HZ29FNWtsTVNiOTB5UlBTaEFFbCtJbExXMm9uTlVjNm04eWJj?=
 =?utf-8?B?TEpFVlhpTzVYQkNJWUZTckZzU2VZU2NWVkNNd2VKRkgwaHkyREYwVytmOURl?=
 =?utf-8?B?VndSc0F6aEpLSGJRVTJRSk85dis4VVB0SWl0K2l3eEtsRVRjcnQrbzNjbGNG?=
 =?utf-8?B?b0dlczI1ZUlWemdNRUJmb2VYUkZLM09KYVFaRXN6b3laTGFidjJPMExkR2Y5?=
 =?utf-8?B?TVZUZk5pTXBwUjB5NGlPSER0U1FYVHVLa3pkTzljWTVGcHQrVUpSLzNYVzZv?=
 =?utf-8?B?YWx4NzJuQUdLQmVlSzZnV0xNcTR0c2FNR2Z4RUNiRW4yNm9QSzlJNm1nbStC?=
 =?utf-8?B?SjBvWTNLVmUycW5FRDNNV0k2MTBtZkF3U01YalZwclBab3dITGhiTHg5QTVr?=
 =?utf-8?B?STlCZ29Da1RYSXdMaHQ3TUlFL0VFMXpVd2pwN0wrSTBoN1Q4VWRweisvSE1r?=
 =?utf-8?B?YzJKL2tZZlJHSFF0S3lLbXNWaWY4MTZ1SHd6M0xwd3lvOFh1QUhhdG5zTkI2?=
 =?utf-8?B?emp4MWcxMEcwTnJ6QUQrSXk0emVGOFI1VHVUckRlclh6UjIyTWl6WHlMT1gr?=
 =?utf-8?B?K044bzRncDYwMWNMcHZscThVbWNrNDJIVVFVT0QxS05LT1ptWEFVQitSc3hC?=
 =?utf-8?B?OG00dHpFSTZHeTBFSStSRnJkMzRsSmxLdTU4SnJhc0l4QWFlSld5OVAxZmx6?=
 =?utf-8?B?ckxvZmdmeXBocDlBWjQvVnRHU3ljKzdHT0xvUVFyVmJIMnFneG9YOXhxa3RQ?=
 =?utf-8?B?azM1YlVjRW1GalpYKzFaUFRwM3Vhb2xGQWZUS1JiMGNtVHhaS1RkNFdSem5y?=
 =?utf-8?B?UDE1d0JzNDlZY2tPMDZYUmRZSk42a1VzN3JrQ3JKZk9lM3YvdkU1RVQxV3U4?=
 =?utf-8?B?OFJ5MFNtbk5hdTVINGptYWFvMkl0c1YxVU5pRVJUMEoyWTJIZ2tIMWxPcStr?=
 =?utf-8?B?eHVNWWRyRmlFVnUwVWRPWldaek9pZFQ1aGxtZ0tBdjBCUWk5TXdERDlTdGhq?=
 =?utf-8?Q?eDBOB2W8xqZfp3MNUjEA59HbB?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a361f96-5f26-4a60-9d5e-08de259ce55d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 05:48:13.0021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJPEIOR+5ulwpM+aUFhuE1tV4FG/pvS67FvUYmxfghXeboMtAQwRzOAY2yWJzhfnWhRR6IggqmCbKPh31ZC2rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5177
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

Hi Pranay,

On 11/5/2025 11:39 AM, Pranay Samala wrote:
> From: Adith Narein T <adith.narein.t@intel.com>
>
> This patch adds support for reading the Display debugfs entry to fetch
> display pipeline information used in the Display Top tool.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> Signed-off-by: Adith Narein T <adith.narein.t@intel.com>
> Co-authored-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tools/displaytop/README.md                    |   1 +
>   tools/displaytop/include/data.h               |   2 +
>   tools/displaytop/include/display.h            |   2 +
>   tools/displaytop/include/populate.h           |   1 +
>   tools/displaytop/include/utils.h              |   2 +
>   tools/displaytop/meson.build                  |   7 +
>   tools/displaytop/src/display_debugfs.c        | 124 ++++++++++++++++++
>   tools/displaytop/src/populate.c               |   1 +
>   .../displaytop/src/populate_display_debugfs.c |  96 ++++++++++++++
>   tools/displaytop/src/utils_driver.c           |  16 +++
>   10 files changed, 252 insertions(+)
>   create mode 100644 tools/displaytop/src/display_debugfs.c
>   create mode 100644 tools/displaytop/src/populate_display_debugfs.c
>
> diff --git a/tools/displaytop/README.md b/tools/displaytop/README.md
> index 299445a0e..34bab6772 100644
> --- a/tools/displaytop/README.md
> +++ b/tools/displaytop/README.md
> @@ -7,6 +7,7 @@ A terminal-based tool for monitoring and debugging the display pipeline.
>   - Terminal UI using `ncurses`
>   - Dump feature for all the menus
>   - Real-time display Configuration
> +- view Live Display Debugfs in a terminal ui
>   
>   ---
>   
> diff --git a/tools/displaytop/include/data.h b/tools/displaytop/include/data.h
> index d2698ecae..1c3e1094c 100644
> --- a/tools/displaytop/include/data.h
> +++ b/tools/displaytop/include/data.h
> @@ -35,4 +35,6 @@ extern struct Node *root; /* shared throughout the program */
>   #define DRM_PRIMARY_PREFIX "card"
>   #define DRM_RENDER_PREFIX "renderD"
>   
> +#define DEBUGFS_DRI_PATH "/sys/kernel/debug/dri"
> +
>   #endif
> diff --git a/tools/displaytop/include/display.h b/tools/displaytop/include/display.h
> index ee07694a4..bcf1bc0ae 100644
> --- a/tools/displaytop/include/display.h
> +++ b/tools/displaytop/include/display.h
> @@ -44,4 +44,6 @@ void display_framebuffer(WINDOW *pad, struct Node *node, int *content_line);
>   
>   void display_summary(WINDOW *pad, struct Node *node, int *content_line);
>   
> +void display_debugfs_file(WINDOW *pad, struct Node *node, int *content_line);
> +
>   #endif
> diff --git a/tools/displaytop/include/populate.h b/tools/displaytop/include/populate.h
> index b4056d084..340fb7679 100644
> --- a/tools/displaytop/include/populate.h
> +++ b/tools/displaytop/include/populate.h
> @@ -34,5 +34,6 @@
>   void populate_data(void);
>   
>   void initialize_display_config(void);
> +void initialize_display_debugfs(void);
>   
>   #endif
> diff --git a/tools/displaytop/include/utils.h b/tools/displaytop/include/utils.h
> index 3f5a1f620..8f771d7b4 100644
> --- a/tools/displaytop/include/utils.h
> +++ b/tools/displaytop/include/utils.h
> @@ -122,4 +122,6 @@ const char *get_basic_modifier_str(uint64_t modifier);
>   const char *get_connector_type_name(uint32_t connector_type);
>   const char *get_encoder_type_name(uint32_t encoder_type);
>   
> +char *find_debugfs_dir(int drm_fd);
> +
>   #endif
> diff --git a/tools/displaytop/meson.build b/tools/displaytop/meson.build
> index 082386198..a56f966f7 100644
> --- a/tools/displaytop/meson.build
> +++ b/tools/displaytop/meson.build
> @@ -38,6 +38,11 @@ if have_displaytop
>       menu_dep,
>       form_dep,
>       panel_dep,
> +    igt_deps,
> +    lib_igt_perf,
> +    lib_igt_drm_clients,
> +    lib_igt_drm_fdinfo,
> +    lib_igt_profiling,
>     ]
>     # Source files
>     source = files(
> @@ -58,6 +63,8 @@ if have_displaytop
>       'src/utils_driver.c',
>       'src/utils_drm.c',
>       'src/utils_search.c',
> +    'src/populate_display_debugfs.c',
> +    'src/display_debugfs.c',
>     )
>   
>     if meson.is_subproject()
> diff --git a/tools/displaytop/src/display_debugfs.c b/tools/displaytop/src/display_debugfs.c
> new file mode 100644
> index 000000000..9a36416d8
> --- /dev/null
> +++ b/tools/displaytop/src/display_debugfs.c
> @@ -0,0 +1,124 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "display.h"
> +#include "utils.h"
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include "igt.h"
> +
> +/**
> + * /docs
> + * build_full_path - Constructs the full filesystem path for a given node in the debugfs tree.
> + * @node:       Pointer to the Node structure for which the path is to be built.
> + * @full_path:  Buffer to store the resulting full path as a null-terminated string.
> + * @size:       Size of the @full_path buffer.
> + *
> + * This function traverses the parent hierarchy of the given node, collecting
> + * each node's name (excluding a trailing '*' if present), and constructs the
> + * relative path from the root node named "Display Debugfs" down to the given node.
> + * The resulting path is prefixed with the debugfs directory path (as returned by
> + * find_debugfs_dir()) and stored in @full_path.
> + *
> + * The function ensures that the constructed path does not exceed the provided buffer size.
> + */
> +static void build_full_path(struct Node *node, char *full_path, size_t size)

We should be already doing this in few of the existing tests. Can those 
helpers be reused here?

Regards,
Karthik.B.S
> +{
> +	int i;
> +	int depth = 0;
> +	char segments[20][256];
> +	char relative_path[1024] = {0};
> +
> +	while (node && node->parent && strcmp(node->name, "Display Debugfs") != 0) {
> +		char *name = node->name;
> +		size_t name_len = strlen(name);
> +
> +		if (name_len > 0 && name[name_len - 1] == '*')
> +			snprintf(segments[depth], sizeof(segments[depth]), "%.*s",
> +				 (int)(name_len - 1), name);
> +		else
> +			snprintf(segments[depth], sizeof(segments[depth]), "%s", name);
> +
> +		depth++;
> +		node = node->parent;
> +	}
> +
> +	for (i = depth - 1; i >= 0; i--) {
> +		strncat(relative_path, "/", sizeof(relative_path) - strlen(relative_path) - 1);
> +		strncat(relative_path, segments[i],
> +			sizeof(relative_path) - strlen(relative_path) - 1);
> +	}
> +
> +	snprintf(full_path, size, "%s%s", find_debugfs_dir(drm_fd), relative_path);
> +}
> +
> +void display_debugfs_file(WINDOW *pad, struct Node *node, int *content_line)
> +{
> +	int line = 0;
> +	int max_x = getmaxx(pad) - 4;
> +	int start, break_point;
> +
> +	FILE *file;
> +	char temp[1024];
> +	char buffer[1024];
> +	char full_file_path[1024] = {0};
> +
> +	build_full_path(node, full_file_path, sizeof(full_file_path));
> +
> +	file = fopen(full_file_path, "r");
> +	if (!file) {
> +		print_red_text(pad, line++, 1, "Error opening file: %s", full_file_path);
> +		*content_line = line;
> +		return;
> +	}
> +
> +	while (fgets(buffer, sizeof(buffer), file)) {
> +		buffer[strcspn(buffer, "\n")] = '\0';
> +
> +		start = 0;
> +		while (start < (int)strlen(buffer)) {
> +			break_point = start + max_x;
> +			if (break_point < (int)strlen(buffer)) {
> +				while (break_point > start && !isspace(buffer[break_point]))
> +					break_point--;
> +				if (break_point == start)
> +					break_point = start + max_x;
> +			} else {
> +				break_point = strlen(buffer);
> +			}
> +
> +			strncpy(temp, buffer + start, break_point - start);
> +			temp[break_point - start] = '\0';
> +
> +			mvwprintw(pad, line++, 2, "%s", temp);
> +			start = (buffer[break_point] == ' ') ? break_point + 1 : break_point;
> +		}
> +	}
> +
> +	line++;
> +	mvwprintw(pad, line++, 2, "-----------------EOF-------------------");
> +
> +	*content_line = line;
> +	fclose(file);
> +}
> diff --git a/tools/displaytop/src/populate.c b/tools/displaytop/src/populate.c
> index 7109249f9..7963523d5 100644
> --- a/tools/displaytop/src/populate.c
> +++ b/tools/displaytop/src/populate.c
> @@ -29,4 +29,5 @@ void populate_data(void)
>   {
>   	root = create_node("Display Top", display_summary, NULL);
>   	initialize_display_config();
> +	initialize_display_debugfs();
>   }
> diff --git a/tools/displaytop/src/populate_display_debugfs.c b/tools/displaytop/src/populate_display_debugfs.c
> new file mode 100644
> index 000000000..fc0ed8a83
> --- /dev/null
> +++ b/tools/displaytop/src/populate_display_debugfs.c
> @@ -0,0 +1,96 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include "populate.h"
> +#include "utils.h"
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include "igt.h"
> +
> +static void populate_debugfs_recursive(struct Node *parent, const char *currentPath)
> +{
> +	DIR *dir;
> +	struct dirent *entry;
> +	char full_path[1024];
> +	char dir_name_with_asterisk[1024];
> +	struct stat pathStat;
> +	struct Node *fileNode;
> +	struct Node *dirNode;
> +
> +	dir = opendir(currentPath);
> +	if (!dir) {
> +		log_message(LOG_ERROR, "Failed to open directory: %s", currentPath);
> +		return;
> +	}
> +
> +	while ((entry = readdir(dir)) != NULL) {
> +		if (strcmp(entry->d_name, ".") == 0 || strcmp(entry->d_name, "..") == 0)
> +			continue;
> +
> +		snprintf(full_path, sizeof(full_path), "%s/%s", currentPath, entry->d_name);
> +
> +		if (stat(full_path, &pathStat) == -1) {
> +			log_message(LOG_WARNING, "Could not stat path: %s", full_path);
> +			continue;
> +		}
> +
> +		if (S_ISREG(pathStat.st_mode)) {
> +			fileNode = create_node(entry->d_name, display_debugfs_file, parent);
> +			add_child(parent, fileNode);
> +		} else if (S_ISDIR(pathStat.st_mode)) {
> +			snprintf(dir_name_with_asterisk, sizeof(dir_name_with_asterisk), "%s*",
> +				 entry->d_name);
> +			dirNode = create_node(dir_name_with_asterisk, NULL, parent);
> +			populate_debugfs_recursive(dirNode, full_path);
> +			add_child(parent, dirNode);
> +		}
> +	}
> +
> +	closedir(dir);
> +}
> +
> +static void populate_debugfs(struct Node *parent)
> +{
> +	char *selected_path = find_debugfs_dir(drm_fd);
> +
> +	if (!selected_path)
> +		return;
> +
> +	populate_debugfs_recursive(parent, selected_path);
> +	free(selected_path);
> +}
> +
> +void initialize_display_debugfs(void)
> +{
> +	struct Node *display_debugfs;
> +
> +	display_debugfs = create_node("Display Debugfs", NULL, root);
> +	populate_debugfs(display_debugfs);
> +
> +	if (display_debugfs->children_size == 0) {
> +		free(display_debugfs);
> +		return;
> +	}
> +	add_child(root, display_debugfs);
> +}
> diff --git a/tools/displaytop/src/utils_driver.c b/tools/displaytop/src/utils_driver.c
> index 53fdbec19..1df23f6db 100644
> --- a/tools/displaytop/src/utils_driver.c
> +++ b/tools/displaytop/src/utils_driver.c
> @@ -23,6 +23,7 @@
>    */
>   
>   #include "utils.h"
> +#include "igt_debugfs.h"
>   
>   static int is_driver_loaded(const char *driver)
>   {
> @@ -168,3 +169,18 @@ void check_and_load_driver(void)
>   	else
>   		show_driver_menu();
>   }
> +
> +char *find_debugfs_dir(int fd)
> +{
> +	char *path = malloc(PATH_MAX);
> +
> +	if (!path)
> +		return 0;
> +
> +	if (!igt_debugfs_path(fd, path, PATH_MAX)) {
> +		free(path);
> +		return 0;
> +	}
> +
> +	return path;
> +}
