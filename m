Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854BFC3ABDA
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 22:44:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7E410E047;
	Wed, 14 May 2025 22:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYwZ0010";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B31B10E75B
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 22:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747262641; x=1778798641;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=z6NURPzYwEsksqXOkq8xBYIYX+NgVl3FQjw9gQr9nm0=;
 b=MYwZ0010Ap2ftbxqcUex0jK94rRyRmGIlVMDZEUk7zz80ZAYYLwJUmtV
 HxmXENpzU4smox1DZ6UKkiVesyjj1pE4vkaEezk2BCY5Pu/a1RPi7SAV5
 b/bTicW4KNdB0G6rXwCc7kfMV2vks3ftCUBcrRccUHFtKh0zlrvu7Xm0w
 JgU5GbGR0Jb2XoO+auWt9nEds8A6NDbjv42cFL4glOyze4LmxXrtSH3nt
 3je5rB3IKD+Z4juFG0/mAVZWHEwn3GsngIe9GnT1BEhLQ6upwN3xirMhX
 dXKLrO7cw85AWi0ozkjOrtUR5/jquT0lgeqbG3yUvg3QgAaC8975Lk0md g==;
X-CSE-ConnectionGUID: eMkOtNBaRdSo9YvSsTM+sg==
X-CSE-MsgGUID: pHdi0R5dRwm24ZxPMDEo0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60516741"
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="60516741"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:44:00 -0700
X-CSE-ConnectionGUID: HE7fSxqkTjKUZBiyx3RbCg==
X-CSE-MsgGUID: mrNJlWPzTNutpXmduqrCjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,289,1739865600"; d="scan'208";a="169115508"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2025 15:44:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 14 May 2025 15:44:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 14 May 2025 15:44:00 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 14 May 2025 15:44:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUvJXeyFPdfGoWRfqcy7y9Iaj95ddfgFi5pHByUo9O7BgYW5hH+BlgKIQsTSqU9ZFjeBGNG/b3Y1DkCUrjZsAQcfuuCCV0cFsdm2mcyS8mzJzie6hRWPsjyT68mK2/l2gT5GNKK6D6BnrbKAJ51vLeAeeLUmqQA6/qhYJmEi3RnBAFe5yN4aEonkZ/hBDfMHG5ic9678kZqBgoQUNliu1GLCvEdc57Uh6oGh2LdnxwTWYpVnH37KkSIb3yWBKlIPK2ZHTtY63sHyBsDmd5ijDrZUfsoWDEBXBuKi9R0UO7bB4QshuOP+Gv4vyKP+Pr5sSDF7bXHpjSVAiSMynq9t+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YP4AO8xfYr1QAPlCdtKMswM6u0m4AaoplVML+MTLHk=;
 b=bh0b3nxPEEdZZVDAqqlZbirh9vpKhYRCVz9kGyIr1u7YzqhQZyt2dzy0Dn5epei75TsoyIoI2s/DPbC/ps+mf4SpzKke11Btkof2KjnP/BZL1GApl/sSPHYC3vyAU11s6H28+ZnV3+NETnBukoEyq7NChD7F8vW067s+od10w8Aw8epn//+rvHlsyCE2jWf5IOLmoU2SKatPJOokHu1w9MCr+vKXN68Gf3knp8MCj+5c+KJ9z8fMXG8KUXhDC/mWMX9IPaDOdD9aNb4K6qwApsyYaW7IZPgfW8fZIFFbYzAsaLmD2M6/TDk1hdPbISGos7aoGkodk7YJbgs9nyj2lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7401.namprd11.prod.outlook.com (2603:10b6:208:433::18)
 by LV2PR11MB6071.namprd11.prod.outlook.com (2603:10b6:408:178::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 22:43:17 +0000
Received: from IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958]) by IA0PR11MB7401.namprd11.prod.outlook.com
 ([fe80::beca:81e2:677:2958%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 22:43:17 +0000
Date: Wed, 14 May 2025 15:43:14 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t v3 5/5] test/intel/xe_pmu: Add tests to validate
 engine activity by loading most engines
Message-ID: <aCUcgpkZb70FIND9@unerlige-desk.amr.corp.intel.com>
References: <20250512070551.774270-1-riana.tauro@intel.com>
 <20250512070551.774270-6-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250512070551.774270-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::18) To IA0PR11MB7401.namprd11.prod.outlook.com
 (2603:10b6:208:433::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7401:EE_|LV2PR11MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: bf82db00-2328-489c-9ba0-08dd9338b80b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0NOWTRYdGsxQ0oxajU4cWxlQ3ZWSUFlQ3ZsdzEzNU5pU2R2TWcwZGdpSEhq?=
 =?utf-8?B?ejE5d0tXSmMydkYwaG1NRFYzN1dPQ3FXYVdINWd0d2FzSHlmdVZSWlFBWXZL?=
 =?utf-8?B?V1FMQ1gzM1p4bXJhNmQ1OEVDMTNoOEhVU2Z2ZnZUS2xKaWdpR0pRZnJYSFBJ?=
 =?utf-8?B?R1A1M3hNSnN4RkZORVhnbEt1eTVvMUxPNEJGL1VQS2hKU0VBZWpPT0xzSW9s?=
 =?utf-8?B?aUpFOGRGZCs4aU8rVUFvRkNuK2tHMms4WWRSZkQzZkgxclpMOGUwZkNyVXZK?=
 =?utf-8?B?ekc2RGNGWFlia2E3Mlp5b1dIL2MrS29BZFBCc1M0RkxRNzRaVXZzdlczYkdH?=
 =?utf-8?B?Nm0vd3BkdDZwWEhxZi9rUGZCM3JvZkVwRVoyQUM3ZGxVcmVuWHFTeVVmWmF6?=
 =?utf-8?B?Q3h6dHh4Zzc1L1NiNmM1ZTZUeUhRMVhaeE45a3J6VVJ6WjM0b095MzVNRVpq?=
 =?utf-8?B?RXhaaDU2dURjUGZHa0RqSmJqZ2tYa3VneWlCeGF4WnpDQUdXOFFtVkNvQkEv?=
 =?utf-8?B?U09uSWcwM2hnNXBESWF1Vm5xWjVvQ0wreUc1L1YrQkFaamVZZFFqT3J2dkty?=
 =?utf-8?B?TWFPYjZlbEFWQ24yN0VVOTVaSWtkRUYzZGlSQUY1RytPWSt2SlQ4QW5BanZo?=
 =?utf-8?B?bnZ0ODBnSUlVUmU4VzRKVStoTFhqbTVJeHhMTnVBa0FmMXNWZ3NMdDMrOWtx?=
 =?utf-8?B?aEN5QjhlWTZ2dllQOC9xS2lvamhGOHNtcm5zNGVIdFNMK1JsN00zWFN4S20x?=
 =?utf-8?B?TjkwMTBiOFNvTndMbHpGVlF3TnNBY1Q1MmdFdXQ0VEU0QkZHTzd5Vk9QU0Q3?=
 =?utf-8?B?bGdNTUtGVnRZNnh6UDYzSzRla1pxMS83TWdwTmxJV24wTjhRQjMzMkovTXJN?=
 =?utf-8?B?ZjQvc2xEUTBRUHNMV05maUx5ZHV2NjJOR2Y0MGNraC9PTk0xNVNGajV2cUow?=
 =?utf-8?B?eXRPZXVYYThKNGtlU2c4QjVKdGNFeGdmRjJ1WlJvc1Blbm5CKytPZHJ1a3da?=
 =?utf-8?B?ZG1oYkZLUWpESGwrblVQTVJqa0ZlbG1PdjlqOUVUU2xXSHdrRGN5WGlZZWZ1?=
 =?utf-8?B?WVBsMDFQZTJjTDZ0NDN0dUF3Wlo4NUNYVUpSZDdEZExLQTdxQmZVQXhjQ0pM?=
 =?utf-8?B?dHF0T3ZUbTB6QVJYdnEzRDZJY25Ea2syQlpDQi80Q0l1SXpsZDFnQldiQTRO?=
 =?utf-8?B?dzdsQ1pLRVJvVVdzYVhTQ0JhL0toSnFTQnl6dm9YUzl4amtFUmhVMjhFT3FS?=
 =?utf-8?B?dzZEVmtkMW9IbUJaSEM3VUlaM2xMN2UzRlMyK0VpWkhocGtodGFkRUZpV1ow?=
 =?utf-8?B?NStvMzNxYjFZQ1BrSDJidjk3SUx6Nks5dWlSVmpxNlpJdmExa0V6ZSthK0ZT?=
 =?utf-8?B?U3ptZ2NHbkpVbUhudk9XZloxNWc5TVp2aEtUWmg3dWFpaE9MWFh6QWNLWC9K?=
 =?utf-8?B?bnVkRnlDVG5nZTRXNXVjS2psbldoSWpkZGtML2dpSnlpdytzN09KdzNjOENL?=
 =?utf-8?B?MkVDU0MxZ3U4T2xETUhDVnpRdkFnQjNLTlp3c2NKYTlZVkU0cW5QNFE2UlY1?=
 =?utf-8?B?cjE4VnJDYWtkUWVPZGlyU0Fnb0JRNldubUlJODRoV3p5cFl0a1lBb3dndUcv?=
 =?utf-8?B?b1pMS1VqYmRHTUVoVm5Tb2I4VnFNR1pyeGRISUJPRHFRQzJQN1I5aEozQjFu?=
 =?utf-8?B?RlRheFhuOVI0eWYrSjFZWFhZcGZ0WXliYjVCL2Vqb29wbHFsb2dGS1ZzYWJt?=
 =?utf-8?B?QlRBVG9UZ1lTT0o3Y20rbFZUTzk0bWFBQ2x5ZTYwZllBdUhLRVVoQkd3TGRz?=
 =?utf-8?B?ZGcyTnUzUTNzWU4xQjVTd1pPSmNJK2lVbWljbGtSK1hNcVdESzIwZk13V3pU?=
 =?utf-8?B?eVBKVW02Slp5YXlUZEYzdU1BT0N3bDZYbVA4SjRod09abGU1Qkg2bU1QWDhK?=
 =?utf-8?Q?scpR9wSHaic=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7401.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elB3YTF3bVJNbXU2WVg5UWF4R2FGMWpFSlFTNFBOU2tPRUVMczRia1lBUWZW?=
 =?utf-8?B?VEQ4YVhJNDhaRTBpNDVpdnVpeXRmQlUwUEdhRDgwR21HaExvanlRQ01ObFBW?=
 =?utf-8?B?aHp0bjhVOTVXcDVOVEtydHdIbmRMeDlGNTB6blBBN0xwQnhrOG1scDhkYmhq?=
 =?utf-8?B?eDhWV1dZTHFTRWhQRWoxVXFubWFYbnFmckduYzJ5TVRBQllINjh0dG9BMmty?=
 =?utf-8?B?dHluNW1yekpjYUxIaG83YUhxMGIwY0Vad04zOC8zR1FMenpUY0Vma1hwWkY5?=
 =?utf-8?B?bytRTVRSMjRYakdrMG1tWGhpZ3I1dWVvVzdPUlNjNjR0KzIwd0lDblZjZGV5?=
 =?utf-8?B?dVRmak9jcXZpd0NyN2pwczZ4SVlPL21lVS92Wld5WU5zcVR4T2M0RzZtcER6?=
 =?utf-8?B?QlZsdzFHL2FuOWhlSmZKRzV1VDZ6TjhtaStNRElKOHBYSllFaEJ0MjA3S21Y?=
 =?utf-8?B?N2ttb2FJYUxuRVFuelg5MWhJWG1yN3RqUmoyUElRdHJ0Q0w2cm43eldqSVJK?=
 =?utf-8?B?YktqMjFOaWtLVExMTVR0WEpkM1hwbExJSTNhc0xPL1RxeE5oamhUZklydWZK?=
 =?utf-8?B?VUYycVJzZEFYRnZZZjJjK2NCQUllSzd0QVhueGVtRjlOZkZJU0c3UjJMTytn?=
 =?utf-8?B?M0NiUTVnUVEyU1JGUHRYTUhGQWVMRWd5SmM5aloxMU9CQzlSb2VLSVVQNWkw?=
 =?utf-8?B?aCtlODhESTA1RlJiMmRRMXYrdGM0Z3R4Q0JpSVRTKzhIcEVPVnRHL3JiSnNY?=
 =?utf-8?B?ZGxWTjRqblBHM0pWZU5xRGNnZkdmeWpzcUVBa1JTOC9oaGpSeWUzUGNsZTU5?=
 =?utf-8?B?cmZ5VmpyT1VBZVREMTduVEZ2NmlsZ05yL3N4K0JkSERhMnB4T3dOQzM5aTZ0?=
 =?utf-8?B?SjU3a0pneUpZT2lFdnpvWFZPcHUvaDVYV0lrcGNpNzRUcTQycU5pZUxZTW1E?=
 =?utf-8?B?bVBGZlJnTUhtQVQ2N2Z6Nkx5bTNtN0I2VVh4SlRUWjI1ODZycmNyN1JvRFRZ?=
 =?utf-8?B?c3ZiM3E4N3ViL1Mvc2NCM0FsYnVqY0MvZldMN1NCMFFybnBDVXFHejd0TTQv?=
 =?utf-8?B?cTd2R1pCc05QWUJBWVFtNW9nTTloV3FDT0JLKzlRc0g5T2dMbkZnN0k4LzVa?=
 =?utf-8?B?NGN5cm9zZGdka2JmSGllckxCSVhzQXJrYmFDdG5aUlExdnd4MjQ0bEE1NU1Z?=
 =?utf-8?B?Qy9rQ0hEQlVTMlBGQWhNUGg0Q1N2dDJmZVErc0FmRlVOWi9OLzczNjJpYUQr?=
 =?utf-8?B?UDVTUEo3ejdtdDMwK1Z6QndGbXFzdDhzbDBPQ0ZydExUUThyOHRjMXFCM1NH?=
 =?utf-8?B?ZkQ0UDZNUkhpamluUzlzQ2wvbTMzK1ZmR3lEWVNRN1BLUUc3UzhuNTZrMEJw?=
 =?utf-8?B?bHNUejZzR3FraldvOVFnMVFkTDViU0hRWHFBVFRYUlJQb05jdnk0SjNXanlW?=
 =?utf-8?B?SmhGaDVodHRhR0cvTGJRS0p5dE4zeDRrb01LM3Nha1NiRTV5cGthM3dUSWto?=
 =?utf-8?B?T0ZJTVVVN0wzVGdOUXpDNUd5TFRLSTduTUJ4S2UzMno4MHQ2YXgvSmhVUHM1?=
 =?utf-8?B?ODlQVG1ndkVkQXRlU1h4a2UwNmFqNGRQS0Jud2Vqa0dyMFE2ODd4Y0VEZ2RN?=
 =?utf-8?B?VjU5RlZVTlBtYXBNSUpNMVBFditQQXp3RTZvdk1xSFJwZGVVSklqbzFIbHFC?=
 =?utf-8?B?SmJURjFUaXVmSUt4THBuWFY0d2JiRFVwdjhuelBLTGlRNHpGcXZiN2ZyTkhU?=
 =?utf-8?B?YTZBTWp4RnRYWUJnN0U5clpmcm5hVnpJM3I3M3BDVHBiOHVEMjhuYTFaS0ps?=
 =?utf-8?B?NVkvYlp4amNWS0pZUzRJd3pLaERQNkhkeVJhQjRaS1hreEFhMDJUc0hVT3M3?=
 =?utf-8?B?T2Vzd1hHdk0rS2VVSW94QTF4T24vR0x4aUVDT3pHWVR3V2l2U0hzWGtJRkVC?=
 =?utf-8?B?VjhiSENIdXR2NFliR3B1ZWJ1UkdFNm1sYys3cmlWTjhSdnozNGp1VjRDa0lS?=
 =?utf-8?B?TExaWjY2TG5adkZnd0VNeGFxNXBsWjRyNWV2VnFTR29HRU1aN0ZOb0FXeE1C?=
 =?utf-8?B?eUR5SjA4dVdyR2c0UWZDOEw2dE0yemcrM2pJOHNzV3czd3FBbENFOVhscVM5?=
 =?utf-8?B?RlVpdGFZd1o3a2pTMFUwMXFhbnZFeDFXSTBOR1BWUEtJTVRtYmRzbHc0MDlm?=
 =?utf-8?Q?cdfXVc5643OkHjJOBHmEfvM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bf82db00-2328-489c-9ba0-08dd9338b80b
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7401.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 22:43:17.3243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DzZ2qx66YECbEcXEFU60Es/v9tPEmd9spMfPE0N1sdcGoRIWYML9lKl4thaUc4mjGPeuFSrBuG/B5z2Oxg1VjZBRsdsJJxOdFaKdkBfQ6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6071
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

On Mon, May 12, 2025 at 12:35:51PM +0530, Riana Tauro wrote:
>Add a test to validate engine activity by running load on all
>engines except one.
>
>Also add a trailing idle test.
>
>v2: use allocator
>v3: use per-engine flags (Umesh)
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>

nit: Same comment as previous patches, the if check can be dropped if 
cork is initialized to NULL.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> tests/intel/xe_pmu.c | 74 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 74 insertions(+)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index 1a9b015d9..de0a74a56 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -40,6 +40,13 @@
>  * Description: Test to validate engine activity by running workload on all engines
>  *		simultaneously and trailing idle
>  *
>+ * SUBTEST: engine-activity-most-load
>+ * Description: Test to validate engine activity by running workload on all engines except one
>+ *
>+ * SUBTEST: engine-activity-most-load-idle
>+ * Description: Test to validate engine activity by running workload and trailing idle on all engines
>+ * 		except one
>+ *
>  * SUBTEST: all-fn-engine-activity-load
>  * Description: Test to validate engine activity by running load on all functions simultaneously
>  *
>@@ -315,6 +322,65 @@ static void engine_activity_load_single(int fd, int num_engines,
> 	check_all_engines(num_engines, flag, before, after);
> }
>
>+static void engine_activity_load_most(int fd, int num_engines, struct drm_xe_engine_class_instance *eci,
>+				      unsigned int flags)
>+{
>+	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
>+	struct drm_xe_engine_class_instance *eci_;
>+	struct xe_cork *cork[num_engines];
>+	int pmu_fd[num_engines * 2], flag[num_engines];
>+	int idx = 0, engine_idx = 0;
>+	uint32_t vm;
>+
>+	pmu_fd[0] = -1;
>+	vm = xe_vm_create(fd, 0, 0);
>+	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>+
>+	xe_for_each_engine(fd, eci_) {
>+		engine_idx = idx >> 1;
>+		flag[engine_idx] = TEST_LOAD;
>+
>+		if (eci_->engine_class == eci->engine_class &&
>+		    eci_->engine_instance == eci->engine_instance) {
>+			flag[engine_idx] = TEST_IDLE;
>+			cork[engine_idx] = NULL;
>+		} else {
>+			cork[engine_idx] = xe_cork_create_opts(fd, eci_, vm, 1, 1, .ahnd = ahnd);
>+			xe_cork_sync_start(fd, cork[engine_idx]);
>+		}
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-active-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+
>+		config = get_event_config(eci_->gt_id, eci_, "engine-total-ticks");
>+		pmu_fd[idx++] = open_group(fd, config, pmu_fd[0]);
>+	}
>+
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, before);
>+	usleep(SLEEP_DURATION * USEC_PER_SEC);
>+	if (flags & TEST_TRAILING_IDLE) {
>+		for (idx = 0; idx < num_engines; idx++)
>+			end_cork(fd, cork[engine_idx]);
>+	}
>+	pmu_read_multi(pmu_fd[0], 2 * num_engines, after);
>+
>+	for (idx = 0; idx < num_engines * 2; idx += 2) {
>+		engine_idx = idx >> 1;
>+
>+		if (flags & TEST_LOAD)
>+			end_cork(fd, cork[engine_idx]);
>+		if (cork[engine_idx])
>+			xe_cork_destroy(fd, cork[engine_idx]);
>+		close(pmu_fd[idx]);
>+		close(pmu_fd[idx + 1]);
>+	}
>+
>+	xe_vm_destroy(fd, vm);
>+	put_ahnd(ahnd);
>+
>+	check_all_engines(num_engines, flag, before, after);
>+}
>+
> static void engine_activity_load_all(int fd, int num_engines, unsigned int flags)
> {
> 	uint64_t ahnd, config, before[2 * num_engines], after[2 * num_engines];
>@@ -734,6 +800,14 @@ igt_main
> 	test_each_engine("engine-activity-single-load-idle", fd, eci)
> 		engine_activity_load_single(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>
>+	igt_describe("Validate engine activity when all except one engine is loaded");
>+	test_each_engine("engine-activity-most-load", fd, eci)
>+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD);
>+
>+	igt_describe("Validate engine activity when all except one engine is loaded and trailing idle");
>+	test_each_engine("engine-activity-most-load-idle", fd, eci)
>+		engine_activity_load_most(fd, num_engines, eci, TEST_LOAD | TEST_TRAILING_IDLE);
>+
> 	igt_describe("Validate engine activity by loading all engines simultaenously");
> 	igt_subtest("engine-activity-all-load")
> 		engine_activity_load_all(fd, num_engines, TEST_LOAD);
>-- 
>2.47.1
>
