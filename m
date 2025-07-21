Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEDEC83F1A
	for <igt-dev@archiver.kernel.org>; Mon, 21 Jul 2025 06:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC6210E484;
	Mon, 21 Jul 2025 06:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BT5L238j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C089410E484
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jul 2025 06:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753081104; x=1784617104;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qzi6e1/ggvurPd7m0/BLcjwB5ew/KR2pU6VHMmOcjHU=;
 b=BT5L238jyoGVf3tL438MdrOnx7A7bAMNJZx+bGhQCskvbu06hh+EKsrv
 s7mlzI2h+9o/VxGRy8CDuPdf/Y3Nyn3ydXMG1sGifl/HGG9uXHjZDf0nq
 O09xZhdutGjECgP5OM/U/PI2urwYbSFUwaRPFTtdKNl8EgFBWU44GszQn
 hI/sAwYzxANZY/PnivNK67OTYSPvuEXR2Nx7uvpZd8pG46RW9cv/yXFSE
 zOGxc5hqfBMzdbu7LB2NKoSK8utMTEx8sgEHs+ghU9GJIugKSHqVAyPkR
 2tXC8hrA/G2CaRf5Sd+98ZYXGQQNeyg4+x9HPT7xM0X4VFaDkFLMF8L6R Q==;
X-CSE-ConnectionGUID: MZQB9cF/Q+OVV/AiKFfzuA==
X-CSE-MsgGUID: wQI4/X5UScGK7aNHmYSSVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="65853732"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="65853732"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 23:58:23 -0700
X-CSE-ConnectionGUID: nDhPGylHSCefj72N3sWAWw==
X-CSE-MsgGUID: rFiyHO7GSLiKg8MtFK2b2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; d="scan'208";a="189733001"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 23:58:23 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 23:58:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Sun, 20 Jul 2025 23:58:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.61)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Sun, 20 Jul 2025 23:58:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=voaVqbfiB583zUImgxFCfNng6uD/lHZcT1YtMpfYQTqiDy63NFp+m7iBSOTd2xIXIvPmQ17jsyUpUcgT+DCY25uQ4TRnhap7xJSsuMKzYcY4IS34qRoQugvooUvqwCvGS55FBzt4aZnwGe6aA222EGKQJNxVgLLg9WZtkNG3SAAwuYZYkt4Iu6j4Dsd3Jh2V8jzQ704+Oxy9b3DC6q7D9wRn2CZWUepQXK5Fh+2mpttFoAIkjvTzYCMh+wLYxRb5/RuMjPyYLTjlArfmuxKWT0BlnGfx/Z0kTGr7WT4TBSyXexfTqh9kZkH5IGnl5hMJBRWVpRKwgJJnRK2BReUVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DArddxRV70vWfspYGIKj9Vv1tqqlWM7LJEGwAGwWKYI=;
 b=kqO/O2DI3kXo+lfscMd5IqhRtYruyfFiOYdKgKF7mzIqrJtDmS20pE5jY3ecL5ajwwyZWbWc+PZhrxf6qyMFmtPMY2yji2iwAwjALUFkmZU31KV9zFnfA2mwu7gUt+AFBbg6aut3tWBKb97V6pwQgq662HqLUEvaAFwSfdJrkJnX8vMHBZAR8P655goQhzlWthxqI3OFlQ+rpMBBN/vyp3nggPlthHvvEHjhthI/M3XJGLWJJMDQiuSuriYAAjTCUpkUSCeDzudUyc3TnMYNMiR3qqvxS/zDLBLba502clcmO9I1k07nVZpLIuL52KQsrTef7uHXYITD2SbOf0Bdxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL4PR11MB8870.namprd11.prod.outlook.com (2603:10b6:208:5a8::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 06:58:18 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 06:58:18 +0000
Message-ID: <3c63e271-bb4f-49e2-8704-d786862b8519@intel.com>
Date: Mon, 21 Jul 2025 12:28:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.blocklist: block unsupported test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>
References: <20250721051353.934493-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250721051353.934493-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL4PR11MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: dabaf9ca-5e66-45ad-33bf-08ddc823f8e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak1oRWNOMmpiZ0lzcVc0UUZVR3h6a1I2bll1eXNWS1NzMFhJQ1U2RGpGenM1?=
 =?utf-8?B?UEtlTWpwMjM4RkNmaUJCYStETkJMVXJUZUp6azM4eWxBekhuNVZ1c1pCM21n?=
 =?utf-8?B?WU5WUG56RTNCNFhISXlpMmY2TUxYd2RnZmgxSDhYZUl0YkZ4K3QzUm9VRFpy?=
 =?utf-8?B?ODBMcmR2Yit6N21WSDJLdFlFVzFBS0Zab3lEN2ppMmg3N0JCbUQwT2VkWWxr?=
 =?utf-8?B?cEVEdHM0a2NNYlg4ejBESjhxektCTzdvM0ExSTdVNWpRa2E1MXpIU1d1ejAy?=
 =?utf-8?B?VFhUK0ZoSHRpYmxHcW0ydWhYUUorRlgrTk13L3BSb3RMRktMa3NYNXhaSFpR?=
 =?utf-8?B?VnRyYm1Ic1pBN2liMUxFbnNJaWxJdGl3eUdXRHpNYUt6SFFtR2pwdmR0QW9K?=
 =?utf-8?B?YmsvUWdiWlFMUSs3TFk4YVArRXI1Z1M0S0ZKeFVZekJWRlE2YjFTc2VNamY0?=
 =?utf-8?B?WTIwRnBPaHhDNnFOSXgyVEpjREtCR3BLMUxoTVBEQStpZ01WVEdlVDA1WHBq?=
 =?utf-8?B?K2o1bGhPRmxldkxDako2TyszUmZLamZwSWlGOGZLSldHckxQc2tQNzJndXZK?=
 =?utf-8?B?aGM4aGdQdG43OWFXY0tIdk5nUXk2dGVvQXhCVzZ5dys5ZmRJUDVTd2ZqV2Nr?=
 =?utf-8?B?OVpYK2VITFF2ZFBRR01FTW5xMG5pa3hFYVkwT3JBaXlFNjFwZHRvWUM0RVFC?=
 =?utf-8?B?YllKdVU2M1pKaGVSdWdIRE9rK2FFRmFFTGlXcTBvYllaUUpPSHZYK295UEVN?=
 =?utf-8?B?eU5iM3VEOEZURVROd3pzdkRhQWQ1Y2hMeDdkb1FZWGNoYjRzWWhWT1pRaGpk?=
 =?utf-8?B?TGlrMUdhazgwbWNPckREK2ZCb3NWOVN1Vlo2R214YlBHT29EdGRyMVhEQk1N?=
 =?utf-8?B?RFpkUXMyaGdrMWhEK3BnZWpJYkFlV0IyUlR0ZU15bjR4SndXZnBwOWhxc0x6?=
 =?utf-8?B?Mmp2YVd4cVd6aFJ2WENndnI1ZW51ZHliSkgzRW0rZ1Eyck5OZnE4aHAyTXRT?=
 =?utf-8?B?aldPYVgyMmg2bUdHWmU0dFl6WG0rL2hnSHM2QitTeFVYTkZsdFlTL0pKZmpo?=
 =?utf-8?B?VUhjL0NnSURWbWFaWlJINXJrcGhmd3JMYktQUHBPZCtpMW8yZVZaeWhnNE02?=
 =?utf-8?B?NG02REhidXl3ZHBReGlUUmV1M1VJNjhTUUJmMWxadDI4NzBSZ29JTkQ0NC9y?=
 =?utf-8?B?V2Q0T3dGdVZxUldiTVhmRkFKbUhQbnppWktaYnZmYnhZZjJwb2JQcDVsUm9k?=
 =?utf-8?B?QUZnMDkzbmI5bEpId1BMaWNhNXJPbEsrdjFTNEZnbFFDRWE1ajdoc0FtSWlV?=
 =?utf-8?B?eTBGZnAyUXY4UUxhNDR0WlBzSGFGaE9sMmxBbWNXaVNIb1V5cUtPQncvOGNs?=
 =?utf-8?B?TWlRcTl0TGNQZjBCVFVhdlkvclRKUzRYMTdiV3V2RHpPTkZUUUpLZ05GUFJI?=
 =?utf-8?B?R0NqQXZ2djFBd0JqbDFPWXhWUWgwMEF2REhYcHNieTFTUkt3MUdqTEsyZ2xT?=
 =?utf-8?B?SEMyeEdvSUtMZHVuNUdUOTNVUDZkZHU0TjVZOEJSWEFvVk5PRmkvbytubVFH?=
 =?utf-8?B?R044bktISHdGNW5NdnVhL3RrT3hocUtVMnZ3OWFOb3dQNnFMRWxMaFhqSEVt?=
 =?utf-8?B?N1JVSkhIeXlSQzFTWFFVSjVNbUFwcWFkNGF0WFBieTVQR01NSWoyenFKN21S?=
 =?utf-8?B?ZWhvRWc2Y1pKOHBGOUdVZyt4R1RFMWlTWmh3TzgyTU9SQUFINTdtRHh4SFlP?=
 =?utf-8?B?SFJUSWxJMU5JUTZBUVR5QXVUMDNSbGFab2JqY3N1ZEVzbWlXK0JjbndDNFRp?=
 =?utf-8?B?bjVUMVorSDJQNzVIK0s1Wkk1bHBXazkxZ0c5SUo0QTBIT2l2akppY1hYaFFD?=
 =?utf-8?B?aHVsZS9GOFJweWZxaHFhRGtnc0pkeVF2MHF6ZDdqZXJsczBWRm8zdDc4S1Rx?=
 =?utf-8?Q?AZNp4vFz/rc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTBWU3U5VHNHSUZ3bnFrZ2lHT1h5a0VjQnZNM3NwaURBd2NKNkVGdSt4OS9B?=
 =?utf-8?B?Q3BsaGxxZGVZeE01REV2SVRkblRBVmxQZGcyNzc2c1F3WC9QTWlIaDlPTlVX?=
 =?utf-8?B?cDlCYnVTM2VPUlFvSVNtMkdvUml1V3lMUklOcnIyRWY2TDR0NlpzYnFPc2VB?=
 =?utf-8?B?azhXK1FNTFp4ZWp3cWlGUi92d1VOeDh2bGFYemMyTjE3Z1ZJelB0SDRuaE1x?=
 =?utf-8?B?eDE3cU8ybWw1cG5GS2NOTHdhVFdwMWxBNWtDOUpHMmVJTGp4S3crY1Fmc0hy?=
 =?utf-8?B?T1RvV0NGRURGdjBtalBQQWh0OTJ0TktTTkIwMVdBcnFtTlBySlNxWTNPSmkz?=
 =?utf-8?B?NXM5M0dGeHVnNVJGMS9ob1cvVEtlenNZRGlnbzFsQlVSTWJ2QUxsZU1YdVBE?=
 =?utf-8?B?R0Z5WEp4dWljWHhiWm83SFZjUk5ndWt3NDQrWEQxQnBGZGQ5L0JOSUVDaGVS?=
 =?utf-8?B?YjhRT3N6NzN3Z2RTTlpNU2NCVHVIZXlJRkZ0cHhpRjh3MUIydFFlTXA2b3JC?=
 =?utf-8?B?eERORnJrK0k0eW9jb2xnSmVNMnE5Y3FlV1dOT2lXUFhMeUtIR2llWG1oandN?=
 =?utf-8?B?RldkREdWNkVRcUVjNS95WmlIVUMwYnVnczIySGNSZktOVGFXZTJvUVB5V0hi?=
 =?utf-8?B?aFFmb2ZKQk13YkE4Y0hqa0xKbFRZYzVnbzd6dTFLUnpreUhDZ21uZlg0V3hV?=
 =?utf-8?B?V0FyRnUxV0ZTc3YybEIvS1M3YzlNWG9tR2NHNHljUEFId0JVclRHWG0vRDMr?=
 =?utf-8?B?TFpoanJ1Vm9nOWp3KzNtYTFhRWQvUkt1RUZVL3laUThlMS9WN1U4c1RpUEU0?=
 =?utf-8?B?cEtBUWJuekdiNEYvdUVGYkdmb2FtWmlkelcvZFZucHFIU2liZTFmOVRVaFhx?=
 =?utf-8?B?UEhlZG5zZWdhZEpZWnVVYVFnMmh2V0NCcGowU3ZkcE1iMERsNUF4YUVzOFcw?=
 =?utf-8?B?WTY0QWlBYVhpaEFpRFkyWTkwTW1aRDBYWHZXaHJ2L3BjNkZRS0NOOFJjZzZq?=
 =?utf-8?B?ODZsdzhwYXJ6b1lON3pNeldnTm0yNXAyTEFINzZrek8rZnUxRENwTUtNcFlr?=
 =?utf-8?B?bVVjam5ObUMzM2gvRCtiZkZab0hWOTFEdmVWZHMyVlUzUFJwZExXcGxnSU1E?=
 =?utf-8?B?bHlKSkhBbWhCZzdVU2REV2xrbmd2VFAyQktvN1c2LytQaUJSTVpjcy9acGlP?=
 =?utf-8?B?TmFBZlFVSDZGc3lxM1V5Y01obGUxaXVYWThVVllFRzhXamo1WTB1ZVVrVmVY?=
 =?utf-8?B?bjEvRmRRNFdNa0Z0VFNTMVhVeUIzMEFVUHduenkybS9TZkNzRlFSN3FzRDhx?=
 =?utf-8?B?Qk9Va1BrNEt4TEhyRDhLdjdLV1Y3NERSczUzeVlkR1orVDFJT3RxZlhCVXp5?=
 =?utf-8?B?aXVManpsYWVPY0hZdFEwUXNzUENESmdRYlVUVTJWRG9SVzl6VmR3dXNCZzNw?=
 =?utf-8?B?TFVVb1EzWTJZbGF3V00wZW5iWDJUMkVJbldUUEZKaTdEMTA1L3lKSldKUTBF?=
 =?utf-8?B?YXIxTm5FZlBkcW03SzdmaTIrVTRYZDBKRGxUaGtXTnBMTmNsbmQremNWVmdl?=
 =?utf-8?B?WUxUTXM0L29maUk4K1R5VG5TRnJCMHVEa3JqdWlXdHRVZW5KVVdCckZTc3Z6?=
 =?utf-8?B?bXVxZjAzRDZtUHBZOTRtSmF3YjNNYnJwZmRxU0hSVDFIZFJQb0FaV1hUZ1RP?=
 =?utf-8?B?OXgrWGg4dFJpa1FydEUwMUUveFcvbGJXOWhZb09yZU15eWt2SXNodkt3UXpH?=
 =?utf-8?B?dGZYZnF3THNrV3B1REQrQjkwcE1iWHlVZ2VQbm1nVksrYjhnWkREdW1JS0JG?=
 =?utf-8?B?Y2wzSnF1djRWQ05wU0kzRU1DVDV2MXpZZmFvOHRaUElRMHlJbTBaWFRIUndq?=
 =?utf-8?B?bm5veEE1UjF0a0RYM1Rtb1lCUzZOa08yZWVzTzF6TC9ZdUU1eEJZNUkxdUZ2?=
 =?utf-8?B?OW5tT2czbHlrTnljdjRPbnJaZXN0UmE1bW5JWW1QaUY5Y2ZRYVZuRWJ3enBC?=
 =?utf-8?B?TTdrenI2MUZtZW9EU1I1SWdxUkVXQkYybEo3dWpieWRZaGdZci9NNHBjN3ox?=
 =?utf-8?B?d0tEN1V5ejJsakVRV2ROMFFkY3Vac2JtTDc4OEFaVnl6TFFmOHdGam1odE9l?=
 =?utf-8?B?WmVhQ05IWnVhb2hOVkxhWHhCREN5aXBBbFN3NEF2UzhJQ2VXNHZMYlA4TDRH?=
 =?utf-8?B?UXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dabaf9ca-5e66-45ad-33bf-08ddc823f8e2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 06:58:18.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h/V9D4l6KlDYvyUJjgwPV9sltUF1d3yJ1mG5mV1M0fLzQN3B3f1SH+fX7GmwRNgSq1On5wLgPJFVNDqv4dycQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8870
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

Hi Kunal,


On 21-07-2025 10:43 am, Kunal Joshi wrote:
> Chamelium V1 HDMI reciever can support max 4k@30
> Test forces EDID with 4k@60 which isn't supported
> Blocklist test untill we have newer V3 boards
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/intel-ci/xe.blocklist.txt | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index a21c8a3d3..050c89970 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -115,3 +115,8 @@ igt@xe_evict@.*-multi-vm-cm.*
>   igt@xe_evict@.*-threads-.*
>   # igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
>   ##################################################################
> +# Chamelium V1 HDMI reciever can support max 4k@30
> +# Test forces EDID with 4k@60 which isn't supported
> +# Blocklist test untill we have newer V3 boards
> +##################################################################
> +igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
Prefix with KMS
Fix typo : s/untill/until
Re-phrase
/*
  * Chamelium V1 HDMI receiver supports a maximum resolution of 4K @ 30Hz.
  * This test enforces an EDID with 4K @ 60Hz, which exceeds the 
capabilities
  * of V1 hardware and results in failures.
  * Temporarily blocklist this test until V3 Chamelium boards (which 
support 4K @ 60Hz)
  * are available in the test environment.
  */


