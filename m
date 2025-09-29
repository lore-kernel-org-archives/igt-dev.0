Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742D3CAC5B0
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 13:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8FD10E420;
	Mon, 29 Sep 2025 13:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G0KmX5Hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFE310E420
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 13:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759153024; x=1790689024;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=70xiM3FEYt2o5o3aXqaekfaxKNPPA33RcK2j4WIbpUM=;
 b=G0KmX5HmxGcuhHMqU+1vOuGRWWhFercimGakKvIBidfU93db3vFgqZId
 +y9tFoMaj10gW7UVciUAfyDiA8a8BnkztUZbCIQaHHmHtFAx47nhuABIU
 hortVuTCdonJb9H790j3iR7FTI5wg2LYzVE2nLQcYWVI3c6PCvDUxLCp5
 FZvlm6Oan7Htr+SmWqVz2YWHp9lfp+ZnCGRUdWk/WXXOg7F89hTL725Tw
 NVEI60cN5tt1I+LZeLGlTU6tuD76xizGtmMwEiDVQCcS/dCW+08g0J0bK
 hrJAiyZhVM3+j+bRGeBiXPoIUq8rSl608YKLllX7aPAD7eqwWXb2qzr1y Q==;
X-CSE-ConnectionGUID: aFfamz6LSqu3neQdDLi1hw==
X-CSE-MsgGUID: obQ2lyS4T+CMmrwPhKnxbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61502929"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="61502929"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:37:04 -0700
X-CSE-ConnectionGUID: FgunZhtJS6eQ7KmLYnqJCg==
X-CSE-MsgGUID: xUKlG4C/SyihvqApvd0Dbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="178179443"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 06:37:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:37:03 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 06:37:03 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 06:37:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1Tvj1Y8ks867HRbEwp5IWzoOETqpQE4TPm9R286ZXHb4QJXuk6/ScLI8IBEAy3e1EnjHqX0nf5q9tCsBEbqI3C3jfZhMXeH5VGIyyLJ6zC9iJmm12qUKcxApPLi4x1Jjh7wGjYEA7hWVo8ZSz5ZeyXGAVFKgXNmJdHQNJUhRsFF5Pwa23oxjivV4SUBLVAA8CPqd/dli0lUsrY5AVKef2CG+EfHzZIvcY/DYO+oCTmWGeen0vFU2o3pxoPHbW42FEbsm+pZmPtrwlPRfgT29LTDpTimgDzxKRhymOKTY44nrMMOAVk+nVlL35cznU1GPzo/fkO2tbFiU7n0++N3IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70xiM3FEYt2o5o3aXqaekfaxKNPPA33RcK2j4WIbpUM=;
 b=unn/9Mq/qYqVWKWAfWtN8RHjhwATewu7JyIFR7Uk3k8rlf57zfMEqFXeVpQgDVxyxQp8KcGubj+jATeCZ5D8vMvYRoCQiadchF5tr3BDhHF1gMzNyjuiWxw6KSlcXbhnzD1rQMIs3/Z8/Zjk2enorOZVx1otNxWnSn+U6JBF1Ilmo0SalzrwTtzBRZLJJZXdA4j9K5Eut2yb7AdZL33QG1v+GxT/bsmcOZnDUsnx+7/iLI9RIpYGb4EB1n5ULmW8fF4z7U3+c/FD/kv8K5z86+6dd3Q+diabqc4/7N9LOHhMR2gm6Yv3wIJepSpDvp8uM2DkTeAxGvsxWq/HqhZfog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Mon, 29 Sep
 2025 13:36:59 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%5]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 13:36:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 29 Sep 2025 13:36:54 +0000
