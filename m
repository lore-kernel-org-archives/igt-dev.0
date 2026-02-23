Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C58EA4FC3
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 14:12:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB56C10E3E9;
	Mon, 23 Feb 2026 14:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VM6X1+93";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99B110E3E9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 14:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855936; x=1803391936;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=aBO5wueihtZJ+CUGDX33M+PYj3cCMFxtMCY/jYji0DM=;
 b=VM6X1+93RWGa7x8LnL9+FDtRbBEOF15otSS7s6vFoYcAAW3CC1Ta7VZn
 2IvYnK0b8vmFdb/Z9gwN7CHp2FMiLEVXP6DVJPkwV/QHIVNA8vgSa8DCv
 CP/E+6WLVrulER4InFKrBqpZH41tf8xKudtPCJPRUkUqm5L+9vih2pASH
 xJV4eQH51iUuKjD7dIn5ozTayXWJTKNeu29eZX2TKTrlJpbsDzQBtWmxg
 3vpWMLNLiiMmLJ08xw9/t0IT3ghQ1ri7/v5XZhXBZ24ppPoy5sERAgIUs
 k6D3nwARahP8AkSBpmCCuFlFUTTajbWBijVFb4EP9Z+tjs5Hd+RHdcmKT g==;
X-CSE-ConnectionGUID: AAypjg/ISOCCBRMWPaz6rg==
X-CSE-MsgGUID: JhMcgo12SZ6jOJmXJMhs0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="90435528"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="90435528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:12:16 -0800
X-CSE-ConnectionGUID: 5g4ZkXrNSIeXB5MF7Kbe9Q==
X-CSE-MsgGUID: /ZFeb81KQHWBHP4cCwSGEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="215420150"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:12:16 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:12:14 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:12:14 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:12:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss/FmGk5teEl4swzSpIQcYcbpcd8FMEA7n49vi4T6a6pKwI31Iok9j5bQkCPHl9ffOQD8+i1DEqFIviEfAOAZ1ptTHoe2pECsyzOB1QMfMv/8Lgo/6HNl+e83yDsiySNcIuNj3oojXIp3sMkgRXNeTeAlPLyV0BHXxntvnjLDqsgkxgmEsAuaaqRN2CADVanYrBsam8xXcJD2h2O8Zx5RHlw9sxrgvx7n5/f32mnzKiHMQkKGQlD/DXrQhjav939Bl45IV4ZlIXtqpR3A7D0IrkxYCBfWDWAj9SIX62aPI//wOeyUgCeHZqEp+j2ph2rtMZLTRf3BfxDA5iBwjslmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=625TGxLHcAMVRUrE/3irB734+ngrF/yQbXMGx66OKN4=;
 b=hnuCebeRhjgh+RyQ7NGgDA/fzFWFkvKTQMIqBYXyGRDk3fFWv83VXEvxnLgo1qzs6Fdajx3fSu4PN1iKMIoDca0opp1J7OuDbJjsqi67D3yk0N+jXsKSx0Od8TA5Fsan+FfaDUqltCm4UVyMG6WHBTgwBz1xrsl+SgjEo5zuvVGnM7STh+xBvCLAat4BX5JVCQaiBq+lTZ1gdL0iXiExOnF+amNZ75/U7+XgHPZYRJ8WobfCVVJQopHatIRqKmQFWwT7piXsBlZXjmot3X+NKIr28HB1Q6yb3BiXBFHAJtn9wtUzihIx4Ykq2skqIv8w+R78lXRQCJbNFK56UTTnRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:12:11 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:12:11 +0000
