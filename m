Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B15E7717F
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 09:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAD310E24B;
	Fri, 13 Dec 2024 09:09:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv6/uQZn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6651010E24B
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734080985; x=1765616985;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=R76w/adcEJo2bQ+cVnFriqFahM8mrtgBwn8x9OHnXNs=;
 b=cv6/uQZn/wGoOVgQQUNJCDkBd/gf00SdqIu2886yHxljIyjqo+chv0VN
 T8w778donjo4UPt4BHnsjbcxpbXX60zdKtXT+TAI9Pjnwhzqix9Lk+/FH
 jW6BcQ8qf0V1QuRbeqJuPpIgQ1Qa8F3BL7KrbZzroiluGyTci63Mi14Y+
 cTQM4CevIarWtK3UMT0ljBfAy2CnXzwU8QwLSszOwd8cX0yQo8/pXA+qR
 qWJJWQIblgdfu6HyPq2LOLhtuUKbuE6wTESGnPtDayIAqC4ZMKPnKktm3
 OWxW5lxwSjlP/KjLcHOav2ZFDmKoSJvn2ClhhM37mk7+pn5jck/nETSRS Q==;
X-CSE-ConnectionGUID: qSVyKhiJREimWvjNNR5p9Q==
X-CSE-MsgGUID: j44kmXBZRcyLiURP0VxLGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="38464443"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="38464443"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:09:43 -0800
X-CSE-ConnectionGUID: pcWxq9FUTnSc9UBh15d/CQ==
X-CSE-MsgGUID: v+IV5U6RR7es4oLQADZF5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119741292"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 01:09:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 01:09:42 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 01:09:42 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 01:09:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/qzJ5c9qllh5dx0Ixe/ybY0Ynfn0ln7sNl5H5GuWlanEfdX6hvZ2IiCQoL2TfbILkNq+dzAji9JpUnwM4EZl5nsWSeB7fUwtdDclAbw9Hu6RnJrOZ/dvqClUCMLYARhcFq7647Et60l9NqFZvogutXru4M44MKDTikZFhcgzcj8l+PTiGrDaL+oA7JWGXkNFVmhZpgC3zl3ylGNT85xYw4y2ODhE/fHM2aWn0EsrjDgpsCkUd8VkoW2AaFxb5K2aIhNpeyJ1cYGQ0Lk4Ror8i3O73DdLhSPBsEmB/yxXzvufOCEVKu9hzXSOq4zCWzpoE/9TE6sbZVLYZd+9cUPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R76w/adcEJo2bQ+cVnFriqFahM8mrtgBwn8x9OHnXNs=;
 b=HkGWxUfvejCcg5Kp/N+a3WHA/nPp9OMBzlfrAot+1PyK+PTWjQdLDlY177Sg/8q+i1p5CrzNLbkcq4jBa20aDvlCDEKzkvl513JBOSL2Fgtc6AYqPIUWJikxyw1xB6qG7htUIzmpfBwLSoRuHNZAl+aZsQrAhIbOIn13D/qv5iNVKGLpEDP1ALa3D4jcdZ+KGaCKlAhtS1lCqVaeBAOk/PEsP1uSOBxMIvlnowZw9IiD+qysB6GZb7E0K9oI/ptv1zjSJYH1UfMV0vsxGHCny/OTbpwTbhF4722mrW51F/6qXM2KSFc/44r7ogt5gAbGfSzvFMSNrUkJmT6TPhvM7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Fri, 13 Dec
 2024 09:09:35 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%7]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:09:35 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Gurram, Pravalika" <pravalika.gurram@intel.com>
Subject: RE: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Topic: [PATCH] tests/intel/xe_vm_create: Check negative cases for
 vm_create ioctl
