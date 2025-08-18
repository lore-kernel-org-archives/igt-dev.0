Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6F7CA0EE4
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 14:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84DE810E12B;
	Mon, 18 Aug 2025 14:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvB2a7Jk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2BC10E12B
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 14:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755525819; x=1787061819;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=h8wV2DRIczD0pBwbdvihSjMVo+kVd3aSRgCv+7BUqCY=;
 b=hvB2a7Jkawj9g5jZLb0AUXTGWPwSPOF84XJ/0FLOA7KU3ww+h2ZFkZwn
 37x17aoGyGS3S6PJpsyP9cNR7z2UyDgrNoKpUMRg2kmp5xGoV/Avxk9O8
 +Izlf3f8Mz7V4+nX/V5w3wRLbV8G6I5mxEcDrDAuBWLV9vpzN/E+BN0zd
 tcG/rGH2CDuDlGcpG5uQh0jW1Ec/W5jRRAkQ+klP600M+lxjSiHuiDV6D
 xD+QJFmZIpIH8aek3yhZ244jH7PPlhfsx0hYZTgRgu3X2+jitHscYVpNk
 JnHmsvQsyjVHjm3olgfnnfl49losF2PzoxB8Rj0X1cY/R7e0pwiObSSP5 Q==;
X-CSE-ConnectionGUID: QxepY8RhR1+ahotPVMldjQ==
X-CSE-MsgGUID: ni/oPssKSXirc2qrtnETQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="57605190"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208,217";a="57605190"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 07:03:38 -0700
X-CSE-ConnectionGUID: qXLdx3YrR/mypetI8Ri/FQ==
X-CSE-MsgGUID: Mhj0Mz8gTSavfHjsOhKgeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
 d="scan'208,217";a="166753683"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 07:03:38 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 07:03:37 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 07:03:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.62)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 07:03:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzJer/J5SA/b521BmLAlmEYEsMWozCfnUAVV3vj0QGqpNBuZxckytSPQtraoqPv137n7821G/ShLJhxvyZnK3wPQKWlwwKu9a0dyN65Du6GiL3fCQMbHMe+pl5BC5NTXV9eMcQdWHXdmy1WwdpYgYyW0ACVzdbtCZBa069Dadgx2fXApiSeAaSlibPqfSmUANL4L8EJRzIxa1xN4gDpS8lRVLZw2+JIMcuLUbWlrnXkG0RPa6WJCDSs7fUwaiIABQXoZ2U3gB1oMMwtgNkGL7jarhxPCN4tmfcLDyfPYF0SGuKFuN3QeKQGDL/g11HRVoZhMNAIMGZGTzRRx1EuKxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htp5UYovx7woTZS80DsBw8WK8Qtozp4jmXxWgkkvRYM=;
 b=ajMhPt/l0Ce/hYPpeRIltNrSPTvqZZSngzV8me/LzU8PAM6AkDHV1N9om4layn86nPlOUD3jfUsGrrG537/xVIl/obA9QsAmJsqxiiKowo0wcdrJMHu2yqEye10DmECTjMOlnI/+7XdFK0riblw7YgjkcoDIhFOS54JikWmq7tpDHBX4K/P1b7UJuk/X5GzU2/NjUvYFVbRJDjJVemqPX1HX4+sGoY/9pBiL0iVLLiu4Z1xD1pZ3L0KGcepD68zXCf63qM2eFBmsAfAO2JB8PYpSFc2eLO6PLrm8j3L1wRvNr9qF03AWRb4EkiGrlnJX7cDrQiDEOv2iMeY/CXsfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by IA0PR11MB8397.namprd11.prod.outlook.com (2603:10b6:208:48b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 14:03:35 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%7]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 14:03:34 +0000
Content-Type: multipart/alternative;
 boundary="------------zSqhxsukYTkxgzj28FPuYChj"
Message-ID: <6c4f60a0-f513-4611-87b0-e3ed3b70e8fe@intel.com>
Date: Mon, 18 Aug 2025 19:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/kms_atomic_transition: Change debug mask
 for multi-output modeset tests