Message-ID: <34ab74a7-d565-40cb-8524-11b5fde7fee0@intel.com>
Date: Mon, 23 Feb 2026 19:42:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with commit 4d33c77cf2c3
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, <kamil.konieczny@linux.intel.com>
References: <20260223040859.1362813-1-ankit.k.nautiyal@intel.com>
 <20260223040859.1362813-2-ankit.k.nautiyal@intel.com>
 <aZv2lfOVe0XD5Nv_@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <aZv2lfOVe0XD5Nv_@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ae7b6c4-2c1d-4f0f-a295-08de72e5896c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVlSbjV4TkxqTks3bnhjWWNrM0JndnhVVkZTanVCNDJDUFErYjB4QjdEbkRF?=
 =?utf-8?B?WHZzMjFWNHVsN2FXS3liVXRaTllTd05YcFVCMVpWeDNIZm9jM21mNk9pNW1a?=
 =?utf-8?B?YUM3RlJrdGVsUHJ3QVZHQUdPOTF6QnJhOWlXdTlvSGZDWmpzUW5BTUZQcGNh?=
 =?utf-8?B?dGpWc1doRnRCYXdQaXlKa08zQ3FFWE5SWnZ4VzY0NVZaYlA4WDJTRE9XL2Rl?=
 =?utf-8?B?UzRTaERKOGtoQWlJb1Y3MzgxbDFQcUIrODB4L0FFZW82dCtZdVAvV205b0dr?=
 =?utf-8?B?Z1NYVVFBdmlqakdUS05qOEpxcjltYk1mcEpWOTQvencvczUyN0NJTk1icWJw?=
 =?utf-8?B?S1VBVTZiZmNpRVN6clR0Q3Q1enROalhrYUkrY09tTDY4RUk4ajR2cHFyb21I?=
 =?utf-8?B?RjZxQVZrSzF6N3A0S3Y4TnlrejFTWHBrNGl3UjBzQWc3ZnFMaGdKcDZCamh1?=
 =?utf-8?B?L2hQUmloYmwybklkSFpySnl0dFZPYWpleDNsc1BhNU9FSGJ3NHlwQzlzVFJl?=
 =?utf-8?B?MjRraktLOFlHY2V6dFFBM3YvV3NJNzNEdTdoeDJZSmNDNVlqU0E4RWFhUks4?=
 =?utf-8?B?aTByVUt5U0M3NE1relFsT2E1MGN6WnVTY0ZJdHAwV0Y4WVJ5OGN3dlJVMXpl?=
 =?utf-8?B?WjJyVGg5cnZWeEZkby9sNk44bVlzOVg0allzQTY4dTJBZ29rcHB6TlNFSWQv?=
 =?utf-8?B?UXpEdnU5MGY4QlpYQ1VjWnhOdFNvN2phbTBLQkErTDhZZjF2TjUwOWtUSkV0?=
 =?utf-8?B?dGFjSVdHZHFScEtDN3dsaWlST2VUUGNSN1h0aWRXK2RLWVhHRUI3amtjZXI3?=
 =?utf-8?B?RlFyU1hUWGJTRDdidnZnSUgrazk2QWRucGk4RWxBbUEwTWlaQlJCeklRaWcv?=
 =?utf-8?B?b0VMOWNjV0o3bWNXR3lldE1kcFlJMnBnUlVDakdMNFNkeVRQMVM3STkrdUVy?=
 =?utf-8?B?Tlp3ZUFoNmZUQjNiaGE3Q0tNd29Qc2xIdkZGdFhMS2tpQ2RxNGVIcWpTcng4?=
 =?utf-8?B?bStlMFdMY005dzFsdHdxMnRtdVRDaHF6blN2dTVHaEMwZW9JUG03RkxWcUF5?=
 =?utf-8?B?Y1VuWXh0OVd1Mlo5N0l6cDJxeWVDZjl0NnV3dkswandpZ1pxZFBNZGJGSkkr?=
 =?utf-8?B?VUlWM1dIVEsrQTl0aXA3NHpFTk10RHlxelRZbWdTVFg4WStSZGErMFNJOVdG?=
 =?utf-8?B?bFdJdWxmVkdlTlpiTElpeVRJMy9TWTl0OW9FamExM052WEtWYXk3WU15NW40?=
 =?utf-8?B?SFRjS3FWeTdyQ2JxWmR5SXF6WHQ5c0tVaTZLTHZCSWc2ZHFtS2NQQnhscyta?=
 =?utf-8?B?ZTNJclZIUzkycENJNU10QytrMFpHWnRsL2s1N216TWxrWk5BMEN6djhBK3VI?=
 =?utf-8?B?Szhsb0x4b1UzcHlSeE9xWitlWkdXZnRqaWFWMEN4M0piS1k2LzNYRDlCRUVt?=
 =?utf-8?B?VkprQ3lOcVVmU2JSbXF1Yk1oMDFHbU9WMnF1amNGeW93Z0dnRlpmTXJ5Ulcv?=
 =?utf-8?B?SEF0STlnbXZEYjZtZHZKc3VWYXExL2xWY3I3bXR1eldJU0tyNWxROUU0Y0Zu?=
 =?utf-8?B?UWpUQWJBL2NhWk9oc0VPT2pRdmFueGtFbERTYjdmVEE2alk5OGhqcGJKc3ZT?=
 =?utf-8?B?bjlxYkp2cXVOcWpubXlTbmt0cnpmaDZGdVJ4Y2p1L2lvM2JZTU5mL2hzdmMy?=
 =?utf-8?B?czJsSVZHR2JyUHRRSkxTcWM1RFUwOUNhd1QwTGRVYWNreHNLY2dCeVl1WHJ2?=
 =?utf-8?B?RU1YMENTcDI1N2o5VDRyZGJFQWlENCtDT0I5dk42bVBJeFlTa2JRQXVxUFZo?=
 =?utf-8?B?a0hPemJjREFWRHN3d3FyZisyNHNEUjBBdjNkVGM2S1drYklBVURWQy9rQ0or?=
 =?utf-8?B?ZVpNc2Q2dXZyT0xBM3BvRmY4ckZCU2d3OUQ1TlcyUkxPTTZubWx2ckJnVXI4?=
 =?utf-8?B?ODR0UlJ0dVprVlpXZTIrai9jTm1XTzNhYVpZMCtvdjhHWlRlSUhFMkdsQk5T?=
 =?utf-8?B?ODU3Y0VlNWs5RE9VdXd4dExxOTIyWG5uUzVwSGFtSUNZTzlpbFI5RXREOWJC?=
 =?utf-8?B?VTJWcFo2WWQvUjR4Qzd5dldIcDFOSTd1VWdVcDJKS2JqUmVkM296OEZPcWFw?=
 =?utf-8?Q?K/TE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blB2RFk2dUJOcUtrK01UdzBaQ29QdmxoN0ttUFJkTDk4WEtPQ3QzZTgzdVox?=
 =?utf-8?B?TVpIUUFDUFNKeFFOYnY0b2ZGYXFoTXJCSS9lZHVZM1Vpb094dEh1Z2o4dUcv?=
 =?utf-8?B?MU1ZNmhiWXhBalZ2ZE8zOWVrNXJGOHNubGxadkFVNHhIOVVYMFRDcnhsTDBT?=
 =?utf-8?B?cW0ySHM1alFJNElvNit6TWpRU0tjUUozTFp5SFRxN09YMk5reGlQY3EzeHlU?=
 =?utf-8?B?Um4yaTR3MTFUOERFRWdKdXZ3V1ZKZVIyVEVwQlFYS1RPZmx1NjRYNE9uYlNC?=
 =?utf-8?B?cHdOR083OFJjcHdFeEFTblFpQzgrYU1EbnNNUmU1R29aM1h3dk5MMGZLaVlw?=
 =?utf-8?B?RWM2NnlEdEllYVgrS3NkM2thbG91NzFsbW40T0V6UEtWK2krdG9NM0RRZ1U2?=
 =?utf-8?B?Y1FwMGFOL3VlUDJXUnhPemg5ZURYbThrUzlSNWJDVFQ2R0h1V3V2endaVTR2?=
 =?utf-8?B?ckhRdnBlZHRUazZoSHhTK0FTNDlyby93azZTN0hqZnFFeVh3SXhlbmwxQnRI?=
 =?utf-8?B?Sk1DeFdTWlZ2OURKck45dktKNVVLenlpS1FkaTJ1ZC9KSUxxN3JpNGVDRWFw?=
 =?utf-8?B?SDN1VTBSdkV6NW1rTGhteENYbEl2cjZuM2JNclBlc2NxbkhXSXFHQlFDY1Iv?=
 =?utf-8?B?aTNGM1cveWhZQjBIY2NOUk1vOXo5eDVFN2N6V1ptWGNGeVpOemdSQVV5Q2xY?=
 =?utf-8?B?YVpkTVNVRDdvOUJhL290bXpZeEE2NkhBeDhaNmlNQzFVajVTZHU0OXJkRVBW?=
 =?utf-8?B?OERndDc2Z09aOUNzOTRMWDRHakFscWZPVERDRGxiUVRURksyU09XS0tIa08z?=
 =?utf-8?B?RkJreHlJNWI0eVhKRE80SHArYTBuTzJwcmx3QmRXQnQrMTFPSW0vOGo3eVR5?=
 =?utf-8?B?S2ZJWVpiU3dhRHRYeXdtdFMyeWNRd2o5aldSMnV6M2l3WEFUa0Z5bjBwamhz?=
 =?utf-8?B?cVQwTCsxSnhzajdGdUo2SEt6UnI4V1RtWlZ1Z2NyTXZaY0dGczllbGoyWFpl?=
 =?utf-8?B?QnVTZkJMaVg5a1o2dlUvczZDN2JRT0o4a3hQT2ZjWXJFWVIrVnUwVmcyUzBI?=
 =?utf-8?B?K01zbFQ4MjM0bVBaYXV3RUR4MXB0M2pvKzhla1pRSVhzYUlxdG5oTTZESEQ3?=
 =?utf-8?B?STQrZk1SNTJwcXhLS0N4Mms3SzRWR0h5SFIvbTJhTEhNNkRzcnd0ckVvOUw3?=
 =?utf-8?B?OEFicjZQV08zdTh4YSs2TVBuaXlvWUkwU3dIcFBsTjdkemk1ME85WlFRRlZF?=
 =?utf-8?B?eGErSjducFBIeHBEZTA2T0F5blNtYkNNcEgzam40SmpwbzBBaVhuRFErQS9a?=
 =?utf-8?B?ZDN2U0VJZE4xYnJlVDJNWk5EbGNWQ2RxTFVKeEgyKzVwTHJMMHdPZ0J5WlI3?=
 =?utf-8?B?R3JPbHZ6ekpGM1FTMHNjU0lHOUcwNDNqMlQvSnR5cW5PUElyWTY4S0JFT1Fx?=
 =?utf-8?B?OUNsK2Yxb3JiMXBnYUgvRDY1SWo5SlNBTlovVHpRbmozbEJwQWl3aEpEcytH?=
 =?utf-8?B?RmEvT2dORlBKbHBzNGMxZ0dkL2VEZjBueDQzSEFQQUJlMUx2TFllT3Z5TVlI?=
 =?utf-8?B?YVlMSzlEV1l4ZnVMYVlwdmZiMG9POWZOTThrYjY5NXRSUi9CVDA0dlFJUmdi?=
 =?utf-8?B?cjlPa0hUdm5HYzYxV2xIREYvUHNwNWRQblB0aDExNDN2K2NoOGE4S2JWNWJS?=
 =?utf-8?B?bWNjektTa1orQzBFZVZiY2luanllM2FsY0NsSWN4TnlZQ1VBSjZjMzdhb2hn?=
 =?utf-8?B?eGcwL2hkbWxSemluSUV0RzNhRVRIdXZGWHo4M2FVVUo2REdBM1VOQTNvRUtq?=
 =?utf-8?B?NGJaVmx4RmlQcWxDMDBjai9IQ1E2Rkd1SjZjcHhPMDU2RXlIemcwbkpEVXZs?=
 =?utf-8?B?NHV5K2d0bGF3UlFIL3YvcGJLbE96WWptQWxlbTNmYjdnbG5BUXkvaTdhd0Qx?=
 =?utf-8?B?djNGREZoSWpsMFZYZmlKdjlOMzE3WVA4ZitWQzBRYVRpVkovT1Z5YUxBZWYr?=
 =?utf-8?B?Q2tuM1lQQ2NoYnNvdzZlTk1mY3hTNDZIMDZjZEtsbFhZNStYYjNEVDdXU2xt?=
 =?utf-8?B?c1RrRHZ0UDR6MnBaR3J5UVdBZ3cvUmo2cWMrNUcyZG9JSVp5Y0NBbENyNnBN?=
 =?utf-8?B?UW9hbzJCaXpKYUpoWTM5ZlBrWlFsZHJ0YVlqQVd5bWlEcU5rM0FEdGhhVTdl?=
 =?utf-8?B?R28yeUZsczBkRlJFcDgyVGVDT1VCRUhxRm9nVW5FVTdLaEx4R0t0MVhkUC9z?=
 =?utf-8?B?NjZyZ2Q0MUdTK29rdW14T2l1SC83UnkrYitvem1DK2hkWXVycmw5ckZPSVEx?=
 =?utf-8?B?dTlCek5ZejhJT2xrRkk4RUFEN0JncEtUbU1uakFSbk1HVU1ERFFpb0dlWi9p?=
 =?utf-8?Q?by7L1WYRU2apdA4A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae7b6c4-2c1d-4f0f-a295-08de72e5896c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:12:11.5761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bnteVdzQYuuXM6E4KX15k+QUvyiA9ext5XkTPN/n9EXXzgF68jZUj201M8TQ4nZ2+yTlM7WjseWwU5TbUVEwluyYmvMB3zweQRGTBgaYrI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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