Thread-Index: AQHbTTUIkuePPxyRDEG00alOA0/CvbLj310A
Date: Fri, 13 Dec 2024 09:09:35 +0000
Message-ID: <IA1PR11MB6097E036E990499AE43E997386382@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20241213075724.641859-1-pravalika.gurram@intel.com>
In-Reply-To: <20241213075724.641859-1-pravalika.gurram@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|CO1PR11MB4852:EE_
x-ms-office365-filtering-correlation-id: d8b6a071-6eac-4bfb-2baf-08dd1b55dd18
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?Q3Y3SGJwRGp3WVp4OGxoQ2dydGd5dlBxSWovNG1XT0Y0dU80WUdkUU1COUVt?=
 =?utf-8?B?dTBSWS85MWRIUjBEakRYWlh2NFBWVkNCZmkwSEFkN0doRzE5UjZCSUpJS1BE?=
 =?utf-8?B?REgzWUNBR1RWTkE0ajY4WkwxclNkdE5qWDA5M25NZXdZN3N3aXZHM3BOek5T?=
 =?utf-8?B?N095Um9hZ1Jzb3BDNkorVERHUTZJd2pBbzRRMW9yODZ1blhyZ3plWk9pY2Uw?=
 =?utf-8?B?bU9Xdzh3TnF3R211MDJLY0U5NkhVMXF2UE9ycW5Ic3NvN1Z0TFcvV0RtN28x?=
 =?utf-8?B?V1huek5EY1NQUVA2eTdJcTRVRFlMcEdqSVFlQ3YzcUcydmxxUW1tenV3VzZz?=
 =?utf-8?B?eU9laFFmM0h5TE8zOFhpcFNOekJHb1R5Z2pnZEV2Yldwa1pSWW5HVy9WcWwx?=
 =?utf-8?B?aVQzQXlsQnVKY1pGcFdKNzRBZFFYa1pXamVnRnFhM2o2SURpKzhMeHRlNXpa?=
 =?utf-8?B?WWdROWxmUTJMUU01Q3RUaSszVGtyUXhZRlV0bHh0T25OQ21IUXg0Z2I2U2JZ?=
 =?utf-8?B?cCtUSy9pV09FME1hajluQXZFVDUyYXZZeE5yWDZaQWdBd0t0WnRqVXZTdUta?=
 =?utf-8?B?S3pGeEVadm1jN01TNG02ZVpLdE1DMnRpdDdSMUM2dlkrUHZaRkljbTFEYUxM?=
 =?utf-8?B?TjI2S1FURkhBdE9vd3JtRW9wYVJ4SzJtMTJMTDVIWC9nTGZxZ1ViQ3NsaS9R?=
 =?utf-8?B?azRrYzJRU1ZuL2NvTDFIVkFONHNYemtTYlBjbXRpM2I1SU16VzlvNnFML0l1?=
 =?utf-8?B?UU1ZQmoxN0RhcWtvamRlRnV4SFhMVWoyUDJsSWkvQ0s3QXErQUNvOHlGTVBa?=
 =?utf-8?B?MFhxa1hEVkdKWHBYMDd6OFA5NlV4VWx3Rk1zei9CV3dqMW1PeVJIaHFKWWUv?=
 =?utf-8?B?eU5OSmlsUnJSK3ppV0c3WENXOG1uSmNQZko1MGI0dysyMzllUzBSK0didFQv?=
 =?utf-8?B?cGIvOHR4UW9KZ0x2bjk4WmJRbXFBVHRhWFBLN2JhQjN5bGc0a3JlaU5HdzZG?=
 =?utf-8?B?clFxYWEySzRaS01JWFV1dFhUWGlkVFFwOVFTUzUrNjBvOFFrQk1TbFNETHRE?=
 =?utf-8?B?cldxTUU3cCtJN3ZheFk4b1NlNHpKNE5WREJxd2F2elU1UzNabU9SRFNicDVM?=
 =?utf-8?B?MnRjdlRZbDZZdGVlR1gzTXJncndHQ3RtRk5lMjRjWDhkK3V3WWlKaVFIYzN1?=
 =?utf-8?B?MVhZVkVxRWF3SDJXdTVjaGlxMjZzbi9zcnBCTUQrczArQ0dzSTk3N1pNek4w?=
 =?utf-8?B?eVZQWWErQ3ppZm0vVndDczFEdUUrbXE2eDVQbXo2dlpMM1c3VkdEMmRwT3Iw?=
 =?utf-8?B?aXhPSHNzN0pqUXFjQXQrNW0wczduL3lZSkJCOGdIQTZZOVdIQVVoM1FvWnRE?=
 =?utf-8?B?a283ZTBLRGk2T2gxdWVKaWJmVjc4ZHArclp4QTEwTVRKaExXclZON2N1MTJZ?=
 =?utf-8?B?T0hQTUNZRXpwR1I5dkxlM1FDRERqTERpendWTXZYcFA1bWFiV05MellDL0VP?=
 =?utf-8?B?KzNOVEZSOTBvdTRTK3hDdm1lbWtEUXM5anI5RDNJelRobWt0WVUyTjhUcVFt?=
 =?utf-8?B?c0k1RWtwSmJqVTdVSWxWakpNSlJVOW11UG45YUNaMmxkZm11TmpxSlBXR0Yr?=
 =?utf-8?B?d3JOV2QzZjBkUjdGUlJ4cmJQWktNVXFRRjliWXFZYzVFZ0hoSnNlS2FxeE1H?=
 =?utf-8?B?Z01heVZkQkJGcHVaeVNDb0txVS94bUdYZjFFUWp0NUc2SjFGU09yditwb0hO?=
 =?utf-8?B?YXNpaFZ3WFlyNTdtQ05zQ0hyYkNiMFdLYzl0L21STjRIV05nbXlSVEs3VW5G?=
 =?utf-8?B?Q1FZQk1Hc2p4R3NlRjJXRWRNWUx5SXVSRno1Sk54NHVDeUVNRGZJZ2RZTmk4?=
 =?utf-8?B?U2Q5WGhrYWczNElFNEgvZUVOU3duMTRTeC9Kd2crMmNXdUJ2YjE5NU5EN2pR?=
 =?utf-8?Q?pLTxWl+eEdK58vo2o7IShy8JUpP5SoNN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MWs5UEtDNEhQN1ZoUkU3UjJOTTU4Y283YmFaSVVDWCsvZ1BPOThnd3N6VXJH?=
 =?utf-8?B?T0ZXN0JqZlZQS3JDTERxZW9rRkFmRUJvYzJnU2xQWWhTR1NlNElkUDRZUU9W?=
 =?utf-8?B?VWEwWFAzbnYwTmlrclJFaVdZTFUxL2tIM2h5YjgzYlI1QVY1M2ZsUi90bXVk?=
 =?utf-8?B?RVFvZ2U0ckxKQW42Ykx1dWRYenRCSlBIanJHMkFnODJHaFBTSFFnbEE0a2tv?=
 =?utf-8?B?YzJUdTZWUXNsMlViNHhqbCtVK3Vua011MVBiamVNMG4vcWZveW40eHROQ2xJ?=
 =?utf-8?B?WXMrbkw3aU5yNXRqbk5TVm5qV2ZFc2RxOGUveXlpMi9LR0tkZjl6bU1xTFlG?=
 =?utf-8?B?V0RDckgyOXFoR3YvbXZkQVI5dGVDMXJQd0pMaVRBRzNBKzNEaktyV2E3RUR4?=
 =?utf-8?B?a3FWaVFFYVp1T3h3dkFZaDhRVHJTbE4xNjVFM2o1Qzk0K1o2WUt4cW5FN0NU?=
 =?utf-8?B?QWdOenZUUjR2NFdORWllaWF6eUdzMTdrTExyVzhYQngxc3RPSUl5QVloWS8z?=
 =?utf-8?B?OVBNWEdyK1lsRkhySHpZYzNKRG91eE5seHcwV1Rlb0Q2UkNFVmFTNFkrR2I4?=
 =?utf-8?B?Mk1RVHh4RFk2YVZrMlZPYk1kVEw3SkE5YWVwM1FTL0JxV253d0Jjc2hLSEFl?=
 =?utf-8?B?dW15RzYvSTUxdllNWEpqNzBSWGhtRzdIbnBjTlkrUjlVZEJnUGhoNWlEZWxa?=
 =?utf-8?B?VExiWWxLVzJYd2R6NWVwbG9KUkNrbUZRYTlMMDFqVll1NWs4NVVncFJCR1Nj?=
 =?utf-8?B?aThPcjlpMFc5TWdVVDMraUN3MDh2NUE2QWMyYy9BR2svanR3VDlvOGVoc0xU?=
 =?utf-8?B?eXRadVBaTjQwdHIyVkZva0hhcnV4Tlk5S1RrYmtqVXJIZXZWYkFJcEFLMExI?=
 =?utf-8?B?NUFtU2pKTXZ5RktoR0lOSVFtZ0tmSGNTRU54NnNRMDZ4N045KzNsMEtiZFNM?=
 =?utf-8?B?dkRoMHczVUZiRlJRUENhV3Q1L1ZoK1JxQzRzdTg3ckszbG5ZeGtONGJ1MDc2?=
 =?utf-8?B?Wmt2UVZISk44d29BNzNSNHpVQW1CQzhsTUFvT1cwMVRHcEpQdTdPdCtNR29N?=
 =?utf-8?B?UloxK3RqU2dEVm9heUIwWWU2OHY1eUtRcTNubWtNZXh0V1JRZmpYRGlqWWYv?=
 =?utf-8?B?dTUyTGZOMzhXMmZxRTlXRThvNm1zbWdTY1laZGtlaUtvRDFmUllWZFJ0b1lJ?=
 =?utf-8?B?VHN1Y2xLNjMxWjNQeFp2Z3pzelJwUHBoZkEvRTAwQjNYTWdZb1BZcjVHR25J?=
 =?utf-8?B?QWVSQzQzeWJTQlZnUnRVaXlpTGZ6cGVPc1VNVHBUNXlOWWo5NTlMd2Q5Z0Jt?=
 =?utf-8?B?UUdWZ1FwSllERFdNKzBCb1FCaHVVMEJZLzQ5YkVQTGpVdlNHNUpGbW9EV1A1?=
 =?utf-8?B?WnQ5TC9LNVZvbU9EZGNlM0Zmdm9lcXBCRm5haWc4b2pxeThpaVpFS3hwSFBX?=
 =?utf-8?B?WmJNLzNQZTFDNmoybmZwRFFpQWhXU3N1UktTamQxUFRjRW9DQjlHcDBWNGYr?=
 =?utf-8?B?V1UzaFphcGZTek90SlpEWXo4NHdFWWRrejhob1Vsb2xaeWxndFlGNmpydnJP?=
 =?utf-8?B?L3RFRDhBSUowS0dqM1lMMDJjUy9jSWlneUVZMUhmNm13UURENy9zdWE4c2xR?=
 =?utf-8?B?dEtuNEczTmNOSC9PWE93VVpGcGlIVlBTRG0vVFBUN2J4cE1QazdtVkdlR3By?=
 =?utf-8?B?bzNaU2xqRldMUVlsSnBYWTFLOHA2MDVIUDd2MUg1V29YY1BKSDFxRnd3aFFz?=
 =?utf-8?B?ekNia2FnUlh2WnU1aVFrRXBxdTVkOENZZTY2TWhINjE1b0pXMHE4eDhGeFow?=
 =?utf-8?B?RHNiWWYxR3F2ODhabE5Bd29Yb2tra2t5ZDV4RGVNa0pZL01PcmhIdmhSbmdB?=
 =?utf-8?B?UzJzZkFlU1U5Q3AyOWtUUGZRQnhvMG5pSVBoaXozcDNlUjNzb05YdVlnY2pH?=
 =?utf-8?B?SXRJTldpNDM4ajhPZ3RGMzJMdytMeGVSVURyaTRMT3psK3NOUkE2dnd1MGZF?=
 =?utf-8?B?MFpDWk5JZWcrM0hiZWttT2hvb3hyaXhzM3gyRkU4a3Uzbzd3M3l3RzlWT0ZB?=
 =?utf-8?B?blFiRXlWcDIyblVTSytoT1p1aGtDb3duSDZJN0pZVFk0ZUNObHZOajBXL3ZI?=
 =?utf-8?B?OTlrSGFzcnFMZUU5VG1WVlJMRTNlVWRoazJjTXJQVHd2NDM4TWZhUlVzVHRu?=
 =?utf-8?B?UUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b6a071-6eac-4bfb-2baf-08dd1b55dd18
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:09:35.1415 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xmK9JXHJlIXYDGx5D2+oL/dvoQXZlf8Sx40GGb3jBx0QoFvdNjOgW1JK4G2nTXbWKSnqGbt+/eafgPQNMm+z3kb/AoSLEzQ0c8XwZ5RaxE0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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