To: <igt-dev@lists.freedesktop.org>
References: <20250812075909.2119126-1-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250812075909.2119126-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA0PR01CA0048.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::19) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|IA0PR11MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d5fda0-0107-4fef-2848-08ddde600587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODhzWnFIZG9ISnRqUXhQa0poSGlrRG5UUGZsYndndTJZWUgzb01Yc0t5UzZC?=
 =?utf-8?B?RGFpaU52K04yZlJ6YUt1YVBhaXFQZm1JRzVLRmdhYXBnRmpXVm1VTGo4cXJW?=
 =?utf-8?B?Y0h2Mlh4SkU2UnpmV05hemU2NnFIQ2VzZWV5VWhpcGZxcldiTmxwUlpoOFg0?=
 =?utf-8?B?dWQ0dTN2eTRJeEdlTkdGaWo1aTNiRE5pVXR4RTN3Mmc1MG1JcW5nc1RrWEQ3?=
 =?utf-8?B?WExuZGs1M3VPbENBejhHYUEvQ25RRFRLcnlkWHgwY2JReG52VS9NZWpGeGRE?=
 =?utf-8?B?endrSjFKYlBzSEdUSzdXa0R4SWd6RC9ta1BsbndUczM4Z0xXQndnSEFJU3ZQ?=
 =?utf-8?B?NWUzM2ZMa2hhOVowWSszaWpjbzhmRHloZUdJMi80VFR2dkhXd2FIWlBHOVhF?=
 =?utf-8?B?RFZOeEpZaFRWeWFSdHA5S0lic2xLZGtWK3A4Mm1pNC8vUlRvUlRSTExUQjdt?=
 =?utf-8?B?OHdySkVaaldQdFgwMTMybXJ0VG8xODdXRXRIckpWdzBHUUZ6NjZtVVFQczlr?=
 =?utf-8?B?eHJCdXB5c0FnOXVDWVpaemdsWDV6SnZrL2JvajI5ZXM3RjRxbG8zdDhCSFpv?=
 =?utf-8?B?SEVYWlJDRysvb0VsOUZyZzRDZWZxRTdwVmF4Q2xqS25KVzh5aFgrYlNud1c4?=
 =?utf-8?B?MVFuSWQ2bkpmN0psYUFPM2Fpc01Yam5wdHpVOHZmRHM2UzYwMHR6K1kybE52?=
 =?utf-8?B?cmpuVHR1Mm85L0ZWN3RDdmp4L0JNeUtjQUt4ejIvU0pEdzdmZG1zMy9YVEJa?=
 =?utf-8?B?VjYxODA5U2ZLQU5SUXF4SU4wVU1WME9NU1ZnOW5GQ1RRNlFBOXNQZlVCSXRs?=
 =?utf-8?B?V1hWcUlRMnNDdzhNdit6bGhSdkt0aWNoL2VJaC94MThrcTJDbS9IamhhOWl1?=
 =?utf-8?B?cFcwb2xGSjZoRXdlSzhHYUlxQjFvR1FCZk45akFYSFB2Q2xMUS9Relk1ci95?=
 =?utf-8?B?WXZtNWdhYTJEcUl6cnJYeDFSUG8vdHcySHB5R1Y1dHRTT2VUbjNtRWN5MlV6?=
 =?utf-8?B?RTlYVWNPMmNXeWZiWkp6TThHZWFNaFlMaXBncmwydDdNQXBFeU9raGZaNGNz?=
 =?utf-8?B?bEZyTVB4aGwvZzhuL1B5V2tXQm53SUlLSTUzZkpwRGxRUVgrc1I3bTV1TmxG?=
 =?utf-8?B?U2h2NklsT210UGVFalhHbDZlZHBJZXJMRWlOcDB5NmtHSkYveTZxeFJHNy84?=
 =?utf-8?B?L0NldDhaZjlJbFFoVmVnZCt2K01SRXEwTUc2ZVBJSU9CazduaEdGbWQ2S1lD?=
 =?utf-8?B?NWN0c1ZSTnkxd202YTVkSXFGK3JZeUtid2t6OVNnNkZEMmJabWR0U1VMbFE1?=
 =?utf-8?B?UTBGSi9xVWFoYjZNWEs2NUc2QkZKVW44TVZCd1ZlemU1RlV2NVJ3WngrNzJN?=
 =?utf-8?B?MElmbkJiQlFXREdOWlFKZWhmbmtoU0xYNDV2Qm9TKytZdlJ4cXVBUHlxR2VB?=
 =?utf-8?B?NElSYjZhVFdacjV5a1FpUXhBb3JWSS9UVmJoRDFjaExvZlJncnQzRm13Q3p1?=
 =?utf-8?B?d2x3dE9nb0NEM2plQmlsREtsV2c4dXZpVTdVSlFQT1dIYUhzTGFDMTNjYVNw?=
 =?utf-8?B?dWZ4M1E4bEI1ZHVIdmxTQkJYQVBFQU1VSjJ3SkczOFVKU0lEOUtJMGR3SFdM?=
 =?utf-8?B?UEhRazNJY1E3SkdLei91S1ZTTXZiUFFlRFNON1RMSS9PdWd3bEdIS2hXL3Zi?=
 =?utf-8?B?UFgrQ3BDUDVibGRlUURQRitlQ3QwL2thVkFpUXRYcTdsWXFuM2RBYkN1YjNO?=
 =?utf-8?B?SFN0MHhpYlJ3OHZhbU9aclp3R3JvR1BQUmkzVGdIdmRRd3ZTMzFZc3MyWGo5?=
 =?utf-8?B?RGIveTRacXVtdE9ZbU10ZWM3MDZ6SEFJMUE3Vk50cDBjWVVLSTlRSklZaVNj?=
 =?utf-8?B?L2dMcmhkd0dkengycnZsN3JtTGQvODltQW9EY0lubjdIOE1IWFo3UThXZ0tK?=
 =?utf-8?Q?Xg7oeNjEunM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2pmR1RnaHJJTllmSi8ybWNIUWRQSVJLbDZUUk5mMW01ZWE4WlMva0I1cng1?=
 =?utf-8?B?Y0pmQUwxdTUwdk1Gcm95c242S3hHZWEyQVo4RVpScG5wVWNZanlHNEhacEZM?=
 =?utf-8?B?YlVGbEY1TEgyZWErTGZTMVJENmVRbE1mVlp1ek1Gelc1Q2tWdHlNd2xCeFF6?=
 =?utf-8?B?VDJySzJTTVl2SVQ0UE5Tb0JlWGZSQlJ2SzNyY0gzeWlCbUtqcGZjZUZhWnNu?=
 =?utf-8?B?ckZjb1dWNWs2eUxCTTVuNnduREowWU00dW1hckh4OFVYYjR1aGthY2JxRDFh?=
 =?utf-8?B?eEVRcWVncDUrempyeExuOGN6amVQc25yQS81NW1lVVRlblZwT2dzVlk4TTlj?=
 =?utf-8?B?dnZDWkE0Z1k4VlNKRDVld1E3VTlWMXd2R2ZxUmRsNDh3eG9mS2ljTlpuNFJq?=
 =?utf-8?B?akVzbGZJY3EzSFJSaDkyd0laZ0NqTHZPSnlLVzdFckJ1UEdqQTExTWlxWURy?=
 =?utf-8?B?WlBtOXFuOThOUG5zYUJEWis0ZjA3V3gyRGtLZ3BMQWQzL3c4dTM0TUFnVWN0?=
 =?utf-8?B?Y0g2WGJhb2VHL3JQZGcxZnhYeW1aTFhRZFhIOGYydndnYkRQMzAvRXZJQlVm?=
 =?utf-8?B?TU1rOUpWVUxUU3VBOGlCWkpVQm1mMUxSNCtaRE9majlYK01TaWJ3Ui8vZ241?=
 =?utf-8?B?Q1VFY2dwOFJveWFuTExUZnIrN2x6N1JDUHV3K0p1cjRmUE5sK0FIOGdlRE9I?=
 =?utf-8?B?WWJBOXBsWU0zM1UxRXBEMnl4M3dmUFpDWmdxQ0FvWU13V1M0Q2hWV2RIRXlS?=
 =?utf-8?B?RE9IdjJKbWo5MGQvTFhXcytrOWd0KzdnL0MvbjN1ZmRVTVdMRXFIUzMxZmhr?=
 =?utf-8?B?Q2NZWTFoVkVoUkhZU0srTEIvRThGN1Q3dFZ5dDUxK0xTcGJwY2xVQXE2cGow?=
 =?utf-8?B?eCtvMjB1Wlk2WHB1Rm1YR2xWWW5UYkdLeFFsNzVvLzljZW5sZ3FoNnFTNlIw?=
 =?utf-8?B?NlJNOHJpSHNTRmNTU3lvZE9Fd3ZUNGFwWkdjL0hVWlFqZEQvdjV6dUg3UUdJ?=
 =?utf-8?B?eXprWlUxa3lvWTcyeHJ1R3ltdHByb2tqN2M4NDFObjRpdm5Zbk95U3ZxWnpS?=
 =?utf-8?B?OGJVZW9sUGEvN0JsNWFjYUZUbWhRTVRjMFlwMyt4WW55UlhCZTdPa2ZGSEV5?=
 =?utf-8?B?V1BoUDJTM3kvdW5uV3hKR0tsWWtZdkpUVUlaeG9GS2pLSTZrbllPcW9RL01H?=
 =?utf-8?B?SzlLV0FBVHNIOEZ3bm80bkdtN0NKTm15NjdDeU9kc3p3ZnZuU0lqdlo4ZHoy?=
 =?utf-8?B?bGkrQnhreUh4R0VnOFE1T1pQbk1xbHF2OU0vWUpHZkhtbE14bW5ldkgyamVm?=
 =?utf-8?B?QkN2QnkxS0pLTFJqeldEbWNoZUNreG1jL2tNRnZEaktzblJJQTI1Rmo3K0VB?=
 =?utf-8?B?ajE0cXhzSXgybFBuTmxMU2NQK1g3WXBWYmNhRERpUTNEbjZHR3dxYWZDUFNa?=
 =?utf-8?B?OFJrcmN0NXRDU2ZvbmZOZVQveWNVaVc0QkZISDMxbEw1RTV2elFuUGZrWDcz?=
 =?utf-8?B?aEdZdHZSdE94bXRjQ2JNc0doNmxYTXJPaUxFa3FKVnFIRURDMkJJRUpNSGxE?=
 =?utf-8?B?dlBHSEtnVzFUSkxIR2ZySUU1NCs2UThKSTdyM09OYnVub1hlZlA5aUtzTXpI?=
 =?utf-8?B?LzNjY3pSb3ZKbkY0L2dWMGZ4RHFwYWg0MlBPb204a2l5RzlHV013ODVtL2RQ?=
 =?utf-8?B?WUpNZEVldVVLc3grcktoZGNzL0kycHlBMDJjNG5uK3BjNzVEdzlOeW1Pei9m?=
 =?utf-8?B?SHpWa2puUzNiOC9DV1F6WEtVWURkeUpzRWpmeUZ5WEg0RElId2hmZUNNZUpt?=
 =?utf-8?B?d1dTaUk5NnV6TTVFRDVOcEZzUFFpUjNDM3hIM3ZYOW11WStSRjBTRVRGVGZF?=
 =?utf-8?B?ZDFIaXBSZi9iamZWSG5KMUV6QkdpUDNnelJpQ3BMaS81Rmo1VmY0Zk1RVWpI?=
 =?utf-8?B?ajZjREsyeEdVREdkQnNYTWVUSlMwenpzVi81RHBlZkFNZkpKRkJZV2taeWhm?=
 =?utf-8?B?aTVJL0FiaDl4NDd4USsya2hZaGs3Rzl0OS9HTjJCU21CRytSQWpYcDlDZ1hR?=
 =?utf-8?B?Z2tGbEtzL3J1ZU1aRnJUUXlEd3A1NVg3VFB1Nzd1NE1tUGtJeDAzQmw2Q3pp?=
 =?utf-8?B?clpzblNwcDljUWFnellTZ21KeGllMk9ZSDcwWHhDNElxM1ZzZXRCZ21maG1L?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d5fda0-0107-4fef-2848-08ddde600587
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 14:03:34.8614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6UnYqGUi5BNbTZoKCUou+KTf/WWNxKgMy2rFY8jx3aY75t+8g90ROnx5diaxluLogXh4c390fNrNaQtDWUeoMYGm8NbxUuT/4ASGtVR3yEc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8397
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