On 2/23/2026 12:11 PM, Ville Syrjälä wrote:
> On Mon, Feb 23, 2026 at 09:38:58AM +0530, Ankit Nautiyal wrote:
>> Synchronize intel_vbt_defs.h with kernel commit:
>> 4d33c77cf2c3 ("drm/i915/vbt: Add eDP Data rate overrride field in VBT")
>>
>> v2: Correct the commit id that matches with changes in intel_vbt_defs.h
>> (Kamil)
>>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   tools/intel_vbt_decode.c | 36 ++++++++++++++++++++++++++++++++++++
>>   tools/intel_vbt_defs.h   | 18 ++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index d4aada743e42..6f6f70dcee63 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -1125,6 +1125,39 @@ static const char * const hdmi_frl_rate_str[] = {
>>   	[5] = "12 GT/s",
>>   };
>>   
>> +static void dump_edp_data_rate_override(uint32_t edp_data_rate_override)
>> +{
>> +	int i;
>> +	static const uint32_t link_rates[BDB_263_VBT_EDP_NUM_RATES][2] = {
>> +		{ BDB_263_VBT_EDP_LINK_RATE_1_62, 162000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_16, 216000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_43, 243000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_2_7, 270000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_3_24, 324000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_4_32, 432000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_5_4, 540000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_6_75, 675000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_8_1, 810000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_10, 1000000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_13_5, 1350000 },
>> +		{ BDB_263_VBT_EDP_LINK_RATE_20, 2000000},
>> +	};
>> +
>> +	edp_data_rate_override &= BDB_263_VBT_EDP_RATES_MASK;
>> +
>> +	printf("\t\teDP data rate override:");
>> +
>> +	if (!edp_data_rate_override) {
>> +		printf("(none)\n");
>> +		return;
>> +	}
>> +	printf("\n");
>> +
>> +	for (i = 0; i < BDB_263_VBT_EDP_NUM_RATES; i++)
>> +		if (link_rates[i][0] & edp_data_rate_override)
>> +			printf("\t\t\t%d kbps\n", link_rates[i][1]);
>> +}
> This part has nothing to do with syncing the header. Please split the
> updates to the tool into separate patches.

