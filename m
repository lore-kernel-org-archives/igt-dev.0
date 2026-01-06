Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49188C47BCB
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 09:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C0310E0D0;
	Tue,  6 Jan 2026 09:07:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RC3jeLHG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0258D10E0D0
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767690467; x=1799226467;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LEioVKLRHiG7A4rvorNxBnKul8sfliuwTHNflWRrr40=;
 b=RC3jeLHG85Gz07TSpUWMPKKNIfCwLccLOlahtPCQLPJ3UAQzQSVxieth
 gHiIFb6PwFcpkwafKGhv4eSBusv8zQPsI6a8astCeREP8kBEMpJUEDrXy
 2uUJLmLZbAVNcvHKBWDGDzon/G+vadI0aFM1ZoaBmhzNw97DTawFHhZUx
 2PeQPbxIV2IQNUpP6mpGbwNrEXRVWEMFUyNl/ESp0IGwiytm7yk3QFXzN
 q/6DZV9jtwqYuQ/e6aaKaFK2CPmgmb57nFhbYJsd+0cQm7aHMaVLOn6bm
 1utw3/57JTHAa+hMwyYcTNe8OIHv1Dq57CtLuXf77NzSVexpUBnRd/ulu w==;
X-CSE-ConnectionGUID: ZHZq/Ri9Sqy29fFfxIK0+Q==
X-CSE-MsgGUID: m9PQiVBfSGG61iBcExw+tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68795810"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68795810"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 01:07:47 -0800
X-CSE-ConnectionGUID: xLhoFMugTXuJAM1q7jrPXw==
X-CSE-MsgGUID: vuUAqt6GQ6eOUEAEWeLSeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202234413"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 01:07:46 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 01:07:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 01:07:45 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.61) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 01:07:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zIuqZHdGXV0+T0Odl8W76P6S+xnLY5H8fzQMT47jkBYsieVuGj9dfqOvQIZ+TzHq+gly5OvAEEjDFz9ejmlUN7SHNFESw9S+oZAUysR4uxK1U5oDTCHAI7YJHbyEfHmYocuPpICR7c7QYH21cTFrgW1+MVeTCtm5Ho3Rl0A2BAb5SMpELm2dBA3WCr+gu3n4ZJTaXQkLx/S5gBf/YesFe0/m+Tb7KANKDmkMQU6vAnzaQrPopYi9A1vjR0jKYpHepmI1oFcFk6TmM4WuibDxLB9XHCgIpvd+tWHBdS3iEA/jn/+LIO8Rw1Jpmr/c2VgI4ECSgeew6v3o4CCvyRI2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJV13TplW36RvKVSqykxCIvD01fKH95BxhwENU9A3io=;
 b=qrzSKNDG4pdRT+34q9DUpLGsJNH9LITonP8Qrw/JkgaF6MTdYNNvznxAhW493EZ3f3b5Dn5xbi92rs0uClOQ67qKOGxyApK0SyUXwgj7SMP4EoJ7GO1Yjsbc3rMtizc5Cj6PyzwlzyNonlwuwh7r4l9TUUuzEqvpKdwWItqkanx2oiPRPgdAGPrUeYYKWJcgg9RrYMGhqVCHIeG4Ey2J1UWDBiEtSGk0zbW3k1i+Idnvc7LmiPvIxaXDZfIfR42ddWmUlBAVDYRTRp3wlmYWYAHsvLeAWQkIYKMrvcrxnz4piVlYlVVTF3YA6kLj3ob7282rMga/XUcRIz4LdrDyZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 IA1PR11MB6491.namprd11.prod.outlook.com (2603:10b6:208:3a5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:07:44 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:07:44 +0000
Message-ID: <f5c94af2-b045-46ec-a5eb-d3ab65d5084f@intel.com>
Date: Tue, 6 Jan 2026 14:37:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] Avoid crash from uninitialized pipe_crc pointer
To: <igt-dev@lists.freedesktop.org>
References: <20260106084906.31185-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260106084906.31185-1-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::15) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|IA1PR11MB6491:EE_
X-MS-Office365-Filtering-Correlation-Id: 29fe97b8-fb70-475f-1daf-08de4d030d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEJtWG0xTzBuWVVtR1pGeHRITngzYk5lbFJoRHY0N212ck9aZGw5cVJrdE1J?=
 =?utf-8?B?bmREWVJYVVA5MmNTeU5DcHlvSWFZL2luQnc2SEhGWlJxZkhpay9jTHlMalo3?=
 =?utf-8?B?YVRPV2N1V2t4QUdCbzJ3VnlrR0Z5NTgxd3Zia01nSEtnc09WU3dEdEt2TVVE?=
 =?utf-8?B?MEEwdXFEM25XVkhiK0d2RXBCS3UwWk9yNkkrM2VNNGtFRUVNYXpON3NHZGRj?=
 =?utf-8?B?Q2tlUmVobkdIOFQzU3FHbGY2dWdMVkNVbEJScElxcTUvSVRFTk1zV1NWMTZj?=
 =?utf-8?B?S2w3cDZ4eHdkcU8ycGszNGNRS3d2WUh4RW5Cb2tQM2lUZE5wMWllL0FNUXRv?=
 =?utf-8?B?VXF4cDNaNTZvMUZBb3JmaWdmMGtxd2hYSnpia3BIWldjaFpuYnBnMHAvQ1kr?=
 =?utf-8?B?dUQxakowb3VsTWtoc1pIcXlINjIxc09haGRuU283akgvalZmVTh5c2pWU052?=
 =?utf-8?B?R2JwVnpFa0szZ1ZkVFBvdXZIcDYyNGkraVRxN3lGNktWLzJDaVdoazNFWTJY?=
 =?utf-8?B?bmFDU01pUitCT2ptaUNPZ3RrVXlhd2pxcEdrYzU3MVJxTEVaeExETFBhd04v?=
 =?utf-8?B?MHRqYVNwdWJHVjhvUW8rSEFrVFRzZWk1b0NVL2J5WEQybFphek9yZlFjOFNP?=
 =?utf-8?B?M2xJNlNITk9TUkd4Tmc3SytaRW5Sek5VcVNYLy9lenBnLzR3dHl2YmxnZWMw?=
 =?utf-8?B?OXJKYUdUcFlRYXhtckdaMnExUTJDZXpnM1lOK0xDNXp0bTN3aW8vOXc5RHpG?=
 =?utf-8?B?ZEhaVWVZcUM1ckh4SlRsenhuSXpiYk5wVEdSY3BtUjBXNDhxNklYSmY4aXlj?=
 =?utf-8?B?d05BTWdJOGNzREdBeDI4a1pGTG5CVlhQUnZkV2J2S2NZN1RDL01Pb3ZvTkYx?=
 =?utf-8?B?Wm9HUllvaG5CcUs1MjFVejVjK05PZkpOUU9GN205cDY3UXpmT3ZMMFh6Mmxn?=
 =?utf-8?B?L2VYUE1xTXF2amFhdTZjN2p6YlJYMStMSVUycGd4OTV1UjhyQmpJODYvT0dL?=
 =?utf-8?B?cWw3ZWxhVEpzNnhMei9jSW44UFFZSmQrT2o0V2JPakpTMUp6TTUxMHZPQTZR?=
 =?utf-8?B?OWRNb1JMakpScXcwZXpsTXk5YVZscGFYUE1rTG9TazIxOTFUYjhPK2QvTGh6?=
 =?utf-8?B?TThmbW03ZGNlN0JSdTE5dnNvNVRuem5icS9PMGltV3F3QlVWN1NCRW1UM2VP?=
 =?utf-8?B?VFRoNXl1bnVacEVNNS9tMVlLc3c0Nm9kWUd0RmdSb3JSTjhORUNUQUQva3RC?=
 =?utf-8?B?VG5PSVpXTjN0Zm41akZJdXlSbG52RGpuRjFCbW5ybVpRL1NEUmo2SnFYY2Iw?=
 =?utf-8?B?S0YrbUtjTHRvUjdUeU1RSWFvYXZqbkVONEI0LzNoZkpKeUV5RGhZUWtaQXlj?=
 =?utf-8?B?dm5ZT1ZRRm9BUHFhZHdXeWxPNlZPMW0zejZnNFg2RlAxbm1LYng4c1BLeE9D?=
 =?utf-8?B?VjBxV1hhb2prZlJWUlNKbUp4RVdHK2J0b3QrbkxINktIQklXRkpzajhNOWty?=
 =?utf-8?B?M05Ua3RyNmU0YUl3ZmhmSFh5eXNZN3RjYk5qZCtEaS9DVEorR2ttQkl1ME5M?=
 =?utf-8?B?djZGbE1WRTBHTkxubW56R2czUDNIU1ZSaEdOYlVPSFp3MlRnQTVaMGpjdzVp?=
 =?utf-8?B?TTZQWTZ0aDhaT1k1TE1VM3ExeDYzQmF2TEdxNDBsNFZBNmJMaXhMWHlidlFt?=
 =?utf-8?B?VHQxSXlBT29YTzhLR2RUUFhaT2l4dnhVR0tEbGo0UURuR3lLNXZpOG9kOWxW?=
 =?utf-8?B?L1hDeStPR2g4UE02M1hrTDNSWnN2bXVKZEZEQW5PWlQ0VFp0ZDBpYWcwMGRx?=
 =?utf-8?B?NmdWOGFxVlR3eFhjNm5GaXAwaEhUZmJpL3RwUFRML1dReGJ0S1QvTjVrb1lj?=
 =?utf-8?B?MUY0TEVFd3RIZFZyNU1iWFl1OXMzaHNMd1gweTA0OW9qYUN4WmNjczdHVmVO?=
 =?utf-8?Q?dAwAf0GrgtzsauSx47dhYMVNbh7Re+9W?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MW9qblBqa1VOV0lFMm5tOTltWDJYRGFYQ3dBUFVTSldnQStzYkpQQjFZL05J?=
 =?utf-8?B?Y2xHVWZpTThVSnZVVjZxTXpPTUEzR2xkTFVuQ01Xcko0UTIxKzRhMjAyNURy?=
 =?utf-8?B?enRtNExHMW5ZQU10aGpUZVJDNE9nUXpiK2txTFQ5RkZQcnhjcEpMNVJCRG1Q?=
 =?utf-8?B?Z1BGL3UvU1hBUVhZbkMxKzhSMzROclBTbWlERTY2enloQk1IRmpqVnRWN3U1?=
 =?utf-8?B?M2JpSERWNHVMVDBzVnVUdFlaRE1IblFCVVFzOGVRbm5Lc2tqN1hYNDRNa2ls?=
 =?utf-8?B?dDA0cEcyMkVFcDhrTVdtbi9DZk5uNWgxWGpYVUtPbEd1bUVFNXFOVy9sNGw2?=
 =?utf-8?B?ZFJEdk02Z3dkcnZ6RzE3dk1GTzNFR05SK3J4SC9WeHlFT0FyVnc4bTFVanlV?=
 =?utf-8?B?c0tUUmNSdXF5TGpvRTVGOVZneDd5Njdpd0tJNG9NdEdRbnh4cHB4RjRkSDdR?=
 =?utf-8?B?Y0ZkcnJJU05GckJBSnVSTmJhU0QrS3NjQlNlSmV4ZG13aEpqaXlQOGNtNER0?=
 =?utf-8?B?Nkk3M0s3WUdMNzJjTEZpUlJFb1hCdXdTaktiRzBzelgzV24wRmp2eEk2MGNS?=
 =?utf-8?B?RlhjOEN3SFhDV2dpN3NrVDgrbVVxeSt6NVh5QStHUDh0dVJRVTd1TlZLQXlM?=
 =?utf-8?B?eTFRY2dxK3UwNnN4cXRxbWNOY1JhN04zMTFoL1pCbFZMR2xuOUZDMDh3RnRx?=
 =?utf-8?B?UkZDclo0dVdnYk1mUzgwOXQxNVRaUnB3QTVYMDJERzdhUVJaOUljTUZtTDRW?=
 =?utf-8?B?RkdBc2gvdVpzN29JYVkzUWxpS21hUllRRTZGTGdEeDE1emRhQml6TysxZWkx?=
 =?utf-8?B?OWdHVzBxb1JiYkp6K3UwQWU1bjZ2VDd4cjR1dXNJWHFzWTFTTUtKaVpRcmto?=
 =?utf-8?B?dStVaXpvYmttVDB6M3ROaE5UeVNEWTRTVW5KSzVLMG1NN2JneVF2eDBlTWZF?=
 =?utf-8?B?MWI2MEMwMk94dVpIOXppZzJFN1VLamdzZEFkS3BPQlNpODI2QWs5NWk5MmJG?=
 =?utf-8?B?ZWhMcWRndFAyUU5YYWlYejBFZEdrRTVEQjZRYU04dzdFYmY1dHJhNUJTYjhW?=
 =?utf-8?B?clFJUGdaZGFxK2s4MFY0QWNkNTJsNEk3SUw3WEFLQkg1YjAweWFDWUl5bkhs?=
 =?utf-8?B?UDl6d2RvWjg5K25YdVpBeGdvdTJ4Yzd1dkdCZ0ZoSXlDR01EUEUxVmdwUTVw?=
 =?utf-8?B?KzZkQU1CMUFmc21hbDRKNlpvcXhnN3N6WTRTb2cyNUlJc2s3Uk1LbGJUR1o0?=
 =?utf-8?B?MGRjZVV0cU1CMWtoZXZyZFJrSjN4dXA3OVo2WUFIYUt1ekVIM1F0amsxUkRI?=
 =?utf-8?B?OFhhVEJiUGpCb1duTy9TbUZKQXJxbmhJSWlUMDdHT2RsVjMzOU5kczM3VGd3?=
 =?utf-8?B?Q0FUL0x6UWNFR1UwSlB0Q0szcElUdkFjSFU0YU81ZVFuaS9GL29jMTlBUDQ0?=
 =?utf-8?B?Skd0a3YvcXJTN0dsOVZWTWpSTERTeXpiM0ZhR2Q5ZVhvYnVHbC9kQkkwU1Fq?=
 =?utf-8?B?cHhyam41ZEJoY3lvOEdyQ0dWcTNlMGtqWGtvZHQwN3V0VExLQ1UvNnJWRkJl?=
 =?utf-8?B?SEdJU2c2VWl3TmpodlVaZjFJM2tNKzNYUU5QRStvMUhBVmtmaHBldjBYS3JR?=
 =?utf-8?B?YUJmSmpCL1lYWmZhWGxSbDA5SUowT2NVQWpiRVRZakd6eHNVdHA4NHpJWllk?=
 =?utf-8?B?UExNMDdKSmRtT3dVOExidlR6QjNQWWN4N2RHejFkZFV0OVZrNUZGdERiSm5D?=
 =?utf-8?B?d3hSY3BZZEF6cmVqdmdIQlZXUHdaUmF2YlNoYnpjZTJUZGVQUldIMnVuOWpI?=
 =?utf-8?B?U2pRRnZCOGpmVjh4cCtqRlp5L3JkTnM5WTFGbEw4UmRaTU53YjhYckw0V0RY?=
 =?utf-8?B?UEpuRHBDajdtRlluaFp3UUxXSWpsYnhERmJTWFI2amw4bk95YUZDNm5ELzYw?=
 =?utf-8?B?U2NPdklSd0hyc3F3VU4wUjMrSmlpaXpyRU9KdnJJeEJTUkxnMDFvcVJDNXg0?=
 =?utf-8?B?Zk9TWW00dk9Kcm9rbEhwVmlEU1hPS25ZaWZqOHNJVHpvQUlWUSs0dDg4dlpH?=
 =?utf-8?B?UG82Q2VIL2VSLzdhbGtPYmVJUUlqM2MzazNycWJ0VE9BTHFHbkNySGVkMXBm?=
 =?utf-8?B?LzFuaGxJRlJGcCtFUEhxTWw3LzkvVG1HSzhhc1NaZGlqa3dtRXNWUDZ2aWxI?=
 =?utf-8?B?M2tEdUUrY3JtdFFheWVndElZVkZjSlJzclpHTS96a1pOUWVwUldabXVHMk5D?=
 =?utf-8?B?cVJjT2FBU2tZbFdXUXZLNlNab1B5dVQ2WFl1MDNZQlM1M3huZkVNelI4ZzRE?=
 =?utf-8?B?QkQ4Y1BTcXJ4aW5wMEQrdUxOeEEwSmpMZW1Cd09YdW4rWUt3OXk4dG4zSWRM?=
 =?utf-8?Q?zOOAnAS6yy0cwk/EOIRvA+m40Q+LOE2MirvtO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29fe97b8-fb70-475f-1daf-08de4d030d56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:07:44.0169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpDB7geWz2s1Xr+2pCKvUoEMlYgyTYzhMrCL+eqIaSvtBPQ8lfkyNUas6Iy5x9ENOHXKbaWwf0wAOzbBckbv9D1fzdt6cdDyiNq0JzkM7G63MfAP/pVclczZ5hkuWho2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6491
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

Please add closes tag if issue is known otherwise, LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

On 06-01-2026 14:19, Pranay Samala wrote:
> The data_t structure was not initialized, leaving pipe_crc with an
> undefined value on first use and could result in freeing an invalid
> pointer.
> Initialize data_t to zero so pipe_crc starts as NULL and the
> cleanup path safely manages the CRC object.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/intel/kms_fb_coherency.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/intel/kms_fb_coherency.c b/tests/intel/kms_fb_coherency.c
> index 59bc29d19..ca915bc16 100644
> --- a/tests/intel/kms_fb_coherency.c
> +++ b/tests/intel/kms_fb_coherency.c
> @@ -238,7 +238,7 @@ static void select_valid_pipe_output_combo(data_t *data)
>   
>   int igt_main()
>   {
> -	data_t data;
> +	data_t data = { 0 };
>   
>   	igt_fixture() {
>   		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);

