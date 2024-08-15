Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02887C52D7C
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 16:47:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B597D10E482;
	Thu, 15 Aug 2024 16:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZPmfkIxJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92F0710E482
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 16:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723740426; x=1755276426;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tcaEIXxMl8ZKCTgUYfbotgZBe2N5nHWf90uxwcJ77Fo=;
 b=ZPmfkIxJA8+sV8nqEXlbAxGqfSE+WZUPmObHZPGBhqlAI+pcQtky8Tsj
 frybYkyFt8ySzplExzGDiDfsqdEwdbY0OoMqDrFpoD/E4BsKUYhFxtvJ8
 oJiGe/rpEQYv8N6MkRo0KLiP5O6SrQNBN60FecpSV6+QGsOJE4W4Go9Qe
 fx9DmsFhubp4gOhn5LyQXqVJq2AMVhz/+aBIQiAgk48rQ+uF/cCZ7dxJJ
 FYhtLUucRXpo2cFYQxX9vf8Emq9lN+YwhFhcrTl7RlbIoM6qNZJrAy+x1
 IOteqIsXatLOljxOHYc3rHS3ngX184tOQgUGw9X3O8pbvt+AFjfYr3bLf Q==;
X-CSE-ConnectionGUID: C3eWvVjFQLWFDBSGIBaUyA==
X-CSE-MsgGUID: 8ChndNzMT/qtHfPYwTLX0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="13035244"
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="13035244"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 09:47:04 -0700
X-CSE-ConnectionGUID: xsToeQJsRNC+LhQ0QBi0Ag==
X-CSE-MsgGUID: b2oIt30ZT167uLPRbcSldg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,149,1719903600"; d="scan'208";a="59561408"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 09:47:03 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:47:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 09:47:02 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 09:47:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 09:47:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WOeF4Q62YgT3k3vGlt5KZ4ruvxAFOEVbBHfgSTN0JYyYaGsRu1KDZDTZruZ2Jk98n5lCIDLDLFyTZdibRxos/PnWcAGNyyzKrJ6aFfQXowAoB+cPfIYUxg/UZFy6S5iFxPT5tF6JsV7KYzwE9gLoHP93wFXadbifndQxZEsaaxiE+8RF1UPBAqM3Tua5kojP04t/2chlQKbooKOWD/2TPOQgHAYCSdEY6glqADF1+iLKLBqG7Ogei8Vu82+ZV718QIsxkTsoarH9jpj1hQx0R5KUJM9VNfLqM0bHk5n1F9wR002wxzjOJ0LCX+vq3KXsdRbFTaGtXzYqJSPHyqHZXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRKUESWV4whE/Qd0nLA0R164p7PDA4ZXMWbBG/2NO1M=;
 b=xT8LhAxeB1N3gkYWowlim9leK00xzYU6LBlMFhojRhJ72tTXmTZWZUJfSPmWe205nM6TkNwfsYhFVn7icmhcK6gpDQhsyMlYQ7Ov6mMvUOp4N7n7d7O8d5VGak6orbAn2jDwxUK1egXAjWO2xJcob/mdjlAnBb/g26oKI30JNekDBB7fbymrEYi2wP8N0cWtbRbOtKp+oGQgtVyCFCMuQwrZqV9lR2ded7ClwIhBKRj3P5MqOy3paeM4lp1Lp6hsKLPThkGCKYqC8q6NXj/MLqDu6568BUOceDTnldvy68kw5W1J5D/PPw/UkJFwq0Fk/EVfEcMdcPjUgYECjnp4OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB7126.namprd11.prod.outlook.com (2603:10b6:303:222::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 16:47:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.016; Thu, 15 Aug 2024
 16:47:00 +0000
Date: Thu, 15 Aug 2024 11:46:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>, Zbigniew =?utf-8?Q?Kempczy=C5=84ski?=
 <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t v2 04/10] tests/intel/xe_drm_fdinfo: Add helpers
 for spinning batches