TmVnYXRpdmUgdGVzdCB0byBjaGVjayB2bV9jcmVhdGUgaW9jdGwgcmV0dXJucyBleHBlY3RlZCBl
cnJvciB3aGVuIGludmFsaWQgZmxhZ3MsIGV4dGVuc2lvbnMsIHJlc2VydmVkICBwYXJhbSBpcyB1
c2VkLg0KDQpTaWduZWQtb2ZmLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFt
QGludGVsLmNvbT4NCi0tLQ0KIHRlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jIHwgMTA0ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAg
ICAgICB8ICAgMSArDQogMiBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCB0ZXN0cy9pbnRlbC94ZV92bV9jcmVhdGUuYw0KDQooS2FzaWEpIFdlIGhh
dmUgYmluYXJ5IHRlc3RzL2ludGVsL3hlX3ZtLmMgLSBpbiBteSBvcGluaW9uIHRoaXMgbmV3IHRl
c3Qgc2hvdWxkIGdvIHRoZXJlIGluc3RlYWQgb2YgY3JlYXRpbmcgbmV3IGJpbmFyeS4NCg0KZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jIGIvdGVzdHMvaW50ZWwveGVfdm1f
Y3JlYXRlLmMgbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwLi4yNDMwZTY3MzkN
Ci0tLSAvZGV2L251bGwNCisrKyBiL3Rlc3RzL2ludGVsL3hlX3ZtX2NyZWF0ZS5jDQpAQCAtMCww
ICsxLDEwNCBAQA0KKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBNSVQNCisvKg0KKyAqIENv
cHlyaWdodCDCqSAyMDI0IEludGVsIENvcnBvcmF0aW9uDQorICovDQorDQorI2luY2x1ZGUgImln
dC5oIg0KKyNpbmNsdWRlICJ4ZV9kcm0uaCINCisNCisvKioNCisgKiBURVNUOiBOZWdhdGl2ZSB0
ZXN0IGZvciB2bSBjcmVhdGUgaW9jdGwNCisgKiBDYXRlZ29yeTogQ29yZQ0KKyAqIE1lZ2EgZmVh
dHVyZTogR2VuZXJhbCBDb3JlIGZlYXR1cmVzDQorICogU3ViLWNhdGVnb3J5OiBTeW5jaHJvbml6
YXRpb24NCisgKiBGdW5jdGlvbmFsaXR5OiB2bSBjcmVhdGUNCisgKiBUZXN0IGNhdGVnb3J5OiBu
ZWdhdGl2ZSB0ZXN0DQorICovDQorDQorLyoqDQorICogU1VCVEVTVDogaW52YWxpZC1mbGFnLSVz
DQorICogRGVzY3JpcHRpb246ICBmdW5jdGlvbiAlYXJnWzFdIHVzZWQgaW4gdm0gY3JlYXRlIElP
Q1RMIHRvIG1ha2UgaXQgDQorZmFpbA0KKyAqIEZ1bmN0aW9uYWxpdHk6IGZhdWx0DQorICoNCisg
KiBhcmdbMV06DQorICogQHhlX3ZtX2NyZWF0ZV9mYXVsdDogIHhlX3ZtX2NyZWF0ZV9mYXVsdA0K
KyAqIEB4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0OiB4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0
DQorICogQHhlX3ZtX2NyZWF0ZV9zY3JhY2hfZmF1bHRfbHI6ICAgIHhlX3ZtX2NyZWF0ZV9zY3Jh
Y2hfZmF1bHRfbHINCisgKi8NCisNCitzdGF0aWMgdm9pZCBpbnZhbGlkX2ZsYWcoaW50IGZkLCBf
X3UzMiBmbGFncykgew0KKwlzdHJ1Y3QgZHJtX3hlX3ZtX2NyZWF0ZSBjcmVhdGUgPSB7DQorCQku
ZmxhZ3MgPSBmbGFncywNCisJfTsNCisNCisJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVf
Vk1fQ1JFQVRFLCAmY3JlYXRlLCBFSU5WQUwpOw0KKw0KK30NCisNCisvKioNCisgKiBTVUJURVNU
OiBpbnZhbGlkLWV4dGVuc2lvbnMNCisgKiBEZXNjcmlwdGlvbjogQ2hlY2sgcXVlcnkgd2l0aCBp
bnZhbGlkIGV4dGVuc2lvbnMgcmV0dXJucyBleHBlY3RlZCANCitlcnJvciBjb2RlDQorICoNCisg
KiBTVUJURVNUOiBpbnZhbGlkLXJlc2VydmVkDQorICogRGVzY3JpcHRpb246IENoZWNrIHF1ZXJ5
IHdpdGggaW52YWxpZCByZXNlcnZlZCB2YWx1ZSByZXR1cm5zIA0KK2V4cGVjdGVkIGVycm9yIGNv
ZGUgICovDQorDQorc3RhdGljIHZvaWQgaW5hdmxpZF9leHRlbnNpb25zKGludCBmZCkNCkkgYmVs
aWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0KK3sNCisJc3RydWN0
IGRybV94ZV92bV9jcmVhdGUgY3JlYXRlID0gew0KKwkJLmV4dGVuc2lvbnMgPSAtMSwNCisJfTsN
CisNCisJZG9faW9jdGxfZXJyKGZkLCBEUk1fSU9DVExfWEVfVk1fQ1JFQVRFLCAmY3JlYXRlLCBF
SU5WQUwpOw0KKw0KK30NCisNCitzdGF0aWMgdm9pZCBpbmF2bGlkX3Jlc2VydmVkKGludCBmZCkN
CkkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxpZC9pbnZhbGlkLw0KK3sNCisJ
c3RydWN0IGRybV94ZV92bV9jcmVhdGUgY3JlYXRlID0gew0KKwkJLnJlc2VydmVkWzBdID0gMHhm
ZmZmLA0KKwl9Ow0KKw0KKwlkb19pb2N0bF9lcnIoZmQsIERSTV9JT0NUTF9YRV9WTV9DUkVBVEUs
ICZjcmVhdGUsIEVJTlZBTCk7DQorDQorfQ0KKw0KK2lndF9tYWluDQorew0KKwlpbnQgZmQ7DQor
DQorCWNvbnN0IHN0cnVjdCBzZWN0aW9uIHsNCisJCWNvbnN0IGNoYXIgKm5hbWU7DQorCQlfX3Uz
MiBmbGFnczsNCisJfSB2bV9jcmVhdGVfZmxhZ3NfZmFpbF9mdW5jdGlvbnNbXSA9IHsNCisJCXsg
InhlX3ZtX2NyZWF0ZV9mYXVsdCIsIERSTV9YRV9WTV9DUkVBVEVfRkxBR19GQVVMVF9NT0RFIH0s
DQorCQl7ICJ4ZV92bV9jcmVhdGVfc2NyYWNoX2ZhdWx0IiwNCisJCQlEUk1fWEVfVk1fQ1JFQVRF
X0ZMQUdfU0NSQVRDSF9QQUdFIHwNCisJCQlEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfRkFVTFRfTU9E
RSB9LA0KKwkJeyAieGVfdm1fY3JlYXRlX3NjcmFjaF9mYXVsdF9sciIsDQorCQkJfihEUk1fWEVf
Vk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSB8DQorCQkJRFJNX1hFX1ZNX0NSRUFURV9GTEFHX1NDUkFU
Q0hfUEFHRSB8DQorCQkJRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxUX01PREUpIH0sDQorCQl7
IH0NCisJfTsNCisNCisJaWd0X2ZpeHR1cmUNCisJCWZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZF
Ul9YRSk7DQorDQorCWZvciAoY29uc3Qgc3RydWN0IHNlY3Rpb24gKnMgPSB2bV9jcmVhdGVfZmxh
Z3NfZmFpbF9mdW5jdGlvbnM7IHMtPm5hbWU7IHMrKykgew0KKwkJaWd0X3N1YnRlc3RfZigiaW52
YWxpZC1mbGFnLSVzIiwgcy0+bmFtZSkNCisJCQlpbnZhbGlkX2ZsYWcoZmQsIHMtPmZsYWdzKTsN
CisJfQ0KKw0KKwlpZ3Rfc3VidGVzdCgiaW52YWxpZC1leHRlbnNpb25zIikNCisJCQlpbmF2bGlk
X2V4dGVuc2lvbnMoZmQpOw0KSSBiZWxpZXZlIHdlIGhhdmUgdHlwbyBoZXJlIF4gcy9pbmF2bGlk
L2ludmFsaWQvDQorDQorCWlndF9zdWJ0ZXN0KCJpbnZhbGlkLXJlc2VydmVkIikNCisJCQlpbmF2
bGlkX3Jlc2VydmVkKGZkKTsNCkkgYmVsaWV2ZSB3ZSBoYXZlIHR5cG8gaGVyZSBeIHMvaW5hdmxp
ZC9pbnZhbGlkLw0KKw0KKwlpZ3RfZml4dHVyZSB7DQorCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsN
CisJfQ0KKw0KK30NCmRpZmYgLS1naXQgYS90ZXN0cy9tZXNvbi5idWlsZCBiL3Rlc3RzL21lc29u
LmJ1aWxkIGluZGV4IDI3MjRjN2E5YS4uZmI5ZmM3NWQ4IDEwMDY0NA0KLS0tIGEvdGVzdHMvbWVz
b24uYnVpbGQNCisrKyBiL3Rlc3RzL21lc29uLmJ1aWxkDQpAQCAtMzIxLDYgKzMyMSw3IEBAIGlu
dGVsX3hlX3Byb2dzID0gWw0KIAkneGVfc3lzZnNfc2NoZWR1bGVyJywNCiAgICAgICAgICd4ZV9z
eXNmc190aW1lc2xpY2VfZHVyYXRpb24nLA0KICAgICAgICAgJ3hlX3RsYicsDQorICAgICAgICAn
eGVfdm1fY3JlYXRlJywNCiBdDQogDQogaW50ZWxfeGVfZXVkZWJ1Z19wcm9ncyA9IFsNCi0tDQoy
LjM0LjENCg0K
