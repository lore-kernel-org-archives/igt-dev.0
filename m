Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F95DC25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:33:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC2F710F290;
	Mon,  6 May 2024 20:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ov2K+pee";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B09110F1BC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715027591; x=1746563591;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=g+0gsBJ1K1eVgGh68IQRoURNZ86uDIyyvUX2/4GHosc=;
 b=Ov2K+peeG6hHsSDy89UJ1Dy0Qj3WXB0Vx+11bC4yhZb4Te6Ue8FL0a/P
 Q9Pkpo+M2zFbcDhei8cTjlv11nQDojciwgLpa8EgoPuvRdCHJ5iiSzH9f
 Eyl1y+C9b1uNg7cN4Lj5MjxSeHAiZ4mCOPl3zSpFiOp+lHMSBcoEm5QRo
 6SyYnO7cQc1vNqlLqB0FMwkVUh5no4EPj5EScRFjiy84zRKz4j6Cc4M3w
 AZi6y6JU2IcDwpP/GPd3ENYpwiJ2XQkJEI1Y3KcExBhxXn/Y6Oo4Avl1Y
 CCxyLn4yL22MtX2aHvSmyxq8fcws6zgJnemlgU/lKTNwRWCEYWLFpu6Vy Q==;
X-CSE-ConnectionGUID: 27ww/YVRS3aJl+tjjQMWKA==
X-CSE-MsgGUID: TyOuQXunQY2KiV0Ek3jMtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="13747649"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="13747649"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:33:11 -0700
X-CSE-ConnectionGUID: IAmr18fJQJSMkiJoQ8lePg==
X-CSE-MsgGUID: 2xtj53x1RzaMmXp4mprZxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="32939815"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:33:11 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:33:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:33:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:33:09 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:33:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWoOmgd5uCGVbO1DT0FS2fEccvqtkyeaewdf7UvA2ZaqpTtXripa9/seiQamvD7f9MbQUkuGWZG6wwmVL0HBeEkFjJUmQjXP6jmNIZMOPmD9QuZIxHH/r9LOSTwh0NYj+ADMe9OaYfy4v3AuwQcUCAFeajYnQiMol8/sTZp0WwGH43N612Q4Zt7TimXBetLrYc3YW0FiftL1DJKz8GOlRJD5/PvulaYBjzn7/tuhNtxoaUOh9fMugoNJIA1anIiN+yJrqATemDfoyPqfbEckXdVht4+4y/BvF57uJAsP0InL8hL9u3eyBMSOijhxcKDp5C+NW+A8KHGefS/1FSTcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HI95QqSPQu+hrlmVVJpiwZrEVMfiwcV6nWkFLQvnfQM=;
 b=gAx9N6vjGPvqg03WBODfUUzbqILdZg0KH4m4HLRj0uk6LMErtEh7Eps9QFXxtBatcQHPf/DQ5QhNAzclQTabivjWLIkwnrollfVfgoOssUW/6wYm9/T9H8CtUy8t92t4ZEYVqwHL9MnGqx852zO1uuJOqSEnNWUQCCoXDT8P4xxpdrqf2z2ceRXw+M/Ql6hu/1CmGq3wpuGBkXH+pDk4RjWWiiqSgoD8fq5hCmQaRGFNOmqUbpb4m6+igQSK1g77YoGEGwqjweUOq+7QC8BvkcX3HiUx7uxYKagRBMWBcdeVSeDvwnE6jdMatGtpC89/o9dycaTZZnRpncgFiAxqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 20:33:05 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:33:05 +0000
Date: Mon, 6 May 2024 13:33:03 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 03/13] fixup! lib/igt_drm_fdinfo: Allow any
 number of spaces before unit
