Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52958C282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 09:17:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BD510E920;
	Thu,  6 Mar 2025 09:17:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SKoE0C9E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39E9110E920
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741252634; x=1772788634;
 h=content-transfer-encoding:date:message-id:from:to:cc:
 subject:references:in-reply-to:mime-version;
 bh=gw8bFdNhrzhKsCn7jf2ZH/MjMDbWqeTe1WaeEFU1oyg=;
 b=SKoE0C9Ezpxi22rs1iY9sCdhymLWf9CbTayeIsID452TVYMuaJLA3YUd
 FEh1TEqoHDW4vrchOR3D+/qVNEbfUtIq4+84Ri6qtHbBidPSD+A3dFDYA
 XKEG2lVG6eiN9q9O0qzS4YoeL6qSnrg2DqHwM1ZQ0thMToLq0LgR+m7vX
 Qm3ObPXsVC6KyagurjTepjMVFYfoOKiuHZiGkhZDGDjgfJuSirebkfWE9
 cz0SbHEUH2xlfUpXKbi1jwVZ9fMseh0R1KtvPLk+FvRbmoqQOCMw5TDu0
 6QP+XMlnIt13iwHPjlseQ6T0W54Y1CWEpROYqn4heqkpgJLaYaYsKjKUf g==;
X-CSE-ConnectionGUID: ZMA+4GSuRwulH6odifwXJg==
X-CSE-MsgGUID: 4+T+scy0SSqDgCZIxmOliQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42491659"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="42491659"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 01:17:10 -0800
X-CSE-ConnectionGUID: zS8o9wq9SCS7wu5pW7AH6g==
X-CSE-MsgGUID: 1Y/D+rdRRB2gdk3E9JYjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; d="scan'208";a="119467709"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 01:17:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 01:17:04 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 01:17:04 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 01:17:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nj/tTxn+MK5/jWLOfpkY2SjPowJzHNK1HnrViOGUgrJk8s01tzxJg/XN9kSL6XE7DF2w1XZr5Wkl8Rlio1ZSmx+Ox64yTqZfNcLfSreX3gMSnz2/0FoxRLL83Rbvia4Dr3w1SWKs0Rkp8qZe3wfZnKi2cruv3JebMiONfCQ9JO6wgrCseHbB08LMuc+8KqoxmRLgIFvdGtmRo8YN/SuD1r3FFvyAusghdPtZI5yV9Nl0VIHSBEyGNChtxpOOUoR+xzKUJbYj27aqmJPfpg8WqMbLaF5ovgkssaWM/Pfh+fc5lBvWBz7sN4tTMgkBmC3nw2J9fXkXzjbBMCe0qIrRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC2pHY35+yxWRoqsNua1/y5oCfpQCW5LamWqdS8s5sw=;
 b=hyXLq4Olb7hiGU8vb7i3uTsOMc2WTt7WVQIDuIMQZ8AHb+/xxL2QYGrFK4fG0L7CRdhWOakVTeHsUF1RWxM6gBc4qY4G2RSI8DYqfEGRoSAySOzmoPPKuzf6CJOmTEVpregOnNzpZ4mJhnNpAIELZOIRZ0KcG7zzSPZnDwyTVFdj8UgXmcrdGfYsD7bUfioWSdsHj4Lof9azQEPlj8WGXN9ocE78naWuBdkCnLK9XmJ6FX2TyfWNDexcIE2T9TaNJrbMyOtF28tOZ03cw5n+KdayKuY12C4eeMnhSu9i7yY9rxjSj5P5Q/oj9PmrunRqBOvi3NzKZnb8VLnNs8I2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Thu, 6 Mar
 2025 09:17:02 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::28da:9438:a3ef:19c0%4]) with mapi id 15.20.8511.015; Thu, 6 Mar 2025
 09:17:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 6 Mar 2025 09:16:57 +0000
Message-ID: <D892JDK00AAD.2NMTT2TJIHFBO@intel.com>
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Ewelina Musial <ewelina.musial@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Ryszard Knop <ryszard.knop@intel.com>, "Krzysztof
 Karas" <krzysztof.karas@intel.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t v5] runner: Parse results harder