--------------zSqhxsukYTkxgzj28FPuYChj
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay,

On 8/12/2025 1:29 PM, Pranay Samala wrote:
> To prevent disk usage issues during CI runs with multi-output,
> this patch limits debug logging to DRM_UT_DRIVER for modeset
> transition tests when more than two outputs are connected
>
> v2: Include all modeset tests (Rama)
>      Access display structure and avoid temporary variable (Rama)
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 8c6094987..1b81a01a3 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1096,6 +1096,17 @@ static bool pipe_output_combo_valid(igt_display_t *display,
>   	return ret;
>   }
>   
> +static int count_conn_outputs(igt_display_t *display)
> +{
> +	int conn_outputs = 0;
> +
> +	for (int i = 0; i < display->n_outputs; i++) {
> +		if (igt_output_is_connected(&display->outputs[i]))
> +			conn_outputs++;
> +	}
> +	return conn_outputs;
> +}
> +

This function might be useful in other places too. It would be better to 
move it to a common library so we can reuse it easily in future tests.

Change the function name to igt_get_connected_output_count(igt_display_t 
*display)

>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> @@ -1210,6 +1221,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(transition_tests); i++) {
> +		if (strstr(transition_tests[i].name, "modeset"))
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
> +
>   		igt_describe(transition_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
>   			pipe_count = 0;
> @@ -1250,6 +1264,9 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	}
>   
>   	for (i = 0; i < ARRAY_SIZE(modeset_tests); i++) {
> +		if (count_conn_outputs(&data.display) > 2)
> +			update_debug_mask_if_ci(DRM_UT_DRIVER);
> +
>   		igt_describe_f("%s", modeset_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", modeset_tests[i].name) {
>   			for (j = 1; j <= count; j++) {
--------------zSqhxsukYTkxgzj28FPuYChj
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay,</p>
    <div class="moz-cite-prefix">On 8/12/2025 1:29 PM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250812075909.2119126-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">To prevent disk usage issues during CI runs with multi-output,
this patch limits debug logging to DRM_UT_DRIVER for modeset
transition tests when more than two outputs are connected

v2: Include all modeset tests (Rama)
    Access display structure and avoid temporary variable (Rama)

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_atomic_transition.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 8c6094987..1b81a01a3 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -1096,6 +1096,17 @@ static bool pipe_output_combo_valid(igt_display_t *display,
 	return ret;
 }
 
+static int count_conn_outputs(igt_display_t *display)
+{
+	int conn_outputs = 0;
+
+	for (int i = 0; i &lt; display-&gt;n_outputs; i++) {
+		if (igt_output_is_connected(&amp;display-&gt;outputs[i]))
+			conn_outputs++;
+	}
+	return conn_outputs;
+}
+</pre>
    </blockquote>
    <p>This function might be useful in other places too. It would be
      better to move it to a common library so we can reuse it easily in
      future tests.</p>
    <p>Change the function name to&nbsp;<span><span>igt_get_connected_output_count</span></span><span style="white-space: pre-wrap">(igt_display_t *display)</span></p>
    <blockquote type="cite" cite="mid:20250812075909.2119126-1-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -1210,6 +1221,9 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt_handler, &amp;data)
 	}
 
 	for (i = 0; i &lt; ARRAY_SIZE(transition_tests); i++) {
+		if (strstr(transition_tests[i].name, &quot;modeset&quot;))
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe(transition_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, transition_tests[i].name) {
 			pipe_count = 0;
@@ -1250,6 +1264,9 @@ igt_main_args(&quot;&quot;, long_opts, help_str, opt_handler, &amp;data)
 	}
 
 	for (i = 0; i &lt; ARRAY_SIZE(modeset_tests); i++) {
+		if (count_conn_outputs(&amp;data.display) &gt; 2)
+			update_debug_mask_if_ci(DRM_UT_DRIVER);
+
 		igt_describe_f(&quot;%s&quot;, modeset_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, modeset_tests[i].name) {
 			for (j = 1; j &lt;= count; j++) {
</pre>
    </blockquote>
  </body>
</html>

--------------zSqhxsukYTkxgzj28FPuYChj--
