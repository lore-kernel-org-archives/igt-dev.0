Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B676FC52D6F
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 16:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA1C10E658;
	Wed, 21 Aug 2024 16:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ky3FSPTc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED47610E662
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 16:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724258789; x=1755794789;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=aPYW9fzY9B432oYYn9P0oLbOEAIt88VamRWI5dHSVyE=;
 b=Ky3FSPTcbuTX1lI/1K5zN/+IY5NukXkPhuIikqy+7py84Pj+W0krSyOR
 Z2+08cgQSET/Rj+yy5NlP1Ku4RQXFvpS97dysyWp0BWW10iqYsLgsFSWw
 0GeMWMbfIneTKmwBKmh1D4wxDVSPn7ErSUHf1N2dDNt93giVLovmL77p2
 lrgEtxbPYbgVrJIj3q2DHDoyBp+qP6dZprtkrdBmSUBys6ZKKepZJUJyT
 zWyWyo8lSmNCbDbnEgjqR1A6VlXTmd37+rBvy5fRIshSOXux6qury3cqw
 D0jReEYtaHfgqGqIwgnWBYfoSGHadCyVwQfYUc7OYC9xTwTzINZLRaW5D g==;
X-CSE-ConnectionGUID: y1z6akYURBeEQpDyV77aAg==
X-CSE-MsgGUID: NdDEvxfvQmaerTAuzJOxZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22797891"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="22797891"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 09:46:29 -0700
X-CSE-ConnectionGUID: Rbv1wc/mRTiK3MnhJNEbzA==
X-CSE-MsgGUID: d4ItMp1YRuqKn0nKqrN/qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60806246"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 09:46:28 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:46:28 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 09:46:28 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 09:46:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 09:46:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cta0SjCcE2nG3rdN9iKbmttedZA6Ufbq5A+aMnN4ZQrScHjeUkYh6G0owL3ZG5OjHMyk/36r3rygJRxJOAyts/1EgibS+Xiy9kMMxavsFUdz9YGitFjUAo4HuTlJ3ploIfKSO6VmnHplZ0/oWYm/usqhaR5zv+P/0HXRwY8Qnh5kabsPpkVtnUlNMIqGHkwA28RtVrtWWTLAYzqtIWjZZk4L096FXiqR9aptOWHAyNOeU7pPBIMmJy7SqDTtDgnwJ441dqm801/03UitKktqGUBx07IYYgfB2OWqKhYHzYdKB3VLEHJ6fdbRXUddcdV3M6e+lZCVPcptE1CQB4ErMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXPvGe28mRTIgM91NdvKriDztbz2vhYxo5FW9f+6+xQ=;
 b=vzc4lcnrWEXZi6zTQlLj5OP0sIpHrVP74obRu5sNxaJIfLJZ1NEpcSAbzUc6Tlc/qM3lIeKY47dcQxJRlDOS9d0M7BvwCQxh4KL25TyNwpBtceC/w0dJcrOkRe3mLeQ025L6VFWdXLSPiSpm3FVzAqpl9p0jwA58vDHhOjC1K9yt6m7B/a0OID81ZExcZ2Z1ywGNHFTEbeNVgvV6QDP0lblbb4TOZh02XOtu88pxTK61plsP/y6RTytc0eaM9FDNQETxJWRin8re/4r23e844CNTQuHZ3NTtSF1OTAxtpUDkgiHl6aU9Q8ZzZgraN/iSu6M4sxFKduKo4LL4Rdk8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CH3PR11MB8316.namprd11.prod.outlook.com (2603:10b6:610:17b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Wed, 21 Aug
 2024 16:46:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 16:46:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820232928.458248-2-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-2-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 1/6] tools/intel-gfx-fw-info: Re-format with black
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Aug 2024 13:46:21 -0300
Message-ID: <172425878139.2071.515569104521677632@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0075.namprd03.prod.outlook.com
 (2603:10b6:303:b6::20) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CH3PR11MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0e3fd7-738c-43ea-5f0c-08dcc200cbb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWtaUHZPUnVZSzJFN2pwRGJXdnMrenB4NGpVV3lqV3V5SFpaNGIwdzA0Qjlq?=
 =?utf-8?B?ODVROXluMnNUbW8rMnZJZTAweWJhdGQ5cmRWNjU2TUJKNDQ3anhvRkJ2VXI2?=
 =?utf-8?B?RjErMmZWd09Fb3JJcjFvblRPVGxsaGZ5REFheDBJakVkdlF6WmFPOTlBdk52?=
 =?utf-8?B?bURPMFdXRWdORXpTMlkrNk1tcklzWEtkdldiR2NoWlJVaExRd29oQzdyemFw?=
 =?utf-8?B?WmdjZjA2ZXZ5eVhJMC9qeS81eE9vWitmcUVKYUJBa0g5L3FQWTNFaDc2V3VN?=
 =?utf-8?B?NEkrNGM2NVhoU29nWGs3bnRaemxhdjYyYWNKK0ErOFl2Tkd0TWdaTHNsY2Fx?=
 =?utf-8?B?ZkJpblFtNnJnbnhJZnVrdHB6TklNNU9xYVd0R0tPKzZFVjRFZ3FYWHBLZXNI?=
 =?utf-8?B?T1M5WVVUSU9DZVViNWRmU0psMzNEYkxHNDBOSmVMVm83bWYrWU5EL1RuTkcx?=
 =?utf-8?B?VVYwLy9qdHBacGM5eXgrTkdTWGViYmgyOEw4b1JJemhkbUg0dE5ZM3FwcEtY?=
 =?utf-8?B?TUZEekRIK1QxTXpuQ0R5YkRuVithWERGcVN3Vlkwdlh5anlYYkNzUHFDeGFL?=
 =?utf-8?B?UktvckdzSjVuVmJGVXpEcmZsVk1PdytpOWJuWE43aW5TYkcwQlFwSXVRa1NN?=
 =?utf-8?B?MDBqNXlxSGZ2UnZZb3prWmI2b3UwZ0NjMlRnYWxNUmh6YWlJY01kWkFKNWdE?=
 =?utf-8?B?SzRZMm1vcjF5c0lncmoxWjlyblc3K0ZUemdNYy91aG5tUk1mUnMwVU5ZY3kw?=
 =?utf-8?B?MDJtbzJDeDVENWN6NkJ0Um9jL3N3V0MwUWxRWXpQNGp5MmRseS9tdDdCQlBD?=
 =?utf-8?B?Ry8xN1dvaWNEcC9qQjI3RUJySjJBUXpFVCszUlpzT3ZiVnduOGVxOHZLZUlT?=
 =?utf-8?B?dlI0TTZWbVRsMjh5ck9OU0g4c0dTTXBNTzdLRnR6MzI4cDk2b2pZMERVVGNZ?=
 =?utf-8?B?VlBsTjhHVWhXUE5sdjJRWCtnVElEK3UyalZGQVhCRlBwVlhQQjQxSiswZ1k4?=
 =?utf-8?B?d1RNbEFuclhidExBdG1FY3BzTFVZZWRTb0NWVGV2aEVSeGwxQ0lGd0szMkly?=
 =?utf-8?B?REZDMEN1OW1FZTZ2bUI4WG9kaUxHUk4rTGE4ZlZVQmwrZlUvS1BJWGhJVitx?=
 =?utf-8?B?RGt6amFzc1QzZXBuaTR0dDZKc3VBYjhvRmhCdEZNVEpKR1ZGN1FrU0ROMjBH?=
 =?utf-8?B?d0RjZGlvZkkyNWJZZFZUd0lGeW5oaW53NGdFS2FCejZIVDhvMDZndU9OK1BT?=
 =?utf-8?B?S3R1NU15SDduQjhkT2JCTWpqVHhBNGQrVUJKK0FjVGpFU1VqQWUwY2k0TVov?=
 =?utf-8?B?NjFxNGlmTXFURzFtWTZGa2NOUWhzRHZFZCt4N293TGZ6VURzeitqNGQzUkhJ?=
 =?utf-8?B?Zld6WVhWNkJYYjNtOUhlR2JaQkVpamxhOXNhTkVHUEVpY1FDYkZhVk1sR2hx?=
 =?utf-8?B?ZXc5UjdKbjRlUlMyWTZpUnlhcTNXeFFxU2NnWDJpaUg1WmxFUC9XRnN1ZXJn?=
 =?utf-8?B?djNadERrdnRBNHpnWi9UQ3ZCemJacDk3dUFlMi81WmVEb0xWd0RzbTFqVzB1?=
 =?utf-8?B?MmtHL3psT0xJZzFXcW1oRExTWXVsTTdUNzhrd2pOTVlTRnJLQVd3RklCZ0pE?=
 =?utf-8?B?QmlUeGtHVlFDQkVWZk1hemRhTlliMk90ZFZiZnllMXo4dVl1RUIrRnJrcGFR?=
 =?utf-8?B?TFFmdC8yTU10Sk0yRGpSWnJQUElRNzN2UW9MS2lBbnJjWTZtcXphcDcvTGcz?=
 =?utf-8?B?R1hsMzhadmZaWmt5V2RpUWJDdkcrdVJmQXZpL2JQZkMxQXY2K2x3QklmUm5t?=
 =?utf-8?B?dlBwNmY0b3BEdDg4QnRmUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTc4cEJSU05UbHJIaUdNQVYrVjdDNHRRZUZ5YmZWSlIwSjcyYnlDbkpOK1di?=
 =?utf-8?B?SHBqdi92cmQ4YU1OWHN5OVhyWFlKc0Z6MVdMeTNJZE4ybjhvZWlvbVI5YlYr?=
 =?utf-8?B?eXRuWnI3dDZPcU11L2tGaWpOSXBaOVNGN244UTZNbGducTVCU09yVjRUbk1q?=
 =?utf-8?B?TExVU3laVnJudEZlMkV0MVpDSW9xcnVPWUV2eFVWcVVGSzNIWWthNXNrZ1Zn?=
 =?utf-8?B?c2Q0eS9DOG1iK1daOWNYRGJlU2xzY0NrcXRqZ2crY0Q0SDRRVURCdjJGYjQ4?=
 =?utf-8?B?MGoxeENhN2l1SHVEejNHUHNtSmpFczRRY2hDcXdpNGxxZ3d1b1d0NFdrMUdY?=
 =?utf-8?B?c0h2ajAwS2VvWkQyM0dOYk1CZmJFQUc3RjZPb3FVN1RHMXozMEc4Umx3VGNN?=
 =?utf-8?B?NUZpQ0hrRk4rcWgvY1Q4VDY1Ykl0UnR4RVpPZExjL0xPYUJWOENBTXpwdmdF?=
 =?utf-8?B?TzZScVJwT1FNNGNoaGNkU1ZPeEJkRjBSbEFtUk1Jc0tiVDJlNkRNY3VQc3R5?=
 =?utf-8?B?ZHdtSitRb1BPRmRDQlBoZ2xncktnUCtnWWtpN2NUKzVlWk1va2M5eDN2RFQ1?=
 =?utf-8?B?NCt5TDJ4bWZCbTdqa0tURHZkRjBlM3hPYW5zRHBXNUtYQngvNFRQRTdBOXh4?=
 =?utf-8?B?elE2ZDJQUS9Jd0txakxOTCtaSG10aVBmY1Jyb3dkSi85WVBGUUViQkJkMUxK?=
 =?utf-8?B?K1JhOE1MQ2VPV1Qxd2RNRXVTTjFJenM3eDZSdFFlODRrS1FmRytXaTdqRWV0?=
 =?utf-8?B?NXk2NE1majdPbGl1L1VwYlErbWlmUmR2dG9TZ3NybGpyVWR0NkxpSlM1WDFu?=
 =?utf-8?B?VnhKY1R5QTl1eGh2OFJqcUtzVUJSbDA3TWpkRTlDQ1AxWjVia21TdThSOHB2?=
 =?utf-8?B?WXNvajNPamYvbmF3bnp2Y0VYV1M0MXNIMUhVRmU5eDFWVEYva21rWjFGNmZy?=
 =?utf-8?B?TUpoMlNRUG1UMzRUc2I0ZDlIKzlmcFEzeHYzNXFCcXpWWWM3blRyM0k3R2E2?=
 =?utf-8?B?bmtTWGdxeXg2aDZITFRpeWRvVi9oTzAzUG1BVFZSNlZKRFlpSnpralVYT2dY?=
 =?utf-8?B?VnZ3S3U5WVhrTlJBQUdqREppKzViRGpPaVV5VktYWWpVNG5XZkVaY2VDT3dl?=
 =?utf-8?B?NE4wYWpWeGxqeHEwMmFPQ3loa05vKzlPUFR6a1RWVUYzelBjY0JPWEZZY2kr?=
 =?utf-8?B?NlFVTEtmMVAzRGxMcEhYdExVYThjZC81bkJjU1EvYkJDV25WbHdsNTBrTld0?=
 =?utf-8?B?Z3VhSm9KejZjeVVFZXFmRW1tNUtoeDdLZmRNUkpGTnI2aXQyQWMvbmFLODlp?=
 =?utf-8?B?a0p5bktBQmFJbWplWWRxUmEvUFhmV3hPd0UwdzNUVEdLSEpmRVNGVUJmR1hm?=
 =?utf-8?B?aTFCRFJKMEE3WlRyQkp4NldCdVVBT1loMHJyVFRqZWJpdjNTTHFKY1R3RzJB?=
 =?utf-8?B?S3I5Nm9EdFVrZmpHU3RxcndJcnNWWjNYSXZRN3d2ZUQzOWlrZ09pT1p6YW5H?=
 =?utf-8?B?VnNTREdNUkZGck5lQmdxQ0U5WTNHOVRZS3FZRlMwTWwvTzdVNndGMFN3cEsv?=
 =?utf-8?B?eldJYmMwODVrMXU1SlEybWU3cGVGcklZMHc3U0hvaVRTQ0RiR0JLZkc4YVRw?=
 =?utf-8?B?eE4xWCtPcGk5MGF3VkZZQk1qdU0xdkNlem9jOHVmcnNuSVovVWxKcDY0b3Rv?=
 =?utf-8?B?VnFXS1F3NWtNUGNpMC9xcituOStFRmFpdEdHc2lYQThBbXQzT0FJc0Nna0M2?=
 =?utf-8?B?cG5FSEE4NTF1TS9BV3JEWk5JWklEbnFNQVlGSWxvVFd0OG1XcG82TndvV2dt?=
 =?utf-8?B?LzFnT0cxTS9UWmZUU2J5Y3FKR3JMYlhTbGp6a21KMnI3dm5JWHNiMGNJeG05?=
 =?utf-8?B?RU1KY1p1eEd5L1BhNHVWZHJCdDZFMk1VNkRXTWxCTDIzOW90cE1IaWFoT0px?=
 =?utf-8?B?MllDZE9rU2xUREtCTjY1Z0ZuSlFFT213bFMrbnNhMUJta0gzRTNXY29DOVBH?=
 =?utf-8?B?ZTVpQ0RJbGlXR1pDZFlkZFVRbWhCTzFyREFzL1hyZ01mcSsyQno4OG9PbXVP?=
 =?utf-8?B?N0ppWGJlaWhVRFBHVXVHRnY4Vk9HbFJDdGd6SDNvT3dOakNiYU9Cb0wwZE55?=
 =?utf-8?B?NHJoSkNwbkFaaDRsZmdCdWxVc29Gd2Y1RGdBcE1zNEoxam5aenZtazhUSEc3?=
 =?utf-8?B?UEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0e3fd7-738c-43ea-5f0c-08dcc200cbb0
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 16:46:25.4033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgrZFSnFT9IWQ80aHwg47VQMYZBrIbMtJ7CgD9nCRdJ5oc3mH9Ox9hXZkEGtYU4SA8olNQEFkXgb1OyoKzbygQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8316
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

Quoting Lucas De Marchi (2024-08-20 20:29:23-03:00)
>black tools/intel-gfx-fw-info
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tools/intel-gfx-fw-info | 10 ++++++----
> 1 file changed, 6 insertions(+), 4 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index b0d41bbae..35555aab5 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -150,10 +150,12 @@ def parse_args(argv: typing.List[str]) -> argparse.N=
amespace:
>     description =3D "Dump GuC/HuC firmware information"
>     parser =3D argparse.ArgumentParser(prog=3D"intel-gfx-fw-info", descri=
ption=3Ddescription)
>=20
>-    parser.add_argument("-x", "--raw", action=3D"store_true",
>-                        help=3D"Also print raw header content")
>-    parser.add_argument("-c", "--checksum", action=3D"store_true",
>-                        help=3D"Also print checksum")
>+    parser.add_argument(
>+        "-x", "--raw", action=3D"store_true", help=3D"Also print raw head=
er content"
>+    )
>+    parser.add_argument(
>+        "-c", "--checksum", action=3D"store_true", help=3D"Also print che=
cksum"
>+    )
>=20
>     parser.add_argument("filename", help=3D"GuC/HuC firmware file")
>=20
>--=20
>2.43.0
>