Oh yes indeed. Thanks for pointing it out. I will split it, an re-send.

Regards,

Ankit

>> +
>>   static void dump_child_device(struct context *context,
>>   			      const struct child_device_config *child)
>>   {
>> @@ -1285,6 +1318,9 @@ static void dump_child_device(struct context *context,
>>   
>>   	if (context->bdb->version >= 256)
>>   		printf("\t\tEFP panel index: %d\n", child->efp_index);
>> +
>> +	if (context->bdb->version >= 263)
>> +		dump_edp_data_rate_override(child->edp_data_rate_override);
>>   }
>>   
>>   static void dump_child_devices(struct context *context, const uint8_t *devices,
>> diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
>> index 6612d3a4ec49..932305df2320 100644
>> --- a/tools/intel_vbt_defs.h
>> +++ b/tools/intel_vbt_defs.h
>> @@ -437,6 +437,22 @@ enum vbt_gmbus_ddi {
>>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR13P5	6
>>   #define BDB_230_VBT_DP_MAX_LINK_RATE_UHBR20	7
>>   
>> +/* EDP link rate 263+ */
>> +#define BDB_263_VBT_EDP_LINK_RATE_1_62		(1 << 0)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_16		(1 << 1)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_43		(1 << 2)
>> +#define BDB_263_VBT_EDP_LINK_RATE_2_7		(1 << 3)
>> +#define BDB_263_VBT_EDP_LINK_RATE_3_24		(1 << 4)
>> +#define BDB_263_VBT_EDP_LINK_RATE_4_32		(1 << 5)
>> +#define BDB_263_VBT_EDP_LINK_RATE_5_4		(1 << 6)
>> +#define BDB_263_VBT_EDP_LINK_RATE_6_75		(1 << 7)
>> +#define BDB_263_VBT_EDP_LINK_RATE_8_1		(1 << 8)
>> +#define BDB_263_VBT_EDP_LINK_RATE_10		(1 << 9)
>> +#define BDB_263_VBT_EDP_LINK_RATE_13_5		(1 << 10)
>> +#define BDB_263_VBT_EDP_LINK_RATE_20		(1 << 11)
>> +#define BDB_263_VBT_EDP_NUM_RATES		12
>> +#define BDB_263_VBT_EDP_RATES_MASK		0xfff
>> +
>>   /*
>>    * The child device config, aka the display device data structure, provides a
>>    * description of a port and its configuration on the platform.
>> @@ -547,6 +563,8 @@ struct child_device_config {
>>   	u8 dp_max_link_rate:3;					/* 216+ */
>>   	u8 dp_max_link_rate_reserved:5;				/* 216+ */
>>   	u8 efp_index;						/* 256+ */
>> +	u32 edp_data_rate_override:12;                          /* 263+ */
>> +	u32 edp_data_rate_override_reserved:20;                 /* 263+ */
>>   } __packed;
>>   
>>   struct bdb_general_definitions {
>> -- 
>> 2.45.2