X-Mailer: aerc 0.18.2-107-g4f7f5d40b602
References: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20250305193137.295162-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: DUZPR01CA0018.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::6) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|IA1PR11MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 861d1f24-e7a8-4e2c-21d0-08dd5c8fa796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c2IvZVZDY3ZoYUE5cTRVblFrU2VVN3RBUzlOVDIrd0ppdUhYSDY1THpWVDJN?=
 =?utf-8?B?Z0RVRHRvRWU2d2tJQjZnY2pqUXFQcFFIU2JBWjl1anNQYTBLUkRwWmVhUTNn?=
 =?utf-8?B?RXNHajVBN1BUV2tuNU44eWZHc0YwUjFzeWl4eUJWOCtmWnBLWnJEYzArWmtH?=
 =?utf-8?B?WmUwcUd5akZKU05XdHRMTGthUFdSL1JTS2prNjFRQlhmaEc0ay8xMUhZSzVq?=
 =?utf-8?B?R3JNWUtjQkJWb25xK1poOHlCcFhZTEtacFZ6WDlxOE9RSGtueXlTMmRFRmRE?=
 =?utf-8?B?Yk15VCt4bWpkVm5XQ1ZJZGN6akNrOEpManVucUZEZG1LMmFwYzVMTmxtaFhq?=
 =?utf-8?B?cnJ2eHFlTVlYb1NEQ3Z0Qnc1UStVYm5kdEdOdVJjZklpL2ovdDBaVmlqMDZr?=
 =?utf-8?B?eHlCUTNuVEV4emQxaE9GTjh6a1JZNDJxbEFNa0lLU2I3R0pFVzkzU05zbWF5?=
 =?utf-8?B?ZzkvOHQwWVRZa0Y3a1dJTSs3Z29PKzRJQyszcDlETnZxM2h2ZGtROVR2VU9K?=
 =?utf-8?B?eDUxQmlYbHZNRTU2T2k0cTBpRWgweWpqUDJYN2FWSUlvSk1nb0RobGpmTkwr?=
 =?utf-8?B?OStxL2RHN2RjRTJ0bkVCc1h2VGJjL05YaEhnbFJPNUV6bjZjNkpHTXU0bTNk?=
 =?utf-8?B?OEY1RXVQRmVFQXgxZy9qQ1dsbXNMUkRIcUFyYS8yaTFJVEY5aUFXZTRoSk0x?=
 =?utf-8?B?UEdFRW15K2VUNTIvYnVqbENzY1phVlRnUlRaV1pscVpVczMreWlWWEFtYzlY?=
 =?utf-8?B?dG16OE5zYWc5aEhOVEE5cGpVYXlZZnUwYjNJTzFPd0pnM2lmNDdBN3pvK0th?=
 =?utf-8?B?VFR5b3JtOHNIR0JEYWRQb1kzQng2OWRGNkppeVdOWUE3OVFXc0V4Wm5qY1Uv?=
 =?utf-8?B?ZmdNQTV6SklEZ2ZTeUFzeVM1d2JsLzA1akZ1ejUzMW9ZN1pzV2p4NU9vYWg4?=
 =?utf-8?B?RUN5UGRhTDFBbHk0OVBCbmwzY21SamdMdEtzVlMvaVg1aVRsbEcwQytGczM5?=
 =?utf-8?B?eXl3c3FhNzloa2pxUXJTRmVmMjd0RXdYU3dDY1dsa1F2Nk9MVUJLNkJHRGJF?=
 =?utf-8?B?a1huTnpMYmxTRXd2M3lGNjhEMXhVM0haN1hxVzlzbDhZRG8yRDNCWVc4a3Vn?=
 =?utf-8?B?QnV3a2VmTUZ2UnZlYTBpc3hSc1dITjZDWXNaajRaNWc3UmRzYWwyWTNTMERZ?=
 =?utf-8?B?ZXRqQTNOb1dMR3I4VjRGUVl0M2Rqa1dmbFFCcXJDQ1BvMkw5K2tKeTlpK0dQ?=
 =?utf-8?B?c2N1OUNWc2E0OU1kWDVadW9rNzlkd0J3a2FIaC9ZdDZIOVpqTmFSMTlwQ1lX?=
 =?utf-8?B?NUVURmY1enhqclppQmNHSnphVm9ZZEJqbEJENDRqbzIzaU1KV3IwNjhSczc3?=
 =?utf-8?B?S2lEeVlOdDBLbmVOTVVBRmNsTitESEhnc3lPa2FqY0padHg0QmgrbzV5d3hp?=
 =?utf-8?B?WHZqRy8vaTc5NXdybmZhMWlFVkI4eVRZcG9sRGhUNWIyUG5EdkJNQndtR1g1?=
 =?utf-8?B?eUNwZWdLM3ZKSU5MV29CM1h2NTRIdHphejcvWGxkaC9GcXBoNzZwSERzWCt2?=
 =?utf-8?B?Qm9GV2FnZmd2QjRuVUtkb2FMbTFteWZQeVVNZm93aWt4ejlwdWVHaUFxME5W?=
 =?utf-8?B?NHlQQ1F0OWFZUzM3Y0IzUEljRjVNbnQ5cko0MzNRbStpbGl0akMzRlM2NkZY?=
 =?utf-8?B?QnJrMFJuREhrWEo4cjVtb3hYV0hMeUlBclpoL1JaOTZpS2VyYjAvbVM4UFp3?=
 =?utf-8?B?dGViaHg2TXY0cmtoYStiZHBYSnZJemVXZkZrRjVkbFBqS0VDcE9vY01vZXQz?=
 =?utf-8?B?eTdpeTBocjFBV2ticzVLSHk2UnRJMmNjT0tPZDNNQmRiM2RFKzJpYmxtSEN3?=
 =?utf-8?Q?S8NNl9hri3/Ap?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUR2RjUvT09TN3hKRFkvNCthaThac1I1c25yR2haSXlqZzlXUzhxbmhWVFNW?=
 =?utf-8?B?bFd2MkdJelVucFdoZkI1Y1B1SThyd1R1YWRBcUNQZGR2cU95NGNndW9TS3Vw?=
 =?utf-8?B?cmxjL0l3Qk9qYVMwNkJJdEhLOVUxeGRiYS9POTlGejJleGI4Z24rUHhSRVFG?=
 =?utf-8?B?MlJMSHM3cTBRSGd2OTRzK0s3YXgzcU1ySTZpQVVVTGNMZnhheTYrS2d3MVdU?=
 =?utf-8?B?dXZWejFmZGlpSGMvSWVrWStJd3ZqQ2VLQnE2d2VqaTZJZGdybU1EdWliNTRw?=
 =?utf-8?B?d0tZSFlNUXl5MU56cFhJQWhhaVdkYlEvajYvRDc1aS9PQmdpZFhnMEQ1MkxZ?=
 =?utf-8?B?ZWI3MDZxSmJmSzRQTFVHTTYyVStoZjViWEx0Q0J1U3QvTXpHRmwycmNBOWZX?=
 =?utf-8?B?VHM2dEk0akt6U09FUDEvZ09hQ2QzRE44dWdrRkRSRlBYY3F4ckw5elZ0RmZO?=
 =?utf-8?B?cnVUK2xKTi81L1N2OUdabklOMkc0eWhpV2lMZ3J5eHhueUZmajlBVStKMmR3?=
 =?utf-8?B?TzVCeGVVMFZ0VUlSemsvMmt2d2oyekVrbzVjcjEwQmlTK1BoQ3FQVXNUNllV?=
 =?utf-8?B?S1pDODh5OEJud3JCR2FtZDUwa2VUTHJNRGRNU2dndlQ4RHJ6OHQ1U1N2TDVG?=
 =?utf-8?B?K0dzdDd1WlhyZTc3NFZmUmpYL2MyUk5OQzFrempOcitGUm94TDVTT2F6NmpK?=
 =?utf-8?B?WFpKUXlvRXNBaVZGOHN1UVRYVWFoNW9GMlJOcXdLaVVoOStCVmMydXFDN0dV?=
 =?utf-8?B?WE1oWXNDbzJpam81cUM4dERDaG00NDFUZ0NtK0J1S1R4R1ZETmJZOStRdlZw?=
 =?utf-8?B?OEplOW9JSEZISEVReWJQWW1pSWVGTEZrczlIVGp4ZXdMZ3NZUHhPcGxCOGM0?=
 =?utf-8?B?MmtoQ1RmUWQ1WFFiek9RNThCWExkL0tUaEJ5SExCcTF4b05UYWwzaTFQRGRo?=
 =?utf-8?B?bDlWWXQ2V1JUd3d5L21lMWJZTVFmMytZUUx4VlRqdytPYU5VRkZpUER4TGQr?=
 =?utf-8?B?Qyt3bllrR3B0SmE0Umh4Vi94SWhWQjJiSEthUzVJcHp4bU9PQm1zeUQxVGxX?=
 =?utf-8?B?cXVBNTRrMlRLWllLOHY5UGQ0RGRsN1JSVzc2WUpTZFhzYzF6WlJWaTZla3Rx?=
 =?utf-8?B?Q3NNbVMvQ1VGZHVZeWNtbGVzVGQwUkI1dlQ0T2ZuUUowLy9KdWdvZFRPM0ZW?=
 =?utf-8?B?enNrTDdlUWwrQ1JYbWk2VitZcnFLMlVhNmVFOE05cWxjTWR1bFpGQTJVdlJu?=
 =?utf-8?B?ZlFvWjZ2RXByd3FEWnIrdTRCMHZBZnhpakNRbkRWNEpSaXJWMkQvV2UrOGxt?=
 =?utf-8?B?aWc5U0Jsc0MwSS9COE51eEtpN01CSXQycjRDZ2ZuNWF2LzROVFJZMy9ZV3p1?=
 =?utf-8?B?V2hlMmNCZ0ZrTk1vdmZmd0VIekR1ZTZUWWFXUXRuV2luQjFaS01mMXVHU3Rh?=
 =?utf-8?B?ZDJuVDFhTnVKQnVkSFFvU2RYem4xd1JZNWUrY1ZBRUFQZUloUms4ZFdCRmNT?=
 =?utf-8?B?RlVleFUzQTBYQ3VPc0h5YW5uVTlFRUcxT21YYkx2S3F4azV1L0VyanJMekxP?=
 =?utf-8?B?UlZUcllQRmlFb2pXREN3T1VuYStzMUd3cjJzbTVuVGdoL1pPVzgvZ0dGRiti?=
 =?utf-8?B?M0o0bm00MEF4M0E3NXNKeUZtcFdod001OVBELzBNVk54emFjcC9QdkFCYlp2?=
 =?utf-8?B?Z2tFOVp2d2NaN0JOREVMZitRWVFsTWRQZ1V3YlVhQSsxZlRwUUtlUFhGVFFy?=
 =?utf-8?B?eDVWWENMNFdxaEFNWnNZaGNsVXI1Q2Y3L20yWW02emJXSGMvdVJTejZLbUlk?=
 =?utf-8?B?bXlLV0xRdmdNWmsxVjkzY29kU1pBU2JyWHBIbHpmTmc4M2kwUjBQVjc3M0pa?=
 =?utf-8?B?RTE4bGk2Tm04d2JCbytHalh0YjhvVkRIVDVrTTBqaER2QWlNd1RmMVJ6eXdh?=
 =?utf-8?B?MUtoT2hWUyt0ZXI3ZXNRTVlUSVZZL0xsQ0V2UFYxN0hHYm1rbDg2RHJ6TGZ6?=
 =?utf-8?B?TEIralY4dVZpNmovcFU2S3liZWQxWEhNNmcvL2huWkxZZWdqNkxEbTAxVHdO?=
 =?utf-8?B?emc0RHBEZFhhVnVIRUFWR0Qzb0hmZE1YTXFlaTBRNk1uejNOWXNNOE9NYkNP?=
 =?utf-8?B?bk5jSkM2L2h3d1RBKzhxekJTTUxqWmV6dEoyMWdjZ3lYU1gvVXZwdkgrRGVs?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 861d1f24-e7a8-4e2c-21d0-08dd5c8fa796
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 09:17:01.9352 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fggHx4wMupYODToxhGDKP4F9K7eL8PZ7BLiRj9VQxtaQM25fhSYDeJXGx4gCy71Hrs0Ngd23ckHq68VwlaI3L1ow2nwYN11P33JDu4sFYcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6266
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

