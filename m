Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51C3C87FCB
	for <igt-dev@archiver.kernel.org>; Tue,  5 Aug 2025 11:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88ED810E660;
	Tue,  5 Aug 2025 11:54:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TKWQNUxy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13A710E660
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Aug 2025 11:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754394873; x=1785930873;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=PA6fMWQV2+/cPLn1VH6YZ5/EE+YNZ4MMJe8EB0WmKBw=;
 b=TKWQNUxyVmrzxrHl3TcvEtJuB8woERyKDB7gVezqX20z4tkIqJfXyWAG
 RqIXlKD5l59awSMhWsvyfIsrOXuya1nIc9Id1mjM0e6ALqjMU4b/tGbkr
 GfnYj+Co1Pv9PylPKmt4/oAgO8DSso1ao2RJPAv4GsGlzaYvKt/WKIO5R
 u8rnQtU7+Ua9P/7lfPT6TyHXdk+vK5R5n5RE1xmuJk0UBUQZOaLIDYFmT
 WIBKAwQ6/fkf+Dcd5N7lceaQkxtHI4T8WmQLq+PufCuOpKIiThEhTL3Li
 ObT9DrKPdWb9BHAk2qUJ1Aud8drL5AFsJUR92st/TQQamIW9PXpEvFXtL A==;