Message-ID: <vezlgbtylgo6nghrgfr54gcddo2whscaf2trlsbjox5uwravz2@r7ddlu5lbaj7>
References: <20240703002532.3156277-1-umesh.nerlige.ramappa@intel.com>
 <20240703002532.3156277-5-umesh.nerlige.ramappa@intel.com>
 <o73rxaucq4ul5cuyl4j3r6dynatc6rt7npip3npxna4ffeangn@nzr3um54pt5v>
 <ZpAkbG2v/7plCgAo@orsosgc001>
 <ZpBzD4KnSj8M9aOL@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZpBzD4KnSj8M9aOL@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: MW4PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:303:6b::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 332ddf62-c172-4829-a4c7-08dcbd49e23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTk3UWpHRkFOWUg4cUZGOTNCb3JzZlMvTjFPVnlnVloyYW96NThiYm5FaHBt?=
 =?utf-8?B?dUwwT252OSs2NFQ2R0g5cVZCNTJtRzhmRVhLUlJBNTJjZTYzSnZCK1FHdnIy?=
 =?utf-8?B?RUJhTktBTTVnVTFNSDcwUncraEVLcUtBT2dYbjNZSkdDM25qTkFmaGFkSHZV?=
 =?utf-8?B?MkJCTXdENzRJaE5kMDF0RnhIMFVmc1RXOUQ3OWE4R0hSTUdtNkVSYmRrWDZW?=
 =?utf-8?B?NldNU0cvd3h3M3pubGN6TGdlZEthUkNtSmMzSXorenZoVW1KRXl2WTdocjc3?=
 =?utf-8?B?R0htcWx1L1RjUU9SdHhXMmpQYVRoZTc1RGRPV0dBeHVlM0pSVTV0cnJxVUU0?=
 =?utf-8?B?VHhZK3VzUy8renNxbzFBTGV4ZEpPRk0wS3NyeTNJOWk2WUpuelg1Ryt3cEdS?=
 =?utf-8?B?Q2hhWTRnclEvV1Z3dmpLNUFJaHdtMFA0bmRpQkEzTmt6N2g2QW5TNlFnVUxF?=
 =?utf-8?B?U2Fvelo0T1U1enRMY3FXVzdtMEEyVURpL3RjbXlGYitoeitUMXJhMllBME5Y?=
 =?utf-8?B?NCsrOUZQNlNpa2U4a2xnRGY3SnlnNnBLaTc3T3pwWURNN1JleGNIK0xjbWVU?=
 =?utf-8?B?ZEhlNEpYYmtpY0lFNzYybEVCaGpsQnJhbVNGTWlwU2EvR2J2aWtEQ3NJVzlC?=
 =?utf-8?B?d25wa2wxQkxRRUtRNkhxSk9VNVFUaGM0NTVRTlA4K3RLd1R0Q0I0UjRHdXlj?=
 =?utf-8?B?Z0hCcmJBand3OXBxanBOb0grQTVjeDJzenNtVWhaRUtMYkpjdjF2K0lZNnpW?=
 =?utf-8?B?NlZJNFpUeDlRZ1h6b0VnRnNPTjVzWGNPRmQzbjlkUHFIZFZPMFBhWFl2aVFv?=
 =?utf-8?B?UkxLWFNMVnpXRlA4RmJVNHdLOVpodjBJU2czU1Y0NXNBZkg4VmVRd0huYW5L?=
 =?utf-8?B?bld4d2JDYk14T2FKMkdrU0RzWlN3aWhTVkVLYmtjb0Z6c2M5TjhQQjFPUFNi?=
 =?utf-8?B?Y2pYZ3V6ZkFZMGZkdE0zYVIwQTNEQVZvdlE5UUJIUzNlTGVPbmFYVTE4M2Zh?=
 =?utf-8?B?R1ZvN244MGoyQjdQam1HaStwNmw5L0ZYOXBkbC9aekloVUhCWlZBVmxiS0tT?=
 =?utf-8?B?QVlpalV0UUl1bDE5aituUjBtbTFBUEd5QVlqNnhmdC8wUk1ZcnpQV0dmMmNO?=
 =?utf-8?B?SnM1MW5DeFREZ3hzT3NQbWxENUdkd2ZSTW43OXdhL2M2eWxmcXJTeTFyYUxw?=
 =?utf-8?B?cnlJSlcySWlHSUwwekYwamVGNURyNngyNnpPd2JzM0tkZWJWNHZDbGZGbGdT?=
 =?utf-8?B?U0k0eDJVUm1BQlFjN3NiT2RKYVhoREpLUzBOK2pDMnhNLzZTUFB3WnFJZXo2?=
 =?utf-8?B?VEhOSm44dVcxZ1A2eGRxcVREcithdllxa2xJN1M3MG13K0QvZzR2RDVkZUdU?=
 =?utf-8?B?NUVqUXNiaFhmMFM2VVVHYlRUVCtjWld4Z2tEb2p6enptS2JZOXJMcEFxLyta?=
 =?utf-8?B?bURxQ1VjcGY2N21SdFJRd2YzREVGN0FrMmpNempoRlZla0xpMHNBY0JHMzI2?=
 =?utf-8?B?RS9USnp6WGJOYmNSVkJBNEJPMnd5dDBKL0NyemIwa2p6UkNSemxoempibm92?=
 =?utf-8?B?V3pWZXM2L2hsRnBuY0lFTFhjaWZMOGdIZE1xU3hqMlpDdFozVTZWcUNyMXkw?=
 =?utf-8?B?YTV5SGNxRGhuR3B2ai84elVFTlRhRlNtekExSitBUXp4N1AvbmxJKzFMb2tH?=
 =?utf-8?B?cnB0NDNnQU1UcGtEYWh1SHRlTk1aZjEzeUNKQjZMWWVWVGNob0JZTmNSbXNV?=
 =?utf-8?Q?KT4ajLgnHD/9PJEkc0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFQ4bTlTMm9JK2dNTkRlYVh0WHNsUHUzNE1jRXFQcFNwbVVrbnEyZ21ydStK?=
 =?utf-8?B?Z2dEWkYydTRiZitjRitERldlZDNSd1BCNmhMTzlSTFFmQWFTaHByelZUbk1I?=
 =?utf-8?B?Ujg5MENmV0p1MnY2Tno5ZDRZbkZCQVUrRFZSRzZ4MmF6MnJpN25aYytBVnVu?=
 =?utf-8?B?YnQvbmlPejliajVGa3ZSMFkzYjA2QWlWWFdjWkZ5enpuRmR1dGRvWEx4ZHU4?=
 =?utf-8?B?clcyUUVHRzh4dTZjM3FqaHVHM0xtQ2o3TERTaWJaQXVDWm5GeFR3cmRhMlha?=
 =?utf-8?B?bC9ZV1VFd1E3TUVQdEJnWmFRNHZGM1JzR2hlTk9KeWkxaExqU0d5OEVoVWlr?=
 =?utf-8?B?Q0YraXg1UXRKTFFlNUVRbFBDQWxqZzNXS2YrczNxRnQ5VUhwRmV1WG42SWUy?=
 =?utf-8?B?QVVBc1BCSkorb3V6WkRxaHFXMU80Yk9qc1JrYm8wdlpTMkFENXNIQ2szN3FZ?=
 =?utf-8?B?TG1SNWdPS3RjS3VKSHRZYUd4YjlXRmpWdm5CaGlOQlVja0dZdVhyZWhaM09M?=
 =?utf-8?B?eGUzVXZ0ZVZoOFZ2dUJNNTZuaTZYMTBXb01aYXRKcE1mZFJzdmREVUFXMzJr?=
 =?utf-8?B?dGNYWitxc0h1ZjA3QTV4bWh3SVJ6Kys3YU1uYXRrM1ptQlQ0TisvWmtPcFNX?=
 =?utf-8?B?emRzdmM2cXdvaXMyMWk2RndRWlMvaER5Z2dnZE03blhoMUtYbHpNY3pvN3JV?=
 =?utf-8?B?L3VBU1FEWFhhOElJd1AxOVFBdXVCM09TQlN0WGVjcjVpc2NYc3BRdVZGeDBv?=
 =?utf-8?B?eHJCNWl3c3JHTlJaMllKbWIwZVR3SXArQ293NVN0Yk5QZHpIVGxJM2hlRGpH?=
 =?utf-8?B?RlQycXBoeDV4ZnhGRzRpL3ZxVjRHWThGRW9RdnVWanA4M1k2NHpBbUZDalI1?=
 =?utf-8?B?NFZuU004VmtYa29UUEJNUW5VRXhkTEtMNTNXYUdYb0xhclZ2TEJ0US8rR3c5?=
 =?utf-8?B?Qmg0U0Y3cEFYWGZobUFVUmVOay90dUxJaXI1eWxRK05zMCt0amlGWWxLWGtO?=
 =?utf-8?B?UnRvcWQrYWhXRHE3Sml3blE1UW1zUlFTL3dZMW11djNVWE93WDRjVVZQYllu?=
 =?utf-8?B?eUVIemsxTndGNE1KaFVHOEhuZWdWcEtpa3o4cXBWS21SSGRFUXVJYkc1LzFB?=
 =?utf-8?B?UktUNUdjRjIzU1JUSDF5bkNFWHdKelE1Ukx1VTN6dmtuVUdmeG0ycWIrUVJI?=
 =?utf-8?B?MUVNb2FZK3NhR29telRkRlM0N0xjVzlBbHROZWRwaDBwY25pUVFablk3cml6?=
 =?utf-8?B?amlRM0ltUnNWK09GL0QzTzV0R1R4V1F0WTUzZUJZTEwrbXJkR2Q3ZkY4bENR?=
 =?utf-8?B?NUVzOWVsZi9XV2NxTURQaldwM1p2TVRRQ3pXdkU2ckNlelk5bUwrRUV3TUpQ?=
 =?utf-8?B?ZTBXK2NMeWM1cnNtVnlEUFh3R2hNcW1xaXFxM2FjUDNZbSs5eEhqL0Y5RHpI?=
 =?utf-8?B?UkJPeEVzNkVwaDU3MkVkVEtDME0xdUpuVzhnRnJJdE1NUVVoUkpsZmJMM2xa?=
 =?utf-8?B?Umh3RlpzRnFyVlRTNEtnTXJsOHBkUUNHYWZDN3pweTdmT0J0cEtsVnVRVi9k?=
 =?utf-8?B?QVlncXgrUlVXL2Z6ZTYwTDdwcG5ldy9Fd0JjT2ZQcG9yQll2N2RRK1FFalVS?=
 =?utf-8?B?bEhTdUg0dEZlVFcyOERhb0ZhY0VIT01mb0pxSWgyNDRQb2tUTzVwcXN5TTdr?=
 =?utf-8?B?bWsvMDY3cVpGaEQ4OFJvQWk5a0Z2UTQwdFlCTTgzSitlSGI4VEl3V3BnOW11?=
 =?utf-8?B?Y1hFYVZ2MzV4SkpqVmxIVUF6UVhwa0pLN3hFQ1U3ODBnQ3VHR2hMR2JXL2N6?=
 =?utf-8?B?Z1QrTFZUOFpURGxEMXUydEpIMnBBUXFhQ2tNbEk1cWVLZUlYMHFPdzVubjc5?=
 =?utf-8?B?b0RjUlo3VStLQUVnTEhQY1FzY2gwNlBRNFIzQ1VuOHkrbDZMaXU2a3Q2dkV0?=
 =?utf-8?B?Qzl4UG1nRXJ1eFl0MEtiaEtvN01wMG5pMDV2akdBMERjaVdLNGJVWkNoQzc1?=
 =?utf-8?B?SDR1encyNkhRWjJha2FxUkh4dEJWTHAySXFCTGMybjhWd2hrSDZVcFFvWmxN?=
 =?utf-8?B?dmFmSEZob0w2dnoxRWpESzZTaXZSTGhEYlltQXNLY2tnakhoc3grZ0Q1dTYx?=
 =?utf-8?B?dGw1QzdsZWJ4NHh4WU44MkNlb1RTV0ZjcEFjOXRsZTFxOE1vWHkxUEJLM2VG?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 332ddf62-c172-4829-a4c7-08dcbd49e23a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 16:47:00.8565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x7WfJfNMWMUDXkZ0YraaNdHVjSjwnDlLly7BVMyvh5qbhupb0jrCum9qyVMZTIG/TlswMRX9rpZTB9tlG1yuUldQ3Wuh+UwdJAmN3bKlQu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7126
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