Hi Kamil

On Wed Mar 5, 2025 at 7:31 PM UTC, Kamil Konieczny wrote:
> Sometimes an error happens in kernel or in test that leaves
> output files in corrupted or incorrect state. While runner or
> resume will just move on to executing next test, when generating
> results it could end up with no results.json
>
>   Try processing outputs a little more persistently and use any
> output file left there, even if only dmesg.txt. Also, when no
> useful output files were present, instead of breaking out add
> notrun.
>
>   Inform about processing results for each test so a problem
> could be spotted more easily.
>
> v2: removed ')' from 'notrun\n)' (Kamil)
>  using bool var, added more prints about errors (Ryszard)
> v3: reused open_for_reading, removed bool var (Krzysztof)
>  closing only positive fds[] in close_outputs(), checking
>  file sizes also if all opens succeeded (Kamil)
> v4: reverting to v2 and addresing review comments (Krzysztof)
>  closing only already opened file, drop early return when empty
>  output files as this changes run status (Kamil)
> v5: reverting to returning false after any out/err/dmesg output
>  is missing, simplified later checks and printed logs, fixed
>  closing outputs (Kamil)
>
> Cc: Ewelina Musial <ewelina.musial@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Ryszard Knop <ryszard.knop@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
> For results checks compile igt with runner and then run
> meson test -C build
>
>  runner/executor.c  | 34 +++++++++++++++++++++++++-
>  runner/executor.h  |  2 ++
>  runner/resultgen.c | 61 ++++++++++++++++++++++++++++++++++------------
>  3 files changed, 81 insertions(+), 16 deletions(-)
>
> diff --git a/runner/executor.c b/runner/executor.c
> index 2abb18732..6cfe523a2 100644
> --- a/runner/executor.c
> +++ b/runner/executor.c
> @@ -576,15 +576,47 @@ bool open_output_files(int dirfd, int *fds, bool wr=
ite)
>  	return true;
>  }
> =20
> +/**
> + * open_output_files_rdonly:
> + * @dirfd: fd of output directory with err.txt, dmesg.txt and other file=
s
> + * @fds: array for fd's of opened output files
> + *
> + * Tries to open output files in read-only mode and saves file descripto=
rs
> + * in fds arrray.

%s/arrray/array

LGTM
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>

--=20
Best regards,
Sebastian

