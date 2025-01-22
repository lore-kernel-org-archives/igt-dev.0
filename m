Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABF4C02181
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jan 2025 18:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B6210E73F;
	Wed, 22 Jan 2025 18:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOwxGMpc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8285F10E73F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2025 18:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737572143; x=1769108143;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=K8MjpOlbOpvg/DFhWMHQSszXw5gK7x6adoABw133WH8=;
 b=cOwxGMpcFBK1Q/3YN12Oj9nPJo5GQtM/HtDIaVzARwSKmZ++eRa7BlpJ
 x9WVYa1Osk2Dt8fRhsRZOmAHHfoTGWGDg5ZbZ9wqUo7MPgCno3LR7hbBM
 88p6+e+vcQTbyO6/PqfEZZVhu7kk8Q9JTk6fZ2/CvuqYTxGF1wMVKJf4q
 d+MEQotkIu0D2cHG0s70RAh6cy4sx6gKY5AzX6MSLNq6HTc8OwOg1g9T2
 8WD+spQxX0JHtVYgOCbozDcDvNxAkm8JR49stkcv9aDaWLrEqlkJChht4
 JwRJhnqg1NadCZdXCMrVTFHck8JMTgemzMf6P7QsKnu5qf6Zdcx6MTSKU w==;
X-CSE-ConnectionGUID: V7qebO4cR9uuT0tQ7mnx8w==
X-CSE-MsgGUID: oy7TaWnHSgqk6Yy2KL1deA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49441993"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="49441993"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 10:55:43 -0800
X-CSE-ConnectionGUID: NaxJxh2JS6qp7dxMuOg/QA==
X-CSE-MsgGUID: B6EpWvzpRHuUYXcex3V8og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="112200135"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 10:55:42 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 10:55:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 10:55:41 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 10:55:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJxZ4+pfQ8p1jKzRB/0yFKGi4D4CGwB7qfb4OMNLgqdFdwoWTb9yI8UBfTQW5H0PYkEGQuBFU4iR9+y56Uiu6X4KBzturoJGDrWTT0kHZtFWWF7vswCWWseQQnTUgHgEA5peNdaE3DAcUlD4LRl9Jjf+vGyZGgmSHno+/+oLnYbREz3lo0HSlZ0NllNP5A3kTrqPoCvh/O4KYKgylsBGmqjdMylh7qwwCWv8nVDLNtgvZhtgD0BZjVkUOMTatoFYBsViYdAFtrzXulQtMYOm47QT39KQNGij96Q6rcwmgINN3XJ/fzFW8M7ROQjuT3Pbgu5IQEuBDca4v1FASh+SGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BwoFB2USXUVIn/zf2pPH2DYrmgheaWMxYT4Rg2EsuNE=;
 b=qCZpCI/aRJaXVSM7IQak/jrjO5JQizNh5v2QKfM4tc8OwnP6XJna10YMqusqQkHrdHXzup8l/RaNf7tkxITWVTvHWeLpptQnNYlr6mtezEvW4W1IRkVB4qU8SMk0LyI6PS8kIPGntaMpileNl0Mgu+qgvuAbZ+q2fqVbrYilShwoaIe/was1kgFWBwuEHhF/nui1yWP9ESJyyt1YUy2Y2TZ2+u7K0ahclyk3CCUHGzoGIKTc06U2BZ5rmgFjood8rh4xenrK8vK6Wiv0X7t336/d+YaQH4YHTBPLwvk28ImJWctRd0bMUfgBa+hR2QOKqJCXjeLVDMBrqVFyjCX4fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CY8PR11MB7265.namprd11.prod.outlook.com (2603:10b6:930:98::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Wed, 22 Jan
 2025 18:55:39 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%5]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 18:55:39 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8b23c314-4a4b-4583-8cb1-1efc20ff8ca3@linux.intel.com>