On Fri, Jul 12, 2024 at 12:04:31AM GMT, Matthew Brost wrote:
>On Thu, Jul 11, 2024 at 11:29:00AM -0700, Umesh Nerlige Ramappa wrote:
>> On Thu, Jul 11, 2024 at 07:46:23AM -0500, Lucas De Marchi wrote:
>> > On Tue, Jul 02, 2024 at 05:25:26PM GMT, Umesh Nerlige Ramappa wrote:
>> > > Add helpers for submitting batches and waiting for them to start.
>> > >
>> > > v2: Remove xe prefixes from the structures and helpers (Lucas)
>> > >
>> > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > ---
>> > > tests/intel/xe_drm_fdinfo.c | 135 ++++++++++++++++++++++++++++++++++++
>> > > 1 file changed, 135 insertions(+)
>> > >
>> > > diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
>> > > index c697f3e53..037f25e53 100644
>> > > --- a/tests/intel/xe_drm_fdinfo.c
>> > > +++ b/tests/intel/xe_drm_fdinfo.c
>> > > @@ -54,6 +54,17 @@ static const char *engine_map[] = {
>> > > 	"vecs",
>> > > 	"ccs",
>> > > };
>> > > +
>> > > +static const uint64_t batch_addr[] = {
>> > > +	0x170000,
>> > > +	0x180000,
>> > > +	0x190000,
>> > > +	0x1a0000,
>> > > +	0x1b0000,
>> > > +	0x1c0000,
>> > > +	0x1d0000,
>> > > +	0x1e0000,
>> > > +};
>> >
>> > where are these numbers coming from?
>>
>> The hardcoded number above are arbitrary, although I don't know if that's an
>> issue. I did see similar numbers in use with other xe tests.
>>
>
>See below, I think you can just use a single address when setting up the
>cork (see below).