Message-ID: <DD5BP6AIX3HG.3ASSNSJBUL7NL@intel.com>
CC: Chris Wilson <chris.p.wilson@linux.intel.com>, Andi Shyti
 <andi.shyti@linux.intel.com>, Krzysztof Karas <krzysztof.karas@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Zbigniew Kempczynski
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH v2 i-g-t] tests/intel/gem_exec_schedule: Improve
 synchronization in pi-ringfull
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 <igt-dev@lists.freedesktop.org>
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
In-Reply-To: <20250926180302.61612-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA1P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::12) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7abfec-756d-41cc-07b0-08ddff5d43a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2hEY2pxUGd0SGcwQlRkRmEwditkQVF6eW5hV1pqSVpjY0psUldlRk9KTEhG?=
 =?utf-8?B?dUhVcXAwOTl0VzMvMlhNTFcxYTBncnIwbTNyUUNPaDFCZVpSbGVUN1JNQThm?=
 =?utf-8?B?NGpBcXVFQmlzS25xWlBlalNXbmxpOERmUExGVHFyYkZNNnNYS0VhZllRalpJ?=
 =?utf-8?B?TjVOdWl5bm8wS1dQNjdkbGdHckMvTVNTQ3lxL3dJN3FqSjBhMEtQdXRkVEc3?=
 =?utf-8?B?TkdCR3VKSkdKcExRa3JBSWRDWldhNkpnZE5KVjQwUDNCZHBmdG9Ja1ZIYkF3?=
 =?utf-8?B?Rk1nRFljOS96NjM5WjRNR1BRQ1pxNDcrL1ptai9TeFlnYzJ4ZFNCTC9JcW9F?=
 =?utf-8?B?MDFDUDRRczRGZUlYT0IvVHJ0SDIyRHMralZPYUNjK2JlVkpoNVN2b21MeXAy?=
 =?utf-8?B?dkJ1KzRpdUg3VnA5ZHYxYmpUN2dQcFdpQ3B4ZUxhWG1QWm9GYm1EbkJtbVYy?=
 =?utf-8?B?eUQzd0k5aTdFM0c5cXowNnArT09MMjVSaW1vd0FZVTVzT1JFdU5iNG83QUxY?=
 =?utf-8?B?SE1mbllRRXNBN0tHeUkxdGFaUThQenVMYnFYVHBKcS9YdmtlUS9BMEludWE4?=
 =?utf-8?B?OUtGcDJBNEE3T1psaU12S0xGVHUxWGNOczAybnJkYm81Y0ZjSlhld0xYdXlJ?=
 =?utf-8?B?Y2ovWi8rbUkwRktucy9FVlFBVkF6a1JBZnR4Z2srelJ3ZUQrOE1nOFhvek16?=
 =?utf-8?B?VEpXakxoZUkwM1ZuQmFCUlZGNUhQNXZ5NlcwWHd4eStLcExwRU84alJ6R1Qr?=
 =?utf-8?B?R0NuOGo0dlFSQjE2aERqNmNUN2xMS1RMcEYrT0xwVkYxYmlDRlo3VlRyRFlE?=
 =?utf-8?B?eGxnSWdsVFZyZGtzRml1VXNWc2RvQVh1dXNUOVUwMEk1L2U5SG03VkRMVFVr?=
 =?utf-8?B?a25YVlFCMUpvb29haTNOYVRlVGNhWHNCc0hkQmFBbkRuOW9ZMWg0UlVZYjcv?=
 =?utf-8?B?R0RHUXhwMmZTSXZPUW8vS3VrUm43QWtHVzJhSVFRZW14a0NJUVFQQjFJTTNQ?=
 =?utf-8?B?T3ZsZlVEOFV1aTJyVXBXVklQR0w1MEtpUDg0OHJBM2hSc0tmTU1odmxTdGdM?=
 =?utf-8?B?NDR2bmdVVnd5L1JOQlgxRlhpblBuVDloSVMzbjgzMDFHT052S3E5N3phcitZ?=
 =?utf-8?B?RTRZcWRMdlVYdFB6ZFZsUHhJWU1RMzAvWnQ1ZjBVQkV1aGhJcit3ODh1UGpl?=
 =?utf-8?B?dzFUTmVDaVZLMURZczZ1T1pTaVp4eEFFbVI1eHF1M0RyMnVzNVpnQm1YUkNV?=
 =?utf-8?B?MUVZR3p0Tnk2V1pLb3U4RXZhTXRrM1FlOVdqYmlPNXJ0R3VHTXNkcGRDR3V2?=
 =?utf-8?B?eFR5RjhROURLRE9NSnIyOG9BbkFEM1AyMG9FNDIySVk0UnE1cGNzMzgyZjh0?=
 =?utf-8?B?SVBKcTZPVnhrZXM3SkJ4Ymo3aXRSeXE5WXRENWgxdGVtOXYwQlkvQ25pbjda?=
 =?utf-8?B?VzlWVHl4QitKME5MbnFrak01WWJCODBkemtTNktiV2tXdDZSNGJmNUhlNWha?=
 =?utf-8?B?Qm9HalhpbVlTMHVtRzVpWVZET0piMFBzK0pCNGtsd09nMFVqNjNKVHl4a2tw?=
 =?utf-8?B?L0J2Rnh3S0g4Y0syUmdad3ltR2Y2RzNEYlVLY0I1Y1l3bEEwRWxLbGtNUlE3?=
 =?utf-8?B?NzJuZ1d2RUQ1QURKM0ZKWjFiL1NCMTZ1bE83WUZWek8xWmFpUVdSTW96Z29o?=
 =?utf-8?B?QlV5b0hBV3d5RlM1ZnNuMndKblZUekgwTjVqMzdsRHJTQnVlNytySGJNbnpX?=
 =?utf-8?B?bGZVUDdoY3Y3L3V5SjREVjJrSW9LbzRRcWcyWCs1Rzg0NWs5bDEvdGJ5QU93?=
 =?utf-8?B?cGNzY2wwS2loZzJkNzZ4Mi9NTFZycnoweWFObkdnUC83VG5qY00zRFBwUmh3?=
 =?utf-8?B?QWpuK3cyTUoyRXd4d0ZFbWh2Tlh5bUVIOFpTTVJmalJ0aXBuRFUwUVZ3UlNG?=
 =?utf-8?B?Y1pYdE5jV0pPanhUREU3RFllQW9XOFlyTjNrUVJJWDFFUkN4dDZtL0JpbG0w?=
 =?utf-8?B?aXh5VWR0UWFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWIrV1g0L0JaWjVLSnk4MlBhaDR5a0l6Y0NhbUZ5VDN2MW4rVTJtaWJZL0p5?=
 =?utf-8?B?MWVpeWRvWDEvbVhRK2tuUm80NnMzNVQ3UVVKa2t1cUEwRm9sYVVMeGR5YTk1?=
 =?utf-8?B?UUIraEk5aVdSNDNMbEdNQUFrRzZGYkR5Z2xGUkZyc3pYa213b1Yxd0FpR1pu?=
 =?utf-8?B?bkdCeTFEUVUrNVdBeTZNVDcrVDVaMCtnaGZOK2N6UTVvZGpDdDE5Z0tPSy80?=
 =?utf-8?B?M1QxeWxCWFNhT3V4SG1KUEdxRC9SVjdPN1E3ZHpUVC96ZnpuamlBSkNyVWw3?=
 =?utf-8?B?NklXY2hEakgxNlVNL3JKU3R6UGEzVlhrQXdZSDlJTjNWTDF3N1Y4MGpUbVJ2?=
 =?utf-8?B?VkVBcm4zUU1PV0dOZVo0dkRPcVNLYVFNZjNtdUprY1U2d3ZXME5BTTlSYVZ1?=
 =?utf-8?B?cVROK1VJdEs3N3pVRWRMRU16Q1ZzWVRablM0OEg2bktJbDQwaWFCUUVIc0du?=
 =?utf-8?B?L2xIMlFSdW90aVpBWXB0SlJydWxjVE9TZzBJZlB1dUxUNC9YYS8vNVdrdUFz?=
 =?utf-8?B?eVVpN08rZmRucGZscXcwQjJUWDNzdStic2o2S0dtQi92VjdzQmFUSXBzL08r?=
 =?utf-8?B?RlpLamltVEU3bDhLTEFCc2NqVzM3RUp0VVZSZ1RTWEJhYmt4eUhUaW0xaWJu?=
 =?utf-8?B?dFA5cW9Oa2VxRU9kRVgzZ01zcUwzZnNJN3dtT2dQWFFnbzdvbk1iUkRVMkdz?=
 =?utf-8?B?ZEx2WG1va0lMTjlIVDU1VS9KaGNwVmVkcXR3VU5UNXorYnRDVUIwZER0UWVZ?=
 =?utf-8?B?VWJsT2t0WUxnRXNOeXEreWVjVEdDemFvcUc0eEREcnFUUUVDR21XZTJFRXA4?=
 =?utf-8?B?dVJFU0h1bXBkRTBjYU40bmdPdVU2WlRtUjFPSjFzUTExK1BwRS9wN1dadEx4?=
 =?utf-8?B?bHlEWkZpV0EraUZxcDNEaFdiK3cxQk4yMFY5OWZXK1FOZ201VjM4TjM5cnA3?=
 =?utf-8?B?RVh4UyszVUxTRFc1V1U4NFpzNk9IS3FNTDVqV0ZLUHY0M0dwZWR5SzZRU3N6?=
 =?utf-8?B?bThTY0ZmQnJnNUVSZnZXN1ZxSUJ2M0lIdW5wOVNVV1gwRFVkM01NU2hDRjR4?=
 =?utf-8?B?d0hMd213TU94ZVFQODlwVWlYakhjdk4zYm9jaHBlTnRqL1c2akcwZTZUQURn?=
 =?utf-8?B?Z3IrYS9DdlUxdy9pRWxtclM3bFRIclhNVXVpa0I3NHRXeDBQSFZ2ckVSN21j?=
 =?utf-8?B?NjFWK1FTVmRiNkJwRFY2WXREaGYzSkMvSDBENW1zZ28vekg4MWc4MVZwT0or?=
 =?utf-8?B?SGo5d2NPa2R3a1lGM0hBNmk3MlZiSGtlQ1hrRzVRN1lCTUNPdis0VFJOMnVD?=
 =?utf-8?B?NHA2MjlWWHVGZzByejJTazMrUHdYUVRVLzNKM09tbFFVODBOV1h4QXhTbGNl?=
 =?utf-8?B?clFkTkhZQ2k2U0IybWhwcWVnc0xKeE9wRFpIZENyTE16Rzdrd0k0Z0RIZjNw?=
 =?utf-8?B?bzVXMmUycDUvYVE2RVRLYXFZV0xRRGdvaVliVTdMcFFHalVXa1NJaStwNG90?=
 =?utf-8?B?cWlwVmtSTUxSUnl2YmU3OVc5Mjd1aVpaZ3czTC9QeWxuUlVSc3BMN1RSQ2kr?=
 =?utf-8?B?dEU5cWpkQWd6Mi9PbWxXSWFZTzdrUTVQM1ArWis1ckFaVTIzNW1XQ05SVGZ3?=
 =?utf-8?B?MlIxY1Bkd0NrL2E0QWQ4SU51K3lOSVA2VkZhMnhDdG9ETWhKdEdIaGpJRHRF?=
 =?utf-8?B?TVJFNmw5bnI0WnNXZ3Y3QS8vNG9YemowbWEvUmFKaVNiYTFvdThkVDd2Nkl3?=
 =?utf-8?B?bTI4SlAvZ2RVcXA0ZSsrV3YvcFk4Qk50M0k3Q2dFRDgxZHozYmdkaFk2YVZV?=
 =?utf-8?B?VCtpV1ArUi9YM2FEVitlT3VZUkVRYm1XWXEwRlNrM21uOGlhN0M4MFo2WHdM?=
 =?utf-8?B?ZXNpNEpvNEVra014RVVFRy9UVzVNdkgvK2Vleko5Q0dqajdhdTZ2VTNpdXFm?=
 =?utf-8?B?V0F0NExWNFkyY2xzMyt6Tm01ZUdIc1dtc1hBOU1VZnNKRGhPZ1NoWkFHYnVy?=
 =?utf-8?B?Q0JJcHNZSHpmamxTdDQ2cS9yNlJEODI2RkZ4Um5wVkR5S040ZWlKSFNpUmE0?=
 =?utf-8?B?UHFRSlFmeUFxUHhFT3NKT25mMGM3WmZGZzhJVExsSjV1anpTS2pSbVpTZTdp?=
 =?utf-8?B?dUNDemNuaTZRT3BYR0YxTGpubFZBa2gxYWJVQTVTM0JlNWp4MitoVURFWkNY?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7abfec-756d-41cc-07b0-08ddff5d43a9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 13:36:59.1487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W7EakM6wFZ/TCMnqvwVPAvZcDMcm/n2V9DBAsYBc9f5GA26AjpNPKiV+2pz/tc3AdPb4Znjjsu7Bvzm5AHE4TiV9WE9jXUYR8TZEIeaHrqU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
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

Hi Krzysztof

On Fri Sep 26, 2025 at 6:03 PM UTC, Krzysztof Niemiec wrote:
> Move the interrupt timer from the parent thread to the child thread as
> an explicit signal raise, and make sure the order of execution between
> them is always the same. This reduces nondeterminism in the test, fixing
> bugs like [1], where the child is starved out of CPU time up until the
> parent gets signalled and monopolizes the CPU before the child could
> submit its own execbuf, failing the test.
>
> [1] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14898
>
> v2: make the sync variable actually work (Zbigniew)
>
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