References: <20250121225733.808978-1-lucas.demarchi@intel.com>
 <20250121225733.808978-7-lucas.demarchi@intel.com>
 <173754961509.5500.8834900644999128777@intel.com>
 <e740cbcf-7794-4b2f-866b-49c265f701b1@linux.intel.com>
 <173757039426.5500.1181401747974476563@intel.com>
 <8b23c314-4a4b-4583-8cb1-1efc20ff8ca3@linux.intel.com>
Subject: Re: [PATCH i-g-t v2 6/7] runner/settings: Serialize command line
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Ryszard Knop
 <ryszard.knop@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Peter Senna Tschudin
 <peter.senna@linux.intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jan 2025 15:55:34 -0300
Message-ID: <173757213461.5500.236986883013364364@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW3PR06CA0014.namprd06.prod.outlook.com
 (2603:10b6:303:2a::19) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CY8PR11MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: b0bc1d07-1c77-4d60-ddad-08dd3b165ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzhtVFVYU3F1VGZySjlZdTRyQjMyL1NwaVphbmRSR1ZkS2I1L24yeEhoREQ2?=
 =?utf-8?B?Y2JqOS9JMmNZTUJNeDd3T3lMRm1LY1Z3OUZZeHgvVDlCVHJxd2l4N2kvek9u?=
 =?utf-8?B?VHZ2V1Vma3laaVBZcHQ2cDYwZUVtM3NSTExoL1Z0RlJPL0NHREF1bFY5bjNv?=
 =?utf-8?B?QVEvM2VYVG50Z3dxMUVpZW5WVGhyNjVDN3EzK1UzTi85L1dUWXc1S09MbVBG?=
 =?utf-8?B?MzdGWGMxNmVOQW42UTE0OFpmSGF3VzhDTzkxK0Zra1EvS1NzWG8rekNlQkh1?=
 =?utf-8?B?WGx3Vk0rV0Zta3JBdXJFNlluSlFQTWRDQ1l0L1RkQ1hTRmN3TlBFcTB4a1pG?=
 =?utf-8?B?anFRUmVWVmV0R1UwdWVzQVkrOUdEM3p4T0pnRGJ5WFpPbk9jV1QrcC9XWjNu?=
 =?utf-8?B?NWlLM0tVYmZ2RDdZYkFWZmtSeTB3TzZrYXhlSlRkNHh5SmZiN3BNVEpZeXZm?=
 =?utf-8?B?c0ZOWkRxZElVZzdUN0FXRER4L2trTlM4OVlnVW54bUxwQmhaT3hmdnlMZ1lU?=
 =?utf-8?B?L0xjTmRiYlpnWjFhYmtjQ2xzb1c2OHl2ZHEzeld1WWxzaXBTS09JQmVvSXRs?=
 =?utf-8?B?TXdPbUtEUTZ2WU5jcnFaMTU0VVB6ZUtWdVQ4SjNWS2xwMGkyWlZMY0llLzRi?=
 =?utf-8?B?cVNVTjVYZTFWUzJmN0lkK3N2SjA4Y01IeGtqOW5lVXFPTTJ2VWplTUNibUlS?=
 =?utf-8?B?ZjExY2lmTlZzNWd4QTJudzJIM2owOUtPZXFjYmd1RWpTVlZ6OXpEM045bWRF?=
 =?utf-8?B?TDZJV2VYZmpNNXN2VVdlaEtIRUNDVnU5aTBhOUYvbFJBOHdQMEl4YkY5Wmtl?=
 =?utf-8?B?U2lLeXhFRVJROUpKTGxSS0NiWW43OXorSU9tN2FFblJyZGN5dGNKWjdIdDJV?=
 =?utf-8?B?TWJuSm9vWWd3eHhIZU9nZmtvSlR0R29NaktCUEtrMnpZbEgvSjRZMUVYRVQ1?=
 =?utf-8?B?L3FTdzdGczd5Z0R2NTZHSVdydW10L3lUTkUycnRvWXJlbWtleVhrTTM5MVUy?=
 =?utf-8?B?NUY0Rm5jVjY1YlZSYzBqNG5DVkw3Y3lvd052Zmc2d3REUDR0a0d5UWNOSEhZ?=
 =?utf-8?B?RUlSNUNuZWdsVzFwcWZieUNNT3ptdHZ4Z0xIekNOTmRqMlFBL1pjRXg3cTVJ?=
 =?utf-8?B?SFVuKzhCelBMc1RKUlQvZEVuQVFrTncyc3Bqbk9IK3JnWCtrWEJEZndlZGFI?=
 =?utf-8?B?cnNFTkZESndvUUxEVjNLTDVxVStWdDNqV21SZnUvMEY2cDhGL1ZoYjJzMGVn?=
 =?utf-8?B?L1UwZ0haeXdwOTlrNmlzakdvNm5seDBYdVBGM0FxUmxXVUYyZmI3dzhUUWc3?=
 =?utf-8?B?WVZjVnFMWTA3OUwvZmlNcG1VSjU4amY1K3VKZm1KTHByYUlkdGZqMFJ5N3Nu?=
 =?utf-8?B?cHFtMDFVWTZyZmVPUWxtQ2ZSdjJqbzJiZWxMTGErRU1sUXB1bjlsaVZSWFBK?=
 =?utf-8?B?OTUwaWt6U01CS2R2RWVvL2dGRlp2bW9YN0dOSlFBVmxzWVBIWmRqYkZsWm1j?=
 =?utf-8?B?OTNUK283ZjBDY00vMFJOVFJqTEZqWm9TaGNjQkNJS1BabGFIOEpxT2ZOYWZ3?=
 =?utf-8?B?bG5vOERSUDBrVFFVdjdnOEhIOWRtTXlxcGdYeVJKdUhsSTJpdU85Vnp2RDhr?=
 =?utf-8?B?cXRlYVZDV3d3MjJCZExUaHNISTJzcmtKOFJhdzB0TkxNalFJZXNVb29ob0sx?=
 =?utf-8?B?dXE5WDBFZVM1UnFvUWFXSDh1eUxiMzRacDJqYUtqeEQzOW9FNEFSWGVOU2Yx?=
 =?utf-8?B?Sy9GVm5tZ01MUXFRQktzK3QzZHArODBPK0x6WUVlVDliS0FVbkpLS0VhV012?=
 =?utf-8?B?SFg1NVcvUmZ2UGhkdUs2cmFNdVNraFgvQ1pSU2FEdjVjdW1tZkRwaFYrOERY?=
 =?utf-8?Q?1LRVVeZO7wSm0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek5GQlNndzJhNmMvMVFrQkV1TUpNdDF3eUxDTFBWSk5xaHg3SXZZT3lGKzlw?=
 =?utf-8?B?R1ZWK0FEbWhLWGtyN0NyWnBveDhzWkhQVUdLc3k2K25lRkRrWFpXRXJVRzVt?=
 =?utf-8?B?andmcVp6QXBvTWNHVTlKdGt3VUlTN1g3RURhMk80NWNpVlFQTVBqVUJ4U3Bi?=
 =?utf-8?B?bFF6K3RucGsrRHhRTnNwN1dNUExNb0NaVTRsaW50NlUzZEVycXJZcnQzaWJh?=
 =?utf-8?B?VktyeEVZbXAyVkIrRC8wRGpjWTIvbkpQQVlwOTZYQkZOY3NNZHBEOHlsdnM1?=
 =?utf-8?B?NlpUWG52ak5Jd1o3bnJXUzhaMVJoczg5NFNtTHhHUXdXS24veWZhNEx2NG0w?=
 =?utf-8?B?VkRlU0ZZaGVUclhLT1g3di9IeXljWEw2WkFEQ2svYkdqd2dqSWRGTkVieUJk?=
 =?utf-8?B?SGkvTDE2VFQ1YzNJVjZVRGl2SDFJV2lKRUt1bFhQNjBQeFVoU095VllKTGtU?=
 =?utf-8?B?UUdqSm1CaFhKMk1yN0dUSTN0TW1JSUlRRTFUVVpvUXcyTC9DL2RwV3hlNzJ3?=
 =?utf-8?B?OWJNMkFCTnJTZkhZNTkwQVVRR0FESVNxa0FIM0s2Y0pyYjJ1eWlpUWZwWmsz?=
 =?utf-8?B?SUZHdXBpQlhXQTFlSkIvbEV1V0lQWXdyL1hBN0cxUERHMFBvVnpkWHVBdTVa?=
 =?utf-8?B?bEwxM1pxa3Vyb09xWnNNNUpnNHBBZ2puRzgzNEtHZFBZWnBNeURSdHgzN0Fp?=
 =?utf-8?B?Ryt2SVdNcWo3WW42Sks2QVhWNFlTa1pnbi84UG93Q1owWXhMWm41TW5VSzUx?=
 =?utf-8?B?ZFptamcvdFM5VkVtdW00V3NRT1JiOXRtcms3NXVFODB5Y05QU21SRk1MSEsx?=
 =?utf-8?B?dDJMUitoQnZ1VlQ1dU9lajk3ODNuOUdjVU1mUjNSbWwyVXFlRlp1N2tzNEYz?=
 =?utf-8?B?Um1mNmw3YTJtQ1MraWZUb1k2QVVFVGs4c2diNGVQM2RJWjEreGpVd2VuT3RK?=
 =?utf-8?B?d20zREJ4enZQRmlMbW9QbFlaeG5aVTR4WHM2dk5xQThZSUl3S2MzYWxYVkNl?=
 =?utf-8?B?aE1PSFhJaU45cHRPWlZFYVFhQjVqZndJUVp0bE9XRkxPOGp5d1FQY084Q05l?=
 =?utf-8?B?S0hLL0ppTE5pUjV0eVJjMzNFZCtjZkpmUmpKWDkyM1g3T21nZUI1N3lsbVh1?=
 =?utf-8?B?K1ZUTlQ1bmZFUDFOeldHV3pMdWlkbUwxNVpoQmFMUGZUOW5PZmZMYy95NFBy?=
 =?utf-8?B?emtWZGU4cFVacE5IVWJ1SUJyaTJIL1F5L3NyL3BZM2NWUDBpUVZPYzVJRUpK?=
 =?utf-8?B?akVVQ2ZOeEp0WnhFSWhyaVZwZFVPVk1SakZaKzZXcXdRZTBWR1NjeG9VMmpB?=
 =?utf-8?B?VytCaUZ5Mkg4N3JlUEQyMlc3dVdtUVljNGZvK0xSSjNrbFNkUHpMRFc3eXE0?=
 =?utf-8?B?MGVwQ0VGRjljdS8xNVBmUTJJQzNwa1BDajMwclNmcGdMTHhib0VtRDV4WUtD?=
 =?utf-8?B?VjJ3WVFsWWJ3aVQwZjR4WVhrUVVNc2tEVEw5TEdxd1Nna3l2MzFEZlA4dWRB?=
 =?utf-8?B?b2JzRkZSWHFMMWEzMGVpSDczZHJrQTdIU0puZ2lhZDBsM2p0YXFPZXpMd094?=
 =?utf-8?B?b3pVMmE0U2VHbndUcmkwM1RuQ3V1ME9nUXhhdkdXWXFuc05SbS9MdktrNi9k?=
 =?utf-8?B?c3pwT0VrazN0SVpFQWZWR3Z1NjFXUlJuWlp5MzVHcUpDb2xkVU8yTWY3QUNi?=
 =?utf-8?B?cEZ4M3o4MmExUTdvU2tkeGJ1OHVoR1RxcUIrQjJvY0NvUFZhSldsa3ZEcjYw?=
 =?utf-8?B?cFkvWmZCQ2V6QXpTNGdOcVhzdGFFTXpCSzZwWGtSeGxZMDAxOFVFbUF1SHVG?=
 =?utf-8?B?c09CYjNXOGZvQ2FWQlgyWk0yRXhYNXVsdmhleUNwVjk4L01lbmFtTUxFMXpJ?=
 =?utf-8?B?SGVwazR0Rkx4SHpvODd3eGFMMzAvR2lYbWdoR2xpRlV0V1JnempEV0RHcXhC?=
 =?utf-8?B?U0lEWEtpRHorK242TWRQNzk2RzJWYkxKTEt5WG9xeWpoUFVUdHJlM2Jsbkh1?=
 =?utf-8?B?ajczV1ZKY1kvOXg2NXN5L3pqWWNzZkxvNTgrU3pna2pPbUVDZUF2RHFuc2lu?=
 =?utf-8?B?M21PYWZzc21zeitMT0dnRkJwN0xwalpDNldSaGZSUXZaUjZMZ2Fka1BZNTFX?=
 =?utf-8?B?VStodUhWR2lKZjFvS3dEYTVjSXdzYnBGRzkwUmxjMzR6N3AzT2x4YjUzcmV6?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bc1d07-1c77-4d60-ddad-08dd3b165ceb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2025 18:55:39.2403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tIBQ4oD1aqna7hu8eo0r3G+W+Sqxo8pPNsO6T1xB53l61IG2KBocEPUNLnjU5ZO4dwV4JUk2SeyYo2VJuPn/5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7265
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