Message-ID: <Zjk+fzWZZmhL4PZ9@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240504064643.25863-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW3PR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:303:2a::6) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 53670c7e-89d3-4a69-0b2c-08dc6e0bbb92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWs3ZTVCSUtRZG9CLzBWLzF4b0ZXekFteHJ6c0pwQTFtQlM1TW9NMmJMdWpE?=
 =?utf-8?B?QXdpakNKaW10UVBWNEloQWVKNVUrUGYzZFJzTzEyQVhkek9yeEVvWjlYYk05?=
 =?utf-8?B?Y25xWDd0OHlUQW9DZ2ZlbmQ3TlJyZjFpYUNNQTA5ZHVHS2cwQlNVb0FWZEcw?=
 =?utf-8?B?N1J0M3FjYW1kbXVjdkR4YmlockM5czdLNTZSTndtMVJib09NbkczaVVtdzlp?=
 =?utf-8?B?bmo4K0E4Y3crOEtob3gza2NTNENCaXg3UlBCYzFNTzRJWUZkZ0dzbkJWeHlP?=
 =?utf-8?B?dG9CUG1nS2ZwTURjZ1FnTmQ2RHJJZEVUKzBRKzEwQTBMS0hyL0VxdFk2Um9T?=
 =?utf-8?B?U1hwclg5T2d3TUh2ZGRXNmFERTJGblVUcXBiWGxrOGc3UXBRMVY1ZE1lR3E5?=
 =?utf-8?B?MUVSQ2wvejR0V1A5cXpnYjdackpwdnVwL3pnVkI2cUZrQS96am5iY1JZbDF3?=
 =?utf-8?B?bmE5Wjkza1JoWnIwT2tGNmw0c0YrdHN1akZ3K0tkTUp0bUpUWmNaTDhVWTJM?=
 =?utf-8?B?RWRqVGtyNGdCRmFlQ21QZFpMODFBRHJDSzR1cWxsSDE1NTlUZitPbnRtc3dn?=
 =?utf-8?B?REgzS1NhSHhFZXc5aFNDSTAwNnhHRDdhQlAxUGg3YlZoa1dIVnZidGdUREVa?=
 =?utf-8?B?N1B4dW9HZ0gwYy9zSzNDWGlEY2t1YXRTU3I0RDZIZkhOK3pYRlVqa2VwQTJV?=
 =?utf-8?B?YjRIdmZnWnNMNzgzRm5ldlFhRDlyYXd0dUhFaFJUV042UWpiMEVLdEpyY01l?=
 =?utf-8?B?eUx0cUJNWUpDTGNPbnA2bDZ0anJIak83Nkwyb0cxWW5xeEs1T3YraHFiYlIz?=
 =?utf-8?B?SG5qS3RUYVl4aHBQZm9zdGhjWjJXVm9QeDRiaUx6UEl6dGpyNFdxaFg3T09z?=
 =?utf-8?B?RmxjODlDS1VaUFpNRzhwMTI3THZIdjJHd3VUTFowZHNpQXUzQzdxZy9aS1Nt?=
 =?utf-8?B?TFVzbDFUS0xTM0FnSUhhTG1BNmRiZFduejFkQXVVUUJJK01JcERUL0E3MVQ3?=
 =?utf-8?B?d1p0bkFKUG91ampvMmdsd2diQ3dJM3FLZjljSlZCZDY4V3ErajI1blpVUVJB?=
 =?utf-8?B?ellhS2tYSS84NkltZVRacFkwNHd3UFdSZVpwNnpnSUxxSG1YNC8yWGlKOStp?=
 =?utf-8?B?WGZlWFB3bm43dHphNmFMMWg0ZkRnVU1JN3RNQ3phS2lVVGFjT0hleSs1N240?=
 =?utf-8?B?U1NjSEVuTi9NdGR0bDV0Rjc1TUExMmxrRCtXOUJvQlYxcXNaNVNTYk5jUXlK?=
 =?utf-8?B?TE9kU0t2YnY2NkFCbGFTaHV3R08xL05mbWkxVmJNRGY4TFQ2NVVJWndnanVx?=
 =?utf-8?B?YmNINnRFSlBzVUY2L1hZSmpRaXZhRW5CSk9Pc0dWYzI4MjM3N01RbVY3UndJ?=
 =?utf-8?B?QXR3d000TXBMRERvOXFZeFpDSkIybHJURy9QSGIxVm9iQUZSdCtYRDF6Y2Jx?=
 =?utf-8?B?WWtCZVBzdENUTjN6NGJJNVBXTiszN2hlN1Awc2N1N1M2M1hyOWFBTUpKeWN6?=
 =?utf-8?B?eFpwelNRaURZSUNjZjhDQmprK3pHemlHRzhhZjJMakdQRUlzODBZQ0FXSFhi?=
 =?utf-8?B?ajFFOEdXUllUNmhyQmV4RGRIcjFqaHQzdk9MaXpLM2dSRTBIaEF3aElST0Jm?=
 =?utf-8?B?UEh3L1hqK0pMa2hmYitUR1I4dHB4TTYxdGwxbU1PYkdPTGl6QUVUT3dPWjVO?=
 =?utf-8?B?Q1FUSS94ZGc0QlJNU3ZQMFhpRy8wV20zbHhVOVcxdTFLdG4xNEprUUVnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RCt2dXQ5UW5yVU1wK2dvU1l3QlJVL1dtRUl6UXNxZ1BtMDMyREhIM0x1TnBy?=
 =?utf-8?B?VmZ2VXlNMVZhaDJESHhNbG5TekcwUVNNVTFhTHJMVzVWc3AxbkM2ZHlwNldv?=
 =?utf-8?B?YUVRcjgrSTd1OW55UFNzU09RQ0pHa0FSRTFERk8xUkpRTFVEaVhReDcvU2tY?=
 =?utf-8?B?NTVGRlRtOW1LbUp2UjY0YUc4UXdLL3F4MWVtMGlYcVAvNkQ2SExVTWYycDlZ?=
 =?utf-8?B?ckZ0MnlSamdNdW5kdTVJQ0pDY3dhRWRhQysvWi9GVStuMGhhVDN4ZHJEMEph?=
 =?utf-8?B?QXZxajREN3Y4b25MY0FhcExabE5QV0taSUtaSU5xY2ljSEE1SmI5cE5Ec1Vh?=
 =?utf-8?B?TUlnTU1Ta2hYYkJSNTNHa1dqYXJCZjJ3NEEwdXFQL0JRaHpFai8vYWxobXdw?=
 =?utf-8?B?ZXFwbkkxRmdEVkFGNEZzNGNwakorcVFWS2doRTBCYUVQWkRNTUQrRXpGZ2xi?=
 =?utf-8?B?MzVFTVFkUDExK2o5N2RYMFMvVTZHQkpjN0FYdGVMMC9iMVllcjdFNUlyMHl0?=
 =?utf-8?B?Si84c3pMVEcvM0RvK0lFMzU5SGpOR2twRUlqTEQrQmx4eld6aXZxVVNtNlVE?=
 =?utf-8?B?S1dQdVJKN09iTnlHSHZ5S3dmdHZRdGpSaHg1SzgyNzM5WWtFNFc1M3JrSGpu?=
 =?utf-8?B?SEtkeDdKQjhic3dweGZRZm8yMkdPYW4zTmRTTUhHK1FtSEpLWGRCRXQ5N1FF?=
 =?utf-8?B?RkZDdDE4eWlONk5vbUNZZS9hZWdsRjJyVzVuQXpROVFlYmwwS0VoSmVCdnU3?=
 =?utf-8?B?OTlPSVpmNHhMZUdDYVFVcmVNcloxdE9hZ2l4RkFINnN0a0d5YTYyQ0Zlc00z?=
 =?utf-8?B?WFlEK3J1TFBEckNsQzZVZlZXZjBORTNOaUp6NUE4dUo0cHlKaU5WcFZ5elk1?=
 =?utf-8?B?TUVaMU9iZldKR2MyaTdUWkk1bUZ5dGlld1FwcEhORXpST3FpSUo5SVZVWVFh?=
 =?utf-8?B?ekIwdkdHL0RYbXhNb2RwZFhBTmVQMU5OdFZJUksyTnhIK0pqVTljRVhkUWFL?=
 =?utf-8?B?QTNoVzIxZWdjaTgxQ3kzVytMRHEwTnlFS25BdFM0bW1UdFBqa3pCQTdDWDU1?=
 =?utf-8?B?SWJwTzdOa1pvYzd6dzFQeStDK2MzOXFSYUJ3SFVNSzdQK3FIMmpuSk1oTkFX?=
 =?utf-8?B?Mzl1YXplcXJGQUNSRDR1WHFNak1xcHgxNld2UE4wZ1A2N25zeG44YlFpS0gy?=
 =?utf-8?B?MDZzeGlEQ083cS9zcGw3b1Urdk9tOERMdlAwYXhtbkZPc3Y3L0hxOVNrWFJI?=
 =?utf-8?B?V3F3cTFVYlI4SElSd0FkTWpZb3k1VGlWRVpETGllcUJaZnNHdFA0S3UrZWVJ?=
 =?utf-8?B?YytVc2xLKzFCQ2svSTJUcDBVQVljMUJ3MENzZFgvRFhOUmh6YmRRaFh3czdv?=
 =?utf-8?B?UmVKUVVwUGN5cXlncG9TNVdtT3MzcnVCQXVaK2hRclVLbkRRUUhMZkpTM0F1?=
 =?utf-8?B?ajJoYTBONDhiSWtjRnJQUzI2aG9PSzdveHdZVUdnazR0UGRYY1BxK1MwSlAx?=
 =?utf-8?B?RDlFMnVwL0NVNkdUdEU5Mk5EUk9sMm5xdURCMjFWazF1Vk5lZWRGUFdWQmRH?=
 =?utf-8?B?c0dmMzQyQjgwWHRIelhvalJkR3JYTnFGNTcrNks2QVVSVEI2U1Y4MWlLUVly?=
 =?utf-8?B?ZmtVWFBPVmUvTG00N1JGMHJhYUQvWGNOM1BpaGNCZHViN2NaM3RJM3EyQ0xm?=
 =?utf-8?B?VTJuVUhER1QxT3lmcFI3L2toVEJXcmE1UUNyYWNYek4yQ0NKZ3REYlF0amN2?=
 =?utf-8?B?eEVXaXpMQ1F4VmQwRkMrT0VuQzQzWThIMHFCcnlrOUNJRmtoWldBQ290ZUV3?=
 =?utf-8?B?TjdlYTVCSXg2U1AweU5YMmtUalpkeVFwaU5acTU2QkRocEVKUnFibzJRS3ZM?=
 =?utf-8?B?RzZFb0VHenBBNFpwdGgwTDlLTVNzdVc2b2ZJT0NCRUJZRnJIRFMxcEhUVDJ6?=
 =?utf-8?B?T2tSWnhMUmp3OCtXMXBUNCtkTHRzaCtPZ1dUaHJaOVBDV0RYbU9UY2s5bklX?=
 =?utf-8?B?MEJEZEhXckxUVzBhTHlIaURkVytkM0VoUmFrWElCQnhRUnZsemJieUphSFRI?=
 =?utf-8?B?RTZjSVp0bkdNNzFMU09uNVU5Q3dhVVNHR2h5WXpvcE9tenp0L2lrTDl4ZlZZ?=
 =?utf-8?B?a0NCQ2x3UERxUnYwbnVJQ0Z1d09SbVpIZ3laeWoycmN4U1lrTnJna2t5Y3kz?=
 =?utf-8?Q?whY2AFPpxAI9NOeZJTVvodM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53670c7e-89d3-4a69-0b2c-08dc6e0bbb92
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:33:05.1661 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eAfdoBxYEL5kQ8n0TQ8MajpzJpAIRjV7cz8BDNQWD8Je3uwIs47CXuFFS6JSDSEBdDlhFfDM2XAi9OTDIdwEDnWBiTZh5yZZ8er3kS+PRXc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Fri, May 03, 2024 at 11:46:33PM -0700, Lucas De Marchi wrote:
>---
> lib/igt_drm_fdinfo.c | 17 +++++++----------
> 1 file changed, 7 insertions(+), 10 deletions(-)
>
>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>index 3b2778eee..3b8e79a35 100644
>--- a/lib/igt_drm_fdinfo.c
>+++ b/lib/igt_drm_fdinfo.c
>@@ -134,8 +134,7 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
> 			const char **region_map, unsigned int region_entries,
> 			uint64_t *val)
> {
>-	const char *name, *p, *unit = NULL;
>-	char *end_ptr;
>+	char *name, *p;
> 	ssize_t name_len;
> 	int found = -1;
> 	unsigned int i;
>@@ -181,18 +180,16 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
> 		goto out;
>
> 	p++;
>-	*val = strtoull(p, &end_ptr, 10);
>-
>-	p = ignore_space(end_ptr);
>-	if (!p)
>+	*val = strtoull(p, &p, 10);
>+	p = (char *)ignore_space(p);
>+	if (!*p)
> 		goto out;
>
>-	unit = ++p;
>-	if (!strcmp(unit, "KiB")) {
>+	if (!strcmp(p, "KiB")) {
> 		*val *= 1024;
>-	} else if (!strcmp(unit, "MiB")) {
>+	} else if (!strcmp(p, "MiB")) {
> 		*val *= 1024 * 1024;
>-	} else if (!strcmp(unit, "GiB")) {
>+	} else if (!strcmp(p, "GiB")) {
> 		*val *= 1024 * 1024 * 1024;
> 	}

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> 

>
>-- 
>2.43.0
>