because each cork uses a different vm rather than the shared vm used
here, right?

>
>> > I'm looking at
>> > tests/intel/xe_spin_batch.c and the lib/xe/xe_spin.c implementation and
>> > I don't understand why we need to add so many helpers and handcrafted
>> > things in this particular test.
>>
>> These helpers are just a break down of something like xe_exec_balancer.c ->
>> test_exec(). The helpers are still using functions from xe_spin.c.
>>
>> The breakdown helps control some execution elements for batches like (1)
>> using a single address space when running batches on all classes, (2)
>> configuring width and num_placements for parallel/virtual cases and (3)
>> provide some flexibility to test utilization when the batch has started
>> running.
>>
>
>I see what you are trying to do, create spinners for virtual and
>parallel exec queues.
>
>I think the proper place to put this would be in xe_spin.c adding 1 or
>2 new functions that look like xe_cork_init() but for virtual and
>parallel exec queues. Then just use existing cork functions for
>everything else.
>
>I think that will work.

It seems like one problem with cork is that it exec on init.  Maybe
adding a xe_cork_start_sync() so we can separate the setup part from the
start part would be ok?

We could do _init() + _wait_started(), but with the current state of the
test we are trying to minimize the jitter to calculate the time in which
it ran. Although I was thinking... if we stop checking the cpu time and
only rely on the gpu time we collect from fdinfo the igt asserts should
be more reliable. And another thing we could use is the time saved by
the gpu in the spin itself.