X-CSE-ConnectionGUID: Shckf1epRr2RJqALLOY1ww==
X-CSE-MsgGUID: M54I8XY/QMGgh6EHJsdwTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="60493163"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="60493163"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:54:33 -0700
X-CSE-ConnectionGUID: Rzr2OTaTSV+zYDHYIWRRZA==
X-CSE-MsgGUID: +nrwZPa2QpW0KSWqtqgOyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="168732760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2025 04:54:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:54:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 5 Aug 2025 04:54:32 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 5 Aug 2025 04:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=elKgdUaD+Txw2k94kUkMDTLOLk1HPLyXarPccpOe7LDxEkWNTNxiirafl1zDME2UZJBsM8yZAamoGuVX6NMFpUcPjhPTM/zzJE9yMZXqCUTozAerwl9h1Dr6vLN8LQU9Cv4KmFlLwPAun6/ucjoOX+zdz7tQtuo6f6aBsJlj3qXwUE7s1bgmzUiB5+4dNXwfReS1IkoXKeJbHQonoliHmkUAOy3YWad+hLa5BPaS7wlZOiBQj+6NdKiRK1uibxGSXv/qW118gnJYb2JsSxn8/DQqce+lGbYCrDKKVYjCQw2ZYgc4oHezETDSQHr51iA0608lptNPpsnjlYY/71+KnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeO2v0mVjykMFeIWkTz5QQTh/EHeHyleZojV2yovv+A=;
 b=rPKs1V1Si1FJDy6whn0nTLUB+L8bTG/dnhWAd2944nZs33NBl++tycb24kdkNfYB2h5RUt9kxeEh0UpKqw08/F1Wy4cQf0G9HNZf82mAYDLAbXxus45zoLFySibVZqFCs8laTWdzVt6L0sjtwdH3Ngest6nBvKFsgGWTJ2wFtUtaESJc+z/E1Ub+EGzCVIr/hd0o4anhOH/byT5wTpDeNttH6X+TWuDh/zSW5VTQoqO/OSBag73z4NMulAMFa1V+wvFkLlcMwr21FWT1LnVWBKh2T0GkIyK2whh1GKWzlc8/L8Mg+GVvooixmmQsXUohGiKD3x5eSNqnPi2i+Saa4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CH3PR11MB8361.namprd11.prod.outlook.com (2603:10b6:610:172::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Tue, 5 Aug
 2025 11:54:00 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 11:54:00 +0000
Message-ID: <d478292a-54e2-4577-80a2-932f1378e2b3@intel.com>
Date: Tue, 5 Aug 2025 17:23:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/chamelium/kms_chamelium_color: poll connector
 status instead of HPD uevents
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250728081520.1071884-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250728081520.1071884-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CH3PR11MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b548f6-7d5a-4358-18c0-08ddd416c3ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODMxdGhzcElFaEtMQmx1MFRZL293QmsxSU1KSk1KeWFBMVg0WVpJTHN3djFC?=
 =?utf-8?B?VnBQSUl4OGtQRGd3T0dYNlhrSGM3c2U2ajZZMGxSMElFNkNoSFNVa3BBQXJH?=
 =?utf-8?B?bDg5Vm9vUmc5R3VRSE1ieDFnbVBYQUhDQmxzNjhVT1BkdEFNMFlQem5BbEY4?=
 =?utf-8?B?NFhwMVA1Q2xPV2t0WnUraVVadG1ZbU9XRGFyVFFGOGpqUlpWNFIxRnQzeEN5?=
 =?utf-8?B?KzNRSmcrSHcwb1p4MUVHdEU4U3ZMTDQvV1Y1QmR3UU9QL0xRNDFCN0Z3OWdC?=
 =?utf-8?B?TUhKZDBuSU91ZzNEYVc2RmlaNkhCRklYVE81b0hTRU05VUJIUGlhT2dITEU0?=
 =?utf-8?B?VXlEdzd6SHBIRzV6Y1duLzZCS1hmZDdPdU4wYmRoM2ZsUittMTUxQ01HU0ZP?=
 =?utf-8?B?WVF0WjNmWXErQlc1VzJkMU9hYklDRVBLR3VTQXBFZE1tMEJzZ3JuZmtnd1Bq?=
 =?utf-8?B?SzBUL25nYk8vYUtqQW84d0RDWGY3YnZIU0wrMnExTnJvNnZKT2pCNzNtR0ZT?=
 =?utf-8?B?UW82ckxLVmxEc3pKOTRyOXh2eWVoNTk5MklobW4rcVVMOFZhWG45RUMzVjd4?=
 =?utf-8?B?a1dyb2RxOTg5eWVxMVhSOTdMS0RnODg4R3VXbG8wbWhDbVlXS0VnK21uOVEx?=
 =?utf-8?B?UXBlM2gyaDFoeXlqTzRESFVzM29FNDI3clQ5NngwVGFvR0p6czVSMXREekp2?=
 =?utf-8?B?SW1DQnB4UXJMc2dielljK2gzNHBxczFlTWVoQ05kQTVlZitGM3U2VmRyQ0Jh?=
 =?utf-8?B?TFhCdE5JVmJEcHB6R0dIZk9vbkxsUm1XbWE2V2trTjgvOWluM0pwZWhZNE90?=
 =?utf-8?B?bjNWc1QvbGZYeDM4Snltb0pjb0U0a2FLSDFDZzd4VzVmT21SanhGWSt2MmMr?=
 =?utf-8?B?VmJrU1pFT25wYzRhMWM2T2Zvb2dweTZCWkN1Q21jQktiYTFmM3pkMkcvUzBD?=
 =?utf-8?B?a3lDMWlleCs0czZDNzROL0xCdTFGU0xBb3kyRVJpRldpUTRpQ2RPM3VXTlY4?=
 =?utf-8?B?UE11cFVLMVl4SnFucGdUOWVQUUFjb1pDZUxYS29CbHlYSWNJZ2gzYkxYTnhQ?=
 =?utf-8?B?M3RiQjA3RVVlY3MrR3lxelhkOXRWSUpHTmRVUDY0dFVlQmpNbDNveXp0SG4w?=
 =?utf-8?B?ZEE4VmVlODJHenM0T2JpMWFTeXFSTm5oWGQydXFKa1dRSGxleitrNDhUL3Iy?=
 =?utf-8?B?K1RHRnJZak1WYTBYUXNpUXhlRjN2eFdZaUppZytqM2pkakIxUjhVK1dWUmlR?=
 =?utf-8?B?M1k2bC95d3B1TnIweGpBdlJua3V4dGVIckdWdmtpRkg3cUQxNWh4K05pem1l?=
 =?utf-8?B?SUR6V2JYaWlaT2orZFh1TGtBWnBBeWNUTEVJQnVUT3FnL2JPT3djWXNxZFM4?=
 =?utf-8?B?M0FXbWIxSnU4R251U2ljZGR0Nmx2aGVpMGVQMWxFT0dBMklDVy9zcHNta29F?=
 =?utf-8?B?aC8ySUp6SVhYS2hyaUdJV3NDYXdldkhEOUpyTyszQ0pQQTR6MjNFc1RNV3lr?=
 =?utf-8?B?Y1VyekZFNW5aMG9pVmdLTkM1Nys0azlTMXVKTjlGNU1Henk2MEJIU1RjdzJw?=
 =?utf-8?B?T1FCa2VxQlQvQmhpL1ZWZXRZNTA0WFBUWHdaak9WRlhzdDg5aEE1SUhNTnVV?=
 =?utf-8?B?MVRpaUp2alo0ZFU1T1FYRkRrdFVuTTVsTkxWR29idTl2SVZUTGhBT3BtNm5L?=
 =?utf-8?B?dFJkOEVWY1lYL3dLZWpwcEl6aDJkaENjTWZUc3I4Z0M3Rlc2QVBUZXFzQ0Ns?=
 =?utf-8?B?V00wNE1VQ3Y5NVVHb1dTQjlQSEpucFZLeTdLcGl2UDk4UWF5a2JjSlNFL05w?=
 =?utf-8?B?NXltMk41SmwwTE5CTHVROUg3NEJqcDVzSmdTNnlRL2NRbG5aV3hhamhBLytN?=
 =?utf-8?B?YXJuZ0pRQ2JHSEYzNW9HYzBpajkwMmowYnUvaWRJTG5od2NTbEVBRHp0WUdr?=
 =?utf-8?Q?A11RGZqMejo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N09ZbUE3cUI3NWZxWHZoQ3pWbkZkZDF1MHFsQlozYTFhcDF4OEdXR3YyMEh3?=
 =?utf-8?B?N1QrQXdSUVlJbXhvd3NwbEdvQ2lWSzZ3R1d4K3J4TENQWG11bktCVm9DR2Y2?=
 =?utf-8?B?OXdyOFpFWXdKcDFYdmExa25BUlpVZjBveFRjMWQ0dTJYUVBEQm9hNDFYVGdK?=
 =?utf-8?B?WWJaa29KM0pUbWFWR3U3azVWak05cndyd1R3QnBiMVlJNVR6Y0IxQ0pwM01m?=
 =?utf-8?B?SmcxUnA4QjFUVEgxTDZ0NXpRZlBDdWNwbHRYU2lmNFhUN1NCYVA3dGFXZk5N?=
 =?utf-8?B?WWpnWTVpRERpRXhmSFZZcWdlRnF0N0RjZ0lGNy9lQksyV1E0eG5hQ1RtcHpD?=
 =?utf-8?B?MEsvM0x4NkZGTzlDTmUxbnloSkI1cGl0aUk1TVFzRFhmT2hyV01qaTh1Z2FX?=
 =?utf-8?B?Vk9LaEJyV2trNW4zUFY5T1BjbGFLU0puclNlS2VvQVZxWEtTa1l0c0JEQ1J4?=
 =?utf-8?B?NnYySGxRT2JVaDZqSkxrdlA1V2tUM01VbHZSQ0JVanFuVTRTcno4K3Jrd1lK?=
 =?utf-8?B?VlVwSGwvTGdnK0FQN3RqOUVwKzEvOTNkNE9TanI0ZDR4UXV2Q04ramR6YjBC?=
 =?utf-8?B?TjhNWXhBRHNobTN4WVNvYVFldmNmdGhVS3NkZ29qLzE3NWhGVFlmT1c4Wkxq?=
 =?utf-8?B?bkd6dHluaW9NRGNzTEhSbXliOGREeGg3YU9qMkswb1dvVmlYejF0TXBrRG9P?=
 =?utf-8?B?NjhQZzBLdEtQaUgySFVFLzlabk9JcE90YU5xaVRSdHR3RXd4Mi81THFWdG1M?=
 =?utf-8?B?MmJqWXo0bGxudWhKdWhucDBtdk5aTjhmZTR4a3ZFZDM4V0xWVzVuamdqa1FG?=
 =?utf-8?B?cndWZEtaSi9uSnIwQnRQOUhIWlp5YURaaUZKOUFTY2tkMGFxUGZxc1Jvd21X?=
 =?utf-8?B?U2t6ZFhFNlo3em1uNFU3Mk5FRnJ2TVdIOGFRc25UT2ZZS3FJblNIV3ZhK0I4?=
 =?utf-8?B?SmhHdWlBZ0h0UWlGY0J3R0t2eksyeHZwamRYUVVEQjJBL3dSU1dMdnZxZTRH?=
 =?utf-8?B?ZXJIMnRONDQwaUFCUmxQY241T1lpdlFSUC9UYWh0WnlhNG4rNHorOFFjK0xp?=
 =?utf-8?B?VmtKSEMyMFJoTlY5SGlsQ29pWlh3elJyOVJsMWNrNWNSVnRBcmp1dFFZUDRh?=
 =?utf-8?B?dkgzRUUyU2xLK1JwWFAyOW9nU0hIdTVRdjRIUVhSQVlYbzlDaG5PVDdGRGZi?=
 =?utf-8?B?QVJ3NTBPL2FrdWUxdjBHcGowRXhWd0QxUldOaEVzQ3oxenJCZlJuSlBMSDFI?=
 =?utf-8?B?VENFUXl6M2JKaE5YbDFmMUYxbmprVGVIUHV2SEhHVVc2RWN2MUFUdHRnWTlQ?=
 =?utf-8?B?bGR5ek9YcjF2bElReGRBU2Yxa0V2Y3FUeEVlYVZZZUhRZGE0WSt0c0d1bUc4?=
 =?utf-8?B?Y0lRV1JlL2FTZTVQUnRvM1V2WmxrNTF3b1VuWkhwQ3FNc2RKZlJYUHh5Qi8w?=
 =?utf-8?B?c3BGQTNoQWYvTWNPZ1pEYXJTMjFKR0IxYzJGVXE3UXlST2RLZDI2NXVwdHht?=
 =?utf-8?B?MmtURlErOUhud09KQS9MR3p6YmFrN2JWVjlxYUdDdVdTMU9WV3JzekprRTE0?=
 =?utf-8?B?TTVLNUlxY3d4bXVqNE5xMFNZZkpEbHRONFZIZW9PVFNrVHRBZ3poOHRZUUpl?=
 =?utf-8?B?cEpwT0F4aE8rMnJCRER1QktUTWRpb0F4ci9GUHlsMGNaWGRKV3AwdSsxVzRj?=
 =?utf-8?B?eDFrbnRCcVhMNTh6OWVUdG9Va3R2RUx0RVRTR3Nrd0ZmWjdaN1FzT0FaYTFN?=
 =?utf-8?B?SlhPTnI1S3RNSkVSWEJpZkdEMjMwQ1htWTJPQTBienZjMmJ4WGxXZ1Z3TU4w?=
 =?utf-8?B?SStEUE8zbUh2V2xDU1A3cWRCZUNPOVRETDFWN0FlditYcXhZcmVITmRGQkVL?=
 =?utf-8?B?bkx4MVRJY3k3MGJidWoybWlTb1B4Yis2SkFOdFZHQ0JTbk16aUI3Z3hjR0dD?=
 =?utf-8?B?azlIWHN1YW8yUHVJc1VkbkZVVHJwbjVqRjhIemxXc1dXK0ErTllWdTFGZ0g5?=
 =?utf-8?B?aThZVkh0NnBCSEtVdDJIY1Y0RGs2b3dWOU1SUGNzTTQ5d1dHSDdoWDAwbVRl?=
 =?utf-8?B?ZmV1TVB2REpUdHFCdHNtRWpOY3h0U3hENFdwT1hIQys2dHV1RkRDaGcvNUlz?=
 =?utf-8?B?eDZKbklqQzZrSytuYnFxOHd2TzVTb1l1SC9aanFDWEVxdHB3TFB1aXlIMFUz?=
 =?utf-8?B?enc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b548f6-7d5a-4358-18c0-08ddd416c3ca
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 11:53:59.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJYPRfr/fOqCOc2231DKjf6rEeVNBq/js/d8jT4aLcWYXPumGn61JTvflc3zcGeXyGN30p5dv/Y6WOoat98ZnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8361
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

On 28-07-2025 01:45 pm, Kunal Joshi wrote:
> Stop using udev monitors and chamelium_wait_for_hotplug().
> Instead, reprobe until the connector becomes DRM_MODE_CONNECTED.
> Temoves HPD/udev dependency.
Nitpick: s/T/R
Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/chamelium/kms_chamelium_color.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index cee613233..1d4f16da4 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -748,13 +748,12 @@ igt_main
>   		 * prevents any ports from being unintentionally skipped in test_setup.
>   		 */
>   		for (i = 0; i < data.port_count; i++) {
> -			struct udev_monitor *mon;
> -			int timeout = CHAMELIUM_HOTPLUG_TIMEOUT;
>   			chamelium_unplug(data.chamelium, data.ports[i]);
> -			mon = igt_watch_uevents();
>   			chamelium_plug(data.chamelium, data.ports[i]);
> -			igt_assert(chamelium_wait_for_hotplug(mon, &timeout));
> -			igt_cleanup_uevents(mon);
> +			chamelium_wait_for_conn_status_change(&data.display,
> +							      data.chamelium,
> +							      data.ports[i],
> +							      DRM_MODE_CONNECTED);
>   			igt_assert_f(chamelium_reprobe_connector(&data.display,
>   								 data.chamelium,
>   								 data.ports[i]) == DRM_MODE_CONNECTED,

