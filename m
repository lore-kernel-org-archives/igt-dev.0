Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EE7C71136
	for <igt-dev@archiver.kernel.org>; Thu, 12 Jun 2025 10:39:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A290210E7DA;
	Thu, 12 Jun 2025 10:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K73/zscO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819F610E7C7
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Jun 2025 10:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749724796; x=1781260796;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7sAQsJMFUgicJlLkcP3Vk+BPMzBziFkCx1KeLXbPoGE=;
 b=K73/zscOJthQqn2RjKGosuIjISv4bL6OZKyr8x98mbzDocYAV6nGz8GY
 vAQrAKsdZ875Y36hXOtHD2JMsgddRz2aHhDydz9OOWaJ3Mc9Q6Z4JLTyH
 NiUVKzlJH8sC0pqZQ7npWpTCqGPl6po0YLJbekiMHSwios7C1PrX6gIpR
 x3XzGSxAVE2XLtRmf6h/nur0jGNbWYUUC/nWbkaI9JVwRBs5evtWSZftg
 3f6woGtlZzCny0ZTN2AbsvVGO7YIqixBHIqkT4DiPf6nif9BN+voqsgvp
 yx2Tahe8setChGC3StsrgD3aVyYGKuvvNiiWtwnJ20YtA8FXO5pmJ9EX1 w==;
X-CSE-ConnectionGUID: dcAJ2lLMTlWExK5Ph7vIWg==
X-CSE-MsgGUID: PEyd5KQiQaKALkQeRlyovg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="74430590"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="74430590"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:39:54 -0700
X-CSE-ConnectionGUID: Utufp0U/RjC54m6msGr86A==
X-CSE-MsgGUID: p9pgQdJCTdaL25EsI+ycog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; d="scan'208";a="152760682"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 03:39:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:39:53 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 03:39:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.70) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 03:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bliL+k2wwSnJV9o5QDshcdmlfJD+/rQv5ymwnHAOX6r1Lh+VPfxWvfpzHpkZh8i7j0sj4ZK0mE0oJHW81oMj+6FRTuMEt2vetaUcyT8pBQjWRxfjus/lctFYIg9anUS2f6KO9eWhZigsDIzJuTq8Vo3Y1+aLx3GQOe1ChTiQiLbuBzONkZG0WmQNi2elBv+t4pxJnvi8CutYULwtbbr1byQM+QCzTgGUAOE5WzJMxFHf8Dj6Yn/2BefSrq7TIl8kvZ71Lg4PR0kCaF/axpX+sUBU6cDNyKWM8RQ7KWEVpm5L9FqPdkmANPu9RzobzQLCpubRkiaNB3UyeCUhxlqv+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7sAQsJMFUgicJlLkcP3Vk+BPMzBziFkCx1KeLXbPoGE=;
 b=t2VXDc5pHN7R3B+7Ec5SZmm9vykZjmz+qSfs+L4VOaZ/+U8pclZTsHdwAtqs4TVn6lppTyT264ozdcilQAvQeRxl2ksyE8qt4Zo39qiGpeVGPV7CrY8GJWwEaAu8MBVOw1okBGykVREeVw+dcV4Z7VRefDGRrCLsPAr3xUU4aSR3xvPFXaos2Ar9k+xryKcEG3zljjn+gWszuwaGgMTf9dZKGrTI3iqjpEDarN0L11vGFujUjfxTtvHStc6Y/pP0dxnYn8Dsu6gcw28UgEbn+bkIb4XHdCmtl9vw3VH/9QOrBC2expC0gtb0VJGoP/YuT9DAfwFhyKarUcCzwo3eAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.26; Thu, 12 Jun 2025 10:39:51 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 10:39:51 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v3] tests/intel/xe_exec_compute_mode: Fix assertion of
 batch buffer size
Thread-Topic: [PATCH v3] tests/intel/xe_exec_compute_mode: Fix assertion of
 batch buffer size