Quoting Peter Senna Tschudin (2025-01-22 15:35:30-03:00)
>
>
>On 22.01.2025 19:26, Gustavo Sousa wrote:
>> Quoting Peter Senna Tschudin (2025-01-22 15:16:59-03:00)
>>>
>>>
>>> On 22.01.2025 13:40, Gustavo Sousa wrote:
>>>> Quoting Lucas De Marchi (2025-01-21 19:57:32-03:00)
>>>>> Serialize the command line to metadata.txt. The expected format in th=
e
>>>>> metadata.txt is like below:
>>>>>
>>>>>        cmdline.argc : 6
>>>>>        cmdline.argv[0] : ./build/runner/igt_runner
>>>>>        cmdline.argv[1] : -o
>>>>>        cmdline.argv[2] : --test-list
>>>>>        cmdline.argv[3] : /tmp/testlist.txt
>>>>>        cmdline.argv[4] : build/tests/
>>>>>        cmdline.argv[5] : /tmp/results
>>>>
>>>> One limitation here is that we would run into problems if one of the
>>>> arguments contains a newline character. We need to have a proper way o=
f
>>>> handling that.
>>>
>>> I tested this by adding -t '(?m)\b\w*exec\w*\b\n', is that what you mea=
n?
>>=20
>> If you are using bash, I'm afraid '\n' in '(?m)\b\w*exec\w*\b\n' is not
>> turned into a real newline character. Something like $'foo\nbar'
>> would.
>>=20
>> Example:
>>=20
>>   $ echo 'foo\nbar'
>>   foo\nbar
>>=20
>>   $ echo $'foo\nbar'
>>   foo
>>   bar
>
>No no, I am looking for an example that I can pass to igt_runner.

Perhaps that would be possible for --hook and --env, since the user is
free to pass anything there, so I would prefer that we are prepared for
that.

> If there
>is no way to pass a newline character to igt_runner, then there is no
>problem. :-) At least not a blocker for this patch, and we can create a
>Jira for improving special character handling.

If the majority thinks not supporting newlines right now is okay, then
I won't object. :-)

--
Gustavo Sousa