I sent a few patches to better abstract the parallel/virtual setup,
similarly to what you suggested in another thread:
https://patchwork.freedesktop.org/series/137317/

I think that should mostly take care about the parallel/virtual tests
added here.  For the single() ones, I squashed locally the patches 3-5
(because otherwise they create warnings) and I'm thinking on merging
them mostly as is. Then I add the missing cork stuff and migrate the
test to use that instead of the local functions. Thoughts?

Long term I think we could do:

	s/xe_spin/xe_spin_bath/
	s/xe_cork/xe_spinner/

Thoughts?

Thanks
Lucas De Marchi

>
>I don't think any IGTs actually use the cork stuff yet (several probably
>should) but I did post an IGT recently [1] that made use of this.
>
>Matt
>
>[1] https://patchwork.freedesktop.org/patch/600254/?series=135143&rev=1
>
>> Regards,
>> Umesh
>>
>> >
>> > +Matt Brost, +Zbigniew Kempczyński to help help here
>> >
>> >
>> > Lucas De Marchi
>> >
>> > > static void read_engine_cycles(int xe, struct pceu_cycles *pceu)
>> > > {
>> > > 	struct drm_client_fdinfo info = { };
>> > > @@ -329,6 +340,130 @@ static void basic_engine_utilization(int xe)
>> > > 	igt_require(info.num_engines);
>> > > }
>> > >
>> > > +#define MAX_PARALLEL 8
>> > > +struct spin_ctx {
>> > > +	uint32_t vm;
>> > > +	uint64_t addr[MAX_PARALLEL];
>> > > +	struct drm_xe_sync sync[2];
>> > > +	struct drm_xe_exec exec;
>> > > +	uint32_t exec_queue;
>> > > +	size_t bo_size;
>> > > +	uint32_t bo;
>> > > +	struct xe_spin *spin;
>> > > +	struct xe_spin_opts spin_opts;
>> > > +	bool ended;
>> > > +	uint16_t class;
>> > > +	uint16_t width;
>> > > +	uint16_t num_placements;
>> > > +};
>> > > +
>> > > +static struct spin_ctx *
>> > > +spin_ctx_init(int fd, struct drm_xe_engine_class_instance *hwe, uint32_t vm,
>> > > +	      uint16_t width, uint16_t num_placements)
>> > > +{
>> > > +	struct spin_ctx *ctx = calloc(1, sizeof(*ctx));
>> > > +
>> > > +	igt_assert(width && num_placements &&
>> > > +		   (width == 1 || num_placements == 1));
>> > > +
>> > > +	igt_assert(width <= MAX_PARALLEL);
>> > > +
>> > > +	ctx->class = hwe->engine_class;
>> > > +	ctx->width = width;
>> > > +	ctx->num_placements = num_placements;
>> > > +	ctx->vm = vm;
>> > > +	for (int i = 0; i < ctx->width; i++)
>> > > +		ctx->addr[i] = batch_addr[hwe->engine_class];
>> > > +
>> > > +	ctx->exec.num_batch_buffer = width;
>> > > +	ctx->exec.num_syncs = 2;
>> > > +	ctx->exec.syncs = to_user_pointer(ctx->sync);
>> > > +
>> > > +	ctx->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> > > +	ctx->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> > > +	ctx->sync[0].handle = syncobj_create(fd, 0);
>> > > +
>> > > +	ctx->sync[1].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
>> > > +	ctx->sync[1].flags = DRM_XE_SYNC_FLAG_SIGNAL;
>> > > +	ctx->sync[1].handle = syncobj_create(fd, 0);
>> > > +
>> > > +	ctx->bo_size = sizeof(struct xe_spin);
>> > > +	ctx->bo_size = xe_bb_size(fd, ctx->bo_size);
>> > > +	ctx->bo = xe_bo_create(fd, ctx->vm, ctx->bo_size,
>> > > +			       vram_if_possible(fd, hwe->gt_id),
>> > > +			       DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> > > +	ctx->spin = xe_bo_map(fd, ctx->bo, ctx->bo_size);
>> > > +
>> > > +	igt_assert_eq(__xe_exec_queue_create(fd, ctx->vm, width, num_placements,
>> > > +					     hwe, 0, &ctx->exec_queue), 0);
>> > > +
>> > > +	xe_vm_bind_async(fd, ctx->vm, 0, ctx->bo, 0, ctx->addr[0], ctx->bo_size,
>> > > +			 ctx->sync, 1);
>> > > +
>> > > +	return ctx;
>> > > +}
>> > > +
>> > > +static void
>> > > +spin_sync_start(int fd, struct spin_ctx *ctx)
>> > > +{
>> > > +	if (!ctx)
>> > > +		return;
>> > > +
>> > > +	ctx->spin_opts.addr = ctx->addr[0];
>> > > +	ctx->spin_opts.preempt = true;
>> > > +	xe_spin_init(ctx->spin, &ctx->spin_opts);
>> > > +
>> > > +	/* re-use sync[0] for exec */
>> > > +	ctx->sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
>> > > +
>> > > +	ctx->exec.exec_queue_id = ctx->exec_queue;
>> > > +	if (ctx->width > 1)
>> > > +		ctx->exec.address = to_user_pointer(ctx->addr);
>> > > +	else
>> > > +		ctx->exec.address = ctx->addr[0];
>> > > +	xe_exec(fd, &ctx->exec);
>> > > +
>> > > +	xe_spin_wait_started(ctx->spin);
>> > > +	igt_assert(!syncobj_wait(fd, &ctx->sync[1].handle, 1, 1, 0, NULL));
>> > > +
>> > > +	igt_debug("%s: spinner started\n", engine_map[ctx->class]);
>> > > +}
>> > > +
>> > > +static void
>> > > +spin_sync_end(int fd, struct spin_ctx *ctx)
>> > > +{
>> > > +	if (!ctx || ctx->ended)
>> > > +		return;
>> > > +
>> > > +	xe_spin_end(ctx->spin);
>> > > +
>> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[1].handle, 1, INT64_MAX, 0, NULL));
>> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> > > +
>> > > +	ctx->sync[0].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
>> > > +	xe_vm_unbind_async(fd, ctx->vm, 0, 0, ctx->addr[0], ctx->bo_size, ctx->sync, 1);
>> > > +	igt_assert(syncobj_wait(fd, &ctx->sync[0].handle, 1, INT64_MAX, 0, NULL));
>> > > +
>> > > +	ctx->ended = true;
>> > > +	igt_debug("%s: spinner ended\n", engine_map[ctx->class]);
>> > > +}
>> > > +
>> > > +static void
>> > > +spin_ctx_destroy(int fd, struct spin_ctx *ctx)
>> > > +{
>> > > +	if (!ctx)
>> > > +		return;
>> > > +
>> > > +	syncobj_destroy(fd, ctx->sync[0].handle);
>> > > +	syncobj_destroy(fd, ctx->sync[1].handle);
>> > > +	xe_exec_queue_destroy(fd, ctx->exec_queue);
>> > > +
>> > > +	munmap(ctx->spin, ctx->bo_size);
>> > > +	gem_close(fd, ctx->bo);
>> > > +
>> > > +	free(ctx);
>> > > +}
>> > > +
>> > > igt_main
>> > > {
>> > > 	int xe;
>> > > --
>> > > 2.38.1
>> > >