Thread-Index: AQHb23I86yroNcuMjkuSrSmXnZ2SD7P/PjEAgAAWfwA=
Date: Thu, 12 Jun 2025 10:39:51 +0000
Message-ID: <DM4PR11MB5456A6233F92AF8D5D11C254EA74A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250612081430.3697406-1-shuicheng.lin@intel.com>
 <20250612091530.s5vq7joo2xquitak@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20250612091530.s5vq7joo2xquitak@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: c7462693-9f4b-41ad-b436-08dda99d765a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dXN6SlUyeE9wTjE2STdibU5qYTVoWnhLS2w3ckttb0JzVEtkTGdYdDV0Q3RI?=
 =?utf-8?B?Vk1BZXAwdmF6MDYzamRHRURCOVBVbU1IZ3EwNGVWa1hnSzI1MkF4aXRPeEhp?=
 =?utf-8?B?RGtxbVpjSVFyNjJJT3BYVUdKWmRPcXo5cVhCRGZMK2tHbklCYVJIVjRHY1Ji?=
 =?utf-8?B?eEt3L2JJRWdqUFdoazhnZWplVU51UmNlY0Y0TTA1b3VLbk1INGRZNUo0Qk51?=
 =?utf-8?B?RkI4RlQ4Wlg1dHVGQ2JPb2Z3dkpYbHp3U2lDNUVzVmNzbk5jeHBIYTMwb3k4?=
 =?utf-8?B?amtMNUVlZFZsR1FSaGxEOUJwR1BIRUdwRVlXYVdGR2lYd3NrWWhWY1Y0cVht?=
 =?utf-8?B?c2R4eUdLZGJQc1VnTU1ibDVDOXhTdy9kRTRtNkpVMlNwWDV2MW8zZ1BpV3Br?=
 =?utf-8?B?czUyRTl6R2cwWnBlVmt1c254dFpyZk4yZTlIYVVMOXdYWEZzK2Q3QmdFcFFk?=
 =?utf-8?B?WTR1ZmZKajF4MTkxL1pkY2l3WGZtN1FxZEtab3NUWWEwQXQvWFYwQ3Jkb1Ew?=
 =?utf-8?B?ZnQ5OXhNQm55Y3o0dVRScUhwWUlOVVBpUHlEOHlrdnlGT0g0OWZ0eER5TDZY?=
 =?utf-8?B?UnpaMFJCa0o4a1B6YkQ1YkNqVjd2WTVsOHVoLysyZGR0QURmZWdyZExjaHhZ?=
 =?utf-8?B?aHVoRnFpLzVFTnlQUmg2V2JVdEdpNFhVQ05rd0FWMUZBUy9aTURBWlRnY2pV?=
 =?utf-8?B?NmZMVjVPTXRzNnZrZmllczBoYXRibUlXUHJ5a1FmWHVRN0VIb1hrYTh4N0NR?=
 =?utf-8?B?WkRHTEZwSFpTUzNvUXIxWDU3enVFVzY4dHlsZUlPWUhYdEVqRW5pRWxtNUFS?=
 =?utf-8?B?YWNWMlNqN295Nnd3YTZpWlZrRFRMY0V2RlB5eWtGMDIxS0dZV1YyZmRjdmRF?=
 =?utf-8?B?Rkx3UlhFWjljZk9JcnRtblhIb3BxbStTNzhoWUFsZXR3bVVHQ3pHTU5VVzgz?=
 =?utf-8?B?Ky9FUWpWYmZKdkRuYnRFaDRxWUxHdUVhcGxZQVI3UUVMUVBKZm1iM294S0J4?=
 =?utf-8?B?M1kvalZxVTlvcVZUWmpUOGpqeHdjYTdzdEdzN2MvMnVFTVhiU2xQeHZNVEhq?=
 =?utf-8?B?VkE4anpQQkRWbmpieGVNdTVTRTR4UHBibTBITnhGODhQWmNPdERuVjFudlRO?=
 =?utf-8?B?Y0N6emwxdis3S0xRWHg5aDBid2FGOUR5RmZmWDMycU5zQ3JDY3lTRGJkZVdE?=
 =?utf-8?B?cHZhc0NIOUNzdWltQ25XeHRZaTdjK3BmRHdlbVJxQzF5d29xZGZvWTJFakY5?=
 =?utf-8?B?cWk3RnVxcXAvcjB4K0thb1VYWE80WDM0bU5YSmdyNG9UdnJVSkdVYUVRNUN4?=
 =?utf-8?B?WXBxbUsxM2s3TFBaeFVyTW5KVUhwVXl5VFJWL2xCR2FLK2pMY3EwUkQ0ZTVL?=
 =?utf-8?B?Wk05YThsUTJnc3hXVUEyWUd6SnZnYWhpQ1VETkwzVkYxRzRMM0RySzRpajRw?=
 =?utf-8?B?QjVtODV5M2RWN0FjM1Q2YUR3SEYvdEpxWktnaG5sK2xGYU1odHo0UW9FM0kr?=
 =?utf-8?B?RU5zSDhPd2FaL0c3aUFkblR0bjQ3ZTMveVlYZEF1OFk0UlZVaU9VRlNQS3l1?=
 =?utf-8?B?Z29wVDhvdXcwYU9ScGROMXFxa0E1aGNLOUx2d3h2UVZhMURKaDRmV1pzbVR1?=
 =?utf-8?B?ZGdtbDZyUS91MEUyRFIzWDFMTXdxcFlvK2RhaFFySFRXRW91NFVoVEk0azcw?=
 =?utf-8?B?eG1mc0FYYTBlZTVNWW9TcHVybW5XQ2tKWjhhMlNGT1VWY0hRWnlxbGJJcEY2?=
 =?utf-8?B?dEQyTlR0L2hSSHh6WlVPNDBmMnVPODRBWmFGSE14WGUyTkRzUlU2eW1wa2xG?=
 =?utf-8?B?SmFTTnlZcG0zeitsNURpTllodW5ZTEVEcWthNk11NEFIalhnM3JvdytJTDVS?=
 =?utf-8?B?MkxSdzRGMHpIWmZhaGl1dDNqejdoZDd0ODIrQklPMnNJNkNJd1E0b1ZPdU9Y?=
 =?utf-8?B?aExIMy9WcWx0eW01M2dGUCt2OWpubnlIbWpPNDFFWWQwZmhyd1J3UlVsSW9n?=
 =?utf-8?B?aDVhSTh0NkZBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWlNL3BsenlCSUN1ZDQ2YUZHamt3TTV1Z2lpOVNpK3MrcVJmRzhkU01oaXMx?=
 =?utf-8?B?RUJPYUV1UjBzQjloVHk1UzhhcDRMU25SVUh4QVdQN2hNTXFNYitTQ2V5OWYy?=
 =?utf-8?B?dEZMbjNHVmNQN3BQQ1JzNmNqUjZibmZ5K2JBcmhPTmp4VVFseU52NVlCL1V4?=
 =?utf-8?B?NEJSQ3FQcHBGZEhjZUVhR0FGUEtwODY3YVJydEQvcFlPWEExZFZQTk90NmNF?=
 =?utf-8?B?OTh1eUpVTzV0UmxyalVRVERIaDF0V2dvOS9CckNtUlo4eGw4cmlKK0ZHUkJu?=
 =?utf-8?B?cW80ajVoVVBKbDVtK1FHVjdaU0FXVFVUcExLYkp4ZnRyQmhrODRCTGEwc3hu?=
 =?utf-8?B?VUY4UmJQNzViWHNKVm1JOE56WTR2aTgrQVZvdWRSV0FLYnJtejdtdktLUlRy?=
 =?utf-8?B?WEZMdGlzMzI4cnBVeXgxano4c25BUUVocXJrTkJydFZ1WVZMZlk1WElvQXNF?=
 =?utf-8?B?b3ZLMmh5MWFNbVZZNFMxRFh3TWNPcXUwT3djRmtzTUU5c09uNlBrNHhYMUtZ?=
 =?utf-8?B?VENVc3daWGVQZG01Q3VES3lneS9oU3MzRzhzVFZsekkxdGFmaEdMZVRsaTFJ?=
 =?utf-8?B?NG50QnpXTEdqQnhpQXlEbkxwM0FieTQzTnR2T01XTDYzZHVXeFRFRmJtZ1k5?=
 =?utf-8?B?RkZiMHI1SGYrQWxOMlV6STVqMUhEOHJuMC9XeHVDZmxyckpYV041Y2R4R1gv?=
 =?utf-8?B?dVMyalp6K1pTQi9CTnhGMHRvWDVQZ2FrcEJMVDhJK3JqSkJGYm9Ba0pMSzJJ?=
 =?utf-8?B?L1lFeUlHRXowK0tYMUd5a1J5Rjc0ZDNocE1lWmRPQmZ4M2Z6Vnloc256ajJy?=
 =?utf-8?B?RFhtWVE5VWk5L2tmWGxLNUY1cjVHNWJqM2I2SHdzWVNQSkNQd1JNZlNiZzJi?=
 =?utf-8?B?VnF5TFFweVFIRGNJSnk3dFFneDFmc0Jpcm9CSEpnTnNDWnV4TG5ZOU5GMmNK?=
 =?utf-8?B?T3RSd0pUOUpzNm1manR3T0pwZkxLVThTYzk0Z1FFR2RSemtwUVBSbndyMHky?=
 =?utf-8?B?U2ZxMzVZd2luWE1JYmRyS05OZ1NkSE51dk56b0NFYU9QM01CUWc1TFc2K3NB?=
 =?utf-8?B?aTdSUTJ6Z1daK08xS3JNQkM3cm9zc05PVUh3OElsOXhkeFNGZWZpZDhRdkRN?=
 =?utf-8?B?KzJRMVhnSUM2L29Bclcvc09mdDcyQkE0cXZUajdjdlNML2lleGpJM3pUSk0z?=
 =?utf-8?B?QzFXSkdtUWgzeExOVjdpd3c0RHhMUWNWd2pPM0JoeFFybDBqZklqeHdpcDFV?=
 =?utf-8?B?TDE1OFhybHpEamh6Y1lnQ1VoY25uYUdOU2srQ0orZzNOVFh4R0x2aW1aQ2Nx?=
 =?utf-8?B?S3k5eFllZjJMbjQ3T0hsS1g4Y0t0ZjBpNUx0QXNxeS9vUXh3Nmh5ZVNKdU5U?=
 =?utf-8?B?UnJ0ZEFHaUU4MXRZWENDemcvZnlnZEFRaDVLY1JlM3lkdzd1VUJ6dTNiRFFD?=
 =?utf-8?B?SXlYMU5rNzNVek1PVjNqbUg3a3NUc3R1UVl2VU9rcTJiT2x0c1MzZW9RMVNE?=
 =?utf-8?B?WHNmYTBSNENVQW8xdXVFaGkwR3pWZW9PUXROWDU1OGZuMW5zeU5CU0JTanFW?=
 =?utf-8?B?OGw5Zm42dENuYm5QRk1YSEhjaFY0MGcyRmlTUlNIakF0ZjZpRSt3SEF1b3pE?=
 =?utf-8?B?dVpwVitxZS9WWW10eWRrNEREVFBLZ0xxZGdCeXptSHByRThOcHdoL00yNVdy?=
 =?utf-8?B?UDQ2Q21ieGlDN215VkV5M1RTd1FCYkxqWCtaZHBZOTNuV1Vybll1L3BjUTlP?=
 =?utf-8?B?ZUlqbkVqZHQwMWxaWUs3UjhoSGtoUDlTcDNRTkxyTDU1R1JTU0lNUGljOHRH?=
 =?utf-8?B?Sm5RdnZaWkYwbzhsRVp5bk9zSzR4VHkwbnFHNkt0aGNIRG5weHRWUEZHVEp1?=
 =?utf-8?B?MmdpWE80NyttR3c2WFltQk1YWnRubjNUZHJLL0pQdWdoejV1L1BOQVdnaDlC?=
 =?utf-8?B?R0k2c0srcm1BL0MrVy9zUGRZREgwY01nMXJETzh6NFk4T1NFVzc5Umt3SUd4?=
 =?utf-8?B?d2Z4ZnVhMStXVkMvUUVzdnNDMDMxcWViS3VwRW0rUVA3VThua05vMzZpTi85?=
 =?utf-8?B?SHVZcE92UUtOZEJ2QjNWR0tlK0pHM3FOQ1FWS3FURlkzUUtob0E3Z1Z4L2NC?=
 =?utf-8?Q?dIV27rah6EjKBRhSLHwU981hw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7462693-9f4b-41ad-b436-08dda99d765a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 10:39:51.6699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eoyKY0eci7EFajpEtlskMpOiPIad/dbPjcsmEOxRvkZo0PyF3d7EdNSnhhdyBCkBqJ1xkePBS8e2jP/vZD95wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
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

T24gVGh1cnMsIEp1bmUgMTIsIDIwMjUgNToxNiBQTSBLYW1pbCBLb25pZWN6bnkgd3JvdGU6DQo+
IEhpIFNodWljaGVuZywNCj4gT24gMjAyNS0wNi0xMiBhdCAwODoxNDozMCArMDAwMCwgU2h1aWNo
ZW5nIExpbiB3cm90ZToNCj4gPiBUaGUgYmF0Y2ggYnVmZmVyIHBvaW50ZXIgaXMgZGF0YVtFWEVD
X0RBVEFdIG5vdCBkYXRhLiBDb3JyZWN0IGl0IGluIHRoZQ0KPiBhc3NlcnRpb24uDQo+ID4gRml4
IDIgb3RoZXIgaXNzdWVzIHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2gucGw6DQo+ID4gIg0KPiA+IFdB
Uk5JTkc6IHBsZWFzZSwgbm8gc3BhY2UgYmVmb3JlIHRhYnMNCj4gPiBGSUxFOiB0ZXN0cy9pbnRl
bC94ZV9leGVjX2NvbXB1dGVfbW9kZS5jOjI3Og0KPiA+DQo+ID4gRVJST1I6IGNvZGUgaW5kZW50
IHNob3VsZCB1c2UgdGFicyB3aGVyZSBwb3NzaWJsZQ0KPiA+IEZJTEU6IHRlc3RzL2ludGVsL3hl
X2V4ZWNfY29tcHV0ZV9tb2RlLmM6Mjc1Og0KPiA+ICINCj4gDQo+IFBsZWFzZSBkbyBub3QgYWRk
IGNoZWNrcGF0Y2ggbWVzc2FnZXMgdG8gY29tbWl0LCByYXRoZXIganVzdCB3cml0ZSBmb3IgZXhh
bXBsZToNCj4gRml4IHdoaXRlc3BhY2VzLg0KDQpHZXQgaXQuIFRoYW5rcy4NCg0KU2h1aWNoZW5n
DQo+IA0KPiA+DQo+ID4gdjI6IGZpeCBpc3N1ZXMgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbA0K
PiA+IHYzOiBhZGQgYmFjayB0aGUgbWlzc2VkIGNoZWNrcGF0Y2ggbWVzc2FnZQ0KPiA+DQo+ID4g
Q2M6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBTaHVpY2hlbmcgTGluIDxzaHVpY2hlbmcubGluQGludGVsLmNvbT4N
Cj4gPiAtLS0NCj4gPiAgdGVzdHMvaW50ZWwveGVfZXhlY19jb21wdXRlX21vZGUuYyB8IDYgKysr
LS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZXhlY19jb21wdXRlX21vZGUu
Yw0KPiA+IGIvdGVzdHMvaW50ZWwveGVfZXhlY19jb21wdXRlX21vZGUuYw0KPiA+IGluZGV4IDhm
YmE5ZGFlZi4uYTdlYTU2MzI3IDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNf
Y29tcHV0ZV9tb2RlLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC94ZV9leGVjX2NvbXB1dGVfbW9k
ZS5jDQo+ID4gQEAgLTI0LDcgKzI0LDcgQEANCj4gPiAgI2luY2x1ZGUgInhlL3hlX3NwaW4uaCIN
Cj4gPiAgI2luY2x1ZGUgPHN0cmluZy5oPg0KPiA+DQo+ID4gLSNkZWZpbmUgTUFYX05fRVhFQ1FV
RVVFUyAJMTYNCj4gPiArI2RlZmluZSBNQVhfTl9FWEVDUVVFVUVTCQkxNg0KPiA+ICAjZGVmaW5l
IFVTRVJQVFIJCQkJKDB4MSA8PCAwKQ0KPiA+ICAjZGVmaW5lIFJFQklORAkJCQkoMHgxIDw8IDEp
DQo+ID4gICNkZWZpbmUgSU5WQUxJREFURQkJCSgweDEgPDwgMikNCj4gPiBAQCAtMjcyLDcgKzI3
Miw3IEBAIHRlc3RfZXhlYyhpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3Rh
bmNlDQo+ICplY2ksDQo+ID4gIAkJCQltYXBfZmQgPSBvcGVuKCIvdG1wIiwgT19UTVBGSUxFIHwg
T19SRFdSLA0KPiA+ICAJCQkJCSAgICAgIDB4NjY2KTsNCj4gPiAgCQkJCWlndF9hc3NlcnRfZXEo
d3JpdGUobWFwX2ZkLCBkYXRhLCBib19zaXplKSwNCj4gPiAtCQkJCSAgICAgICAgICAgICAgYm9f
c2l6ZSk7DQo+ID4gKwkJCQkJICAgICAgYm9fc2l6ZSk7DQo+IA0KPiBCb3RoIHRob3NlIHdoaXRl
c3BhY2UgZml4ZXMgYXJlIGZhciBmcm9tIGEgaHVuayB3aXRoIGZpeCwgaW1obyB0aGlzIHNob3Vs
ZCBiZSBpbg0KPiBhbm90aGVyIHBhdGNoLCBub3QgbWl4ZWQgaGVyZS4NCj4gDQo+ID4gIAkJCQlk
YXRhID0gbW1hcCgodm9pZCAqKU1BUF9BRERSRVNTLCBib19zaXplLA0KPiA+ICAJCQkJCSAgICBQ
Uk9UX1JFQUQgfCBQUk9UX1dSSVRFLA0KPiBNQVBfU0hBUkVEIHwNCj4gPiAgCQkJCQkgICAgTUFQ
X0ZJWEVELCBtYXBfZmQsIDApOw0KPiA+IEBAIC0zOTMsNyArMzkzLDcgQEAgc3RhdGljIHZvaWQg
bm9uX2Jsb2NrKGludCBmZCwgaW50IGV4cGVjdCkNCj4gPiAgCWRhdGFbRVhFQ19EQVRBXS5iYXRj
aFtiKytdID0gc2RpX2FkZHIgPj4gMzI7DQo+ID4gIAlkYXRhW0VYRUNfREFUQV0uYmF0Y2hbYisr
XSA9IHZhbHVlOw0KPiA+ICAJZGF0YVtFWEVDX0RBVEFdLmJhdGNoW2IrK10gPSBNSV9CQVRDSF9C
VUZGRVJfRU5EOw0KPiA+IC0JaWd0X2Fzc2VydChiIDw9IEFSUkFZX1NJWkUoZGF0YS0+YmF0Y2gp
KTsNCj4gPiArCWlndF9hc3NlcnQoYiA8PSBBUlJBWV9TSVpFKGRhdGFbRVhFQ19EQVRBXS5iYXRj
aCkpOw0KPiANCj4gSSB3aWxsIHRha2UgdjEgZm9yIGEgbWVyZ2UgYWZ0ZXIgYWxsIHRlc3RzIHdp
bGwgcnVuIGFuZCBhZnRlciB5b3Ugd2lsbCByZXBseSB0byBmYWlsdXJlcw0KPiBmcm9tIENJIChp
ZiBhbnkpLg0KDQpTdXJlLiBQbGVhc2UgZ28gYWhlYWQgd2l0aCB2MS4gVGhhbmtzIGZvciB0aGUg
Z3VpZGUuDQoNClNodWljaGVuZw0KPiANCj4gUGxlYXNlIHJlc3BvbmQgdG8gdGVzdHMgcmVzdWx0
cyB3aXRoIGNjIHRvIENJIChlLW1haWwgaXMgZ2l2ZW4gaW4gZmFpbHVyZSByZXBvcnQpLiBBbHNv
DQo+IGN1dCByZXBseSBhZnRlciAnS25vd24gaXNzdWVzJyBhcyBpdCBzaG91bGQgYmUgc21hbGwg
KHVuZGVyIGZldyBraWxvYnl0ZXMpLg0KDQpTdXJlLiBMZXQgbWUgbW9uaXRvciB0aGUgdGVzdCBy
ZXN1bHRzIGFuZCByZXBseSB0byBpdCB3aXRoIHlvdXIgc2hhcmVkIGV4YW1wbGVzLg0KQXMgSSBo
YXZlIG5vdCBkb25lIGl0IGJlZm9yZSwgaWYgdGhlcmUgaXMgYW55dGhpbmcgd3JvbmcsIHBsZWFz
ZSBsZXQgbWUga25vdy4NClRoYW5rcy4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+IFJlZ2FyZHMsDQo+
IEthbWlsDQo+IA0KPiA+DQo+ID4gIAlzeW5jWzBdLmFkZHIgPSBhZGRyICsgKGNoYXIgKikmZGF0
YVtFWEVDX0RBVEFdLmV4ZWNfc3luYyAtIChjaGFyDQo+ICopZGF0YTsNCj4gPiAgCWV4ZWMubnVt
X3N5bmNzID0gMDsNCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo=
