Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA8D12D7A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Dec 2025 15:57:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C88310E81A;
	Wed,  3 Dec 2025 15:57:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lJt66AUs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED4D210E81A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Dec 2025 15:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764777444; x=1796313444;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=UUUSE/jKQ+gb+qyv3m8RhVvasIJ/C7okDQ1wXiHYPL8=;
 b=lJt66AUs4FeDKyEkCQhzFNWvZ3ppNLubt59qXXJppixo64dwutoq6uPz
 z4RAmqjTa5+V2c5Mu7+Rp1cTkmiPxeFRVNeWVg958zZ61rmMGGZkR6Br9
 vq0Z4AHVm3/KI6DsxX/p/KyDk2VVO6Czik+npmliqBmOiOzeCxC9B2OFt
 QPThgZrWu06tYvuRGhjE2CCf6969V/xzNwFmw0uVrFdDI3p0mmxavHMlm
 83cm7hbgLUamrRfK4RrWsjEOuJEJvRW6qnnpxB+h/wljPrtm0B0GjNFUx
 Atfx9Ix2Recy9mGr4MTooVDXVc9CkrdAeYfUj+VL/9xdhEhHFONVWFiOk Q==;
X-CSE-ConnectionGUID: FP47qR7hT9isd3Z016CRyw==
X-CSE-MsgGUID: bBxCQz7JTHylstDuZl8Wmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="89427422"
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="89427422"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 07:57:24 -0800
X-CSE-ConnectionGUID: /J5oSpJeRe6SPd2M6XBKPA==
X-CSE-MsgGUID: Hku/84e+TumcVK0AgPbRZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,246,1758610800"; d="scan'208";a="225401928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 07:57:24 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 07:57:23 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 07:57:23 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.23) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 07:57:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4jT5Rb+MZUBVGNqOWcOPPd3WOxVUS9yZgfdGdhNfY3/8/SVcDPWwCEL68dwkYXJNV9rNVdYcczz6dzWCHjXAnYtpIOegPnZ0GRrdLCHRElFMz1+b0DpnuEgqxaQ2m/wU6NqDgTiTN0VRig2iWqGIiIOn/ViEPYDU9WprouJESnhIPVcPy2gJaiL+hjA56SLpIPuVBRFjbC6k1EVO1q3Mg6ie8o7IoniHxoBmOMoMIY4rVwuLLrIdahsXsa5TTEXvm2lxnNWT2KxG8E0R4inAe3wZ4jn02ZChENnM5MybA8yTPvWKZCLdLr9RYuNgxLPXhiORA9KsvBODIOdoU7QiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UUUSE/jKQ+gb+qyv3m8RhVvasIJ/C7okDQ1wXiHYPL8=;
 b=ejNlDEsiC/+WoIGXwz4ZYDEKt5zjxdfrPoQNNT8kLWQydAOWnQ9NkUyyN/b5XCDyQ8dtcG0G/LlAFZr7SI+iAD1JtpH0l4ncfSybnNVEpZY/VO6rr11PKmkhTrhkxEYeEzczJRSStoaMoGuyoSYRRgwMKNqBDyuvaMP2raPoqJ6WcpsHM/x1bPY29/ORaR0Evhsw2pz6xCtMRM8Y1RG1B19JhjQbloQ0uS/pTOqTyMDuhKXfP6Se4/INx65aNOsBFCpITV9M69hR6sTYafZ3G8FaeD1+yGas7ZNmALM6HnkMUCT9s/dY9zzAYawgPFNZYHA1+6MihaYPv+KT6TDVAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH8PR11MB6976.namprd11.prod.outlook.com (2603:10b6:510:223::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 15:57:20 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 15:57:20 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH v10 09/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 conflicting madvise test
Thread-Topic: [PATCH v10 09/10] tests/intel/xe_multigpu_svm: Add SVM multi-GPU
 conflicting madvise test
Thread-Index: AQHcY6S5IgnYiEkYFkSYMWnJdDvwxrUQE7iA
Date: Wed, 3 Dec 2025 15:57:20 +0000
Message-ID: <48b3f1b62bb3159c9eba2c189f11ec8a62757435.camel@intel.com>
References: <20251202155951.21369-1-nishit.sharma@intel.com>
 <20251202155951.21369-10-nishit.sharma@intel.com>
In-Reply-To: <20251202155951.21369-10-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH8PR11MB6976:EE_
x-ms-office365-filtering-correlation-id: d158d153-bc60-4259-2271-08de3284a41a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?NHFTSWE0VWFVeHhDWjhhSk5GZFc4cy9DUTdvakd4RHBHWU5ZcjZFc0RIUW90?=
 =?utf-8?B?R2hsN3cvVnNsNGVwUnN4NG8wdUlnbEM1V2tLYmZaRjdDTXBqTE9OWjZER2p5?=
 =?utf-8?B?WVJKVlUrT0c4cTl1SmRUMGFwSUd6OE5PSUloRG43NEc4MVpBSE1RaUlSWnQ2?=
 =?utf-8?B?bEJNeEJhQ1lIMnV0SVRwK1dtRUVJcmpUdWx5NzBoRTlPR3VNbFhrbDlCck1K?=
 =?utf-8?B?Wk9yTGUxWW9Ca2ZmUm1MYldZbWJIWE9zajZTd3E4bUVwMXNNSkNFNG8zVWxx?=
 =?utf-8?B?bEdiM3JiRVozZWRhNEJMTndLSlAzZDY0WnRSbGpNc3BOZ2xjbGhCUUdQWFd5?=
 =?utf-8?B?eUlsMTZzUzJxczBSRXEwaERiM0ROS0xGZGNVaUhBb2tMZUpQQXpjSHF1MUM4?=
 =?utf-8?B?dzVLT0JDTWkxZEVsWU40ZHlzRkhORkJHa3hYTnVEbUlVM09CVGd1OVlqTnUw?=
 =?utf-8?B?amtyZXVnelljOVcxd29OWjcxRkQ3RlV3bFFsK0pta3ZBcUdBQUNGMDJWNmZZ?=
 =?utf-8?B?b05WUzBiUU00Z0MrQlZJWUtCMTdDTGxtV3hBMEVZb1FjS1pCZ1hpWDMzckdT?=
 =?utf-8?B?TENaSG1nYnUrVnBLQTA2QjFRcUpRcS9lbEROKzNFSGF0OHBLT0pibFc4MzE0?=
 =?utf-8?B?aEw1MHorblNqM0gyaVE0dzAzQVhTYjQ4bEMyQ01oNzV1MTdPRFpnRnU0MW1M?=
 =?utf-8?B?R25HMEZNM2JtcWtQdG9HS0VDNjBSLzZCZ3NtazJQZ2N0M29PSlZrTGltL3pM?=
 =?utf-8?B?QjN6SS85bmcwVjZMd2JjdTcxYWNwMEZTb0t2OWpMcG5PRkpDUUt0UUVBWVNt?=
 =?utf-8?B?WFlvdlVJZFJCbkNBaWRMQ3AyaHdCVnFGbWt5NkVSWkY5d1NNSlZWdGZXR0Zl?=
 =?utf-8?B?RFNXMHVQbzlZcmhwNXJSeDFna3pMMkFIWEdSc2FqMXRLbVI1bmxpNHpVQlVt?=
 =?utf-8?B?bERSa2JxOGttcTl0WDF0Zm9yL0ltcEJkR2hHVURKbzJiUkY2MGpBM2k0U2FO?=
 =?utf-8?B?a0tBbmZ0TkR3V1M3SjVXVjNZajJ3VHpCcXpyWjBDMmovMGNRRUtTQ1kzYk12?=
 =?utf-8?B?bmpHSS9SZEg4LzZXelRzNkpJTnhEbnVWQWFtOGJmR1ZRL0k1U1B0OXpIdks5?=
 =?utf-8?B?cXZwcmlzT2xNbTRRU0xjNmlTU0FFdlJIQXpZU1IvU0dPVXNHbVJ5QkwxSjVU?=
 =?utf-8?B?Mnp2MnJ0eDU3eUViWnpad3lyRkdVWC8wQ0V6OUs5Vm1HYURtQ3ZkR2hpRm0r?=
 =?utf-8?B?d2w0UWkrOGdkb0JUTlkxU0wrdDE2Zjl5VXlORVB0VE9Jd1l2T1ZvY0o5WmI0?=
 =?utf-8?B?Kzk2UXlIRmZEcDJ6RjdtMExpcGZXVXZ4QlFSbzB3VUt0MFhBZnAzeHRhNDlV?=
 =?utf-8?B?N3h0dUc5dytUam9VUG53YzUvYnQrYzk0TDQyUHprMmJwbWFrbEZVbnlxbmVP?=
 =?utf-8?B?Tko3dG9EZFE3RnV0bEliZUdwRmdBMTUzY01XM1BNM1ZjbkNvRnhvN0Q4bDVr?=
 =?utf-8?B?eUF1cXNLS0NUd1ZsWm5lYnM0NlJpekg5bVdyOExJMlFoRFJqYjB1My9hU3Qz?=
 =?utf-8?B?ME9GMVVQOXBhcmJlZHdtSmtRTktaODVwYm9BZ3paajZza3hjNmlHZlkvbTFW?=
 =?utf-8?B?T1NJdmdvb0p2RmVTQUo3TUg1YmJVTGRscU9OcWpMU3FvRmk1QWVhV08yS2NE?=
 =?utf-8?B?WWovbDIyM1hpMDBXN2RVZENjV09FRHlSQUVYQzhXVXYwR3poQlFDNHdjdkd3?=
 =?utf-8?B?dW5FcGVrRXc1dkNpdWdvZVNTdnJEM1g4OHJ3REJTVC9TT2RnWFRDUTJ5TitE?=
 =?utf-8?B?ZXZUS2UxcTVIZEpyUXZwei9tRmxPZUxkNy9HMmoxdXUrbzZvNFFUd3A2c2dz?=
 =?utf-8?B?TUlOdkFoY0RNTjhhdmpzQXF4bEQ5OHQ2NzlETjBhay8rYVlkU3NHQWFncG9S?=
 =?utf-8?B?VlF0UldSZ1FhUnZHWDZUTkJWQVhQK0gzZlRxY3hRU2RsNGJQZ0ZyWkU3dy9t?=
 =?utf-8?B?U3dlU2czUjdwYVl4dmt2Mm9rckZkMUhyZmx4SDFKbjQ4V2dPSmZQcTRVS1Bv?=
 =?utf-8?Q?vmO2g0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NENVcm5tQUVtTW9tdW9Fd0NHT3YxQ3RlWllUaFNVR3pPUml0Nm9HVldSN0Rh?=
 =?utf-8?B?bXkxTzMxNDhlVzRmb29za2t0ODZtNzRKNExDUU55UTVhTkplaE9RSkxOK0pX?=
 =?utf-8?B?RjdUbDkySmtiN2RRd244YlY5RXMxeWZPRXpHTllKN0daaXpNbS82NGhQbktm?=
 =?utf-8?B?elRTUFRTeTBQbms3UFZKOFdBakNESEtLcUY2Z3F0eFlyWVlacUJUaWNFNkR5?=
 =?utf-8?B?bXBGMklQQXYyMnh6Tkd3clRwVkc0dWxBQzRRY0RQQVZSSmdvWUlqVjFKbTJT?=
 =?utf-8?B?c0ZZSnFua0pVU1R2VUdpbjdWZWdwb2xmK3YxTWJ2M0NmY09OWXViV0RNbXFw?=
 =?utf-8?B?YWNUZjJlTS9VanJBY0hWcnFXazcwTXRzaWtBWlI4UnM2VVhtUy95WExWNUt3?=
 =?utf-8?B?cjQ3MCtZenZyUTU4azZMRFAwZUlmS0NXRFQ3R3NnKzg4LzdyQVMzNFZzVnpM?=
 =?utf-8?B?M3BLWmJ1MG1IbzZJY0NVdXA0VHo0dHV5a3pWaXNYUEswd2l5NUFtY09hNnFU?=
 =?utf-8?B?NXl4Zyt3UHNsbUppbEp6alpCVTJheUhKRGZnMXJUSjcvNDRTRk0yd2JSbTRY?=
 =?utf-8?B?OUJvckxMbmdhc1RtdFVmVFhvcEF0VC8rSmNCZDVuZkVSN2J3UnprTDQ1NjN5?=
 =?utf-8?B?aktzaGQ2RGJhMG53VlFsVHZocW10NHRnQVVLdlN4TkhWY0pvUkN1VkQxNm1X?=
 =?utf-8?B?VVlua1VCSHVWNkZSNWFiRE9mWnQ0cWU5VUVHUElmNmxueEQrcEUyQm54MWI0?=
 =?utf-8?B?K1lwL2RaWEdVdVpvV0NXbVhaMjAyMVBJUm1MWG9ZV0tzK0pqK2VhcHJvSy9Z?=
 =?utf-8?B?cHFYemRvdHJ4cEJTLytWampyZDdqMkFzaVYxZ0dxbXh6cWYyT2prVXZZNVRH?=
 =?utf-8?B?eGM1eVNRUUtncDZYR2wvaGFhZk1KTXYwSHJDbUNrUWZxcXNPWjUyS09HbE9U?=
 =?utf-8?B?N3VucHloa05IOHFLZldJazJZR0RvQVA3QVNHM25nVjBzVzJwVHVkRHBXa2ZJ?=
 =?utf-8?B?WFY1VEYvRGVPSndVWHMwdzNjdm1ISWFUT3JjZ1o0SityRVZtYUc5R1cyY3NF?=
 =?utf-8?B?aGI5ejFCN3hJWm9GTEFsbFRYbkFWaDBFU2FNQzB3aFJpNUE5a1paTXhCRHd4?=
 =?utf-8?B?SXpyMkJpTUJsUlhEZEUvNVRNMW0ybC9kSUZOWWM5OW43dU1ocjZjaHdmcFdk?=
 =?utf-8?B?SHY1cGZ1ZTVaeW51cTd0ZGREN0tsdlArOHEwQWp0M0RRVUc5SUU5ZnBWQVFy?=
 =?utf-8?B?aWlUMkQ5QlBWOGtQb2U5QVJBSkxqOUJtSStSeml2ZkEzOE5Idk1ISjc5SXJt?=
 =?utf-8?B?Ym5ZVGJTWHpDMlI4Y28rMFUvSjR5YlM1UGFQZERJYXNaUGVYbmhvTG1QdnlQ?=
 =?utf-8?B?enc0d3R4UUxENmRSRCtDWWhPRnh6cFZDYWd2M3ZYbzRCa0x4QXlDRTBPVHM1?=
 =?utf-8?B?cGp5RFhNVHlCVnZ3YkVrZ0NHYVk4TXdzdDEzTTZZYTdkeFhRelBPbFFBbDNw?=
 =?utf-8?B?L2h3ek1Kb0Z2VzkvQ0hBY1B2NEIreVdWNytDTjJ2K05lYXRCL1ZTVUhqYkR6?=
 =?utf-8?B?dFBpZHNIN21TQU9QZnJjbGpickdkTzB3TzFWRkhBdmRzN3ZvUG1TVUdqR3FO?=
 =?utf-8?B?K1luQ25ZSXU5dnVhbWVqYVhKdHdjTllYTlhuN29qSERUZFdKQVkvT3BQQmx3?=
 =?utf-8?B?a0EwMDhnNmNlRjVFK09vcnc3UUdtNEZVQnJpVzIwZ3Y5Wkk2dXdtTXhXZW00?=
 =?utf-8?B?N29WNW5LbUFCSWZHQlFVVG1GVm9VTzZQcWVBYld4Wml3VTZCMkpJRnZ1TnR2?=
 =?utf-8?B?Ymx1ZWQvbW55UlVLTERmbnBGTVZvek9RZjdFVzd2dnBPdVdNVDNDblpkQXhi?=
 =?utf-8?B?RzFCZmpEN1ZjZFVDd1JJMDZPYjBTN09yZjY1eWVqd1dqWjRTZCtBQlRtTFhn?=
 =?utf-8?B?bzcvc2lOQnZ1eEVoUnBrdkMxUFdwSGkzeDlmWU1EUC9HNlNlcjR3cUJBRWxN?=
 =?utf-8?B?Y1M1RzRlN0tNREZXYzQwTEJ5RXZIcitKdytlc0FyYWU3bWtFbXpTd09vTGk1?=
 =?utf-8?B?RDFMb0Z3bnl3ZDBoL2JURjFpZjdpSEM5TjBPSXdZVEtzcFIvV0FqYmdORWxa?=
 =?utf-8?B?WDB3aFB0S3dzNG42UkpITHZEbGM4ZmMrb1p5SGo3RWdhWnhwVE83WS9ROSsr?=
 =?utf-8?Q?u44ZMZs+0LW/q8o1qJY4NT9ittHP5MYaw+mtBt8GxHCY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C870EDCF2029543B0E2225E71447F56@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d158d153-bc60-4259-2271-08de3284a41a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 15:57:20.2825 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u5Q+HoAy0uSqkCW1s6tbI5Q72VYeyjCoiie9BdGDAoI4Az3XkY4B1lkRp95iNJwBt5JZThVJLBd8+RjI6eHeyFviLoDi5AqLulzfKG18upA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6976
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

SGksIE5pc2hpdA0KDQpPbiBUdWUsIDIwMjUtMTItMDIgYXQgMTU6NTkgKzAwMDAsIG5pc2hpdC5z
aGFybWFAaW50ZWwuY29tIHdyb3RlOg0KPiBGcm9tOiBOaXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hh
cm1hQGludGVsLmNvbT4NCj4gDQo+IFRoaXMgdGVzdCBjYWxscyBtYWR2aXNlIG9wZXJhdGlvbnMg
b24gR1BVMCB3aXRoIHRoZSBwcmVmZXJyZWQNCj4gbG9jYXRpb24gc2V0DQo+IHRvIEdQVTEgYW5k
IHZpY2UgdmVyc2EuIEl0IHJlcG9ydHMgY29uZmxpY3RzIHdoZW4gY29uZmxpY3RpbmcgbWVtb3J5
DQo+IGFkdmljZQ0KPiBpcyBnaXZlbiBmb3Igc2hhcmVkIFNWTSBidWZmZXJzIGluIGEgbXVsdGkt
R1BVIGVudmlyb25tZW50Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlz
aGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IFJldmlld2VkLWJ5OiBQcmF2YWxpa2EgR3VycmFtIDxw
cmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMvaW50ZWwveGVfbXVs
dGlncHVfc3ZtLmMgfCAxNTcgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0NCj4gLS0N
Cj4gwqAxIGZpbGUgY2hhbmdlZCwgMTE2IGluc2VydGlvbnMoKyksIDQxIGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX211bHRpZ3B1X3N2bS5jDQo+IGIvdGVz
dHMvaW50ZWwveGVfbXVsdGlncHVfc3ZtLmMNCj4gaW5kZXggY2NmMDViMDVjLi5lNDEyYmJmM2Mg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX211bHRpZ3B1X3N2bS5jDQo+ICsrKyBiL3Rl
c3RzL2ludGVsL3hlX211bHRpZ3B1X3N2bS5jDQo+IEBAIC0xMTMsNiArMTEzLDE5IEBADQo+IMKg
ICoJVGVzdCBjb25jdXJyZW50IGF0b21pYyBtZW1vcnkgb3BlcmF0aW9ucyB3aXRoIHByZWZldGNo
IHdoZXJlDQo+IMKgICoJbXVsdGlwbGUgR1BVcyBzaW11bHRhbmVvdXNseSBhY2Nlc3Mgc2hhcmVk
IG1lbW9yeSB0bw0KPiB2YWxpZGF0ZQ0KPiDCoCAqCWNvaGVyZW5jeSB3aXRoIG1lbW9yeSBtaWdy
YXRpb24gYW5kIGxvY2FsIFZSQU0gYWNjZXNzDQo+ICsgKg0KPiArICogU1VCVEVTVDogbWdwdS1h
dG9taWMtb3AtY29uZmxpY3QNCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICoJTXVsdGktR1BVIGF0
b21pYyBvcGVyYXRpb24gd2l0aCBjb25mbGljdGluZyBtYWR2aXNlIHJlZ2lvbnMNCj4gKyAqDQo+
ICsgKiBTVUJURVNUOiBtZ3B1LWNvaGVyZW5jeS1jb25mbGljdA0KPiArICogRGVzY3JpcHRpb246
DQo+ICsgKglNdWx0aS1HUFUgY29oZXJlbmN5IHRlc3Qgd2l0aCBjb25mbGljdGluZyBtYWR2aXNl
IHJlZ2lvbnMNCj4gKyAqDQo+ICsgKiBTVUJURVNUOiBtZ3B1LXBhZ2VmYXVsdC1jb25mbGljdA0K
PiArICogRGVzY3JpcHRpb246DQo+ICsgKglNdWx0aS1HUFUgcGFnZSBmYXVsdCB0ZXN0IHdpdGgg
Y29uZmxpY3RpbmcgbWFkdmlzZSByZWdpb25zDQo+ICsgKg0KPiDCoCAqLw0KPiDCoA0KPiDCoCNk
ZWZpbmUgTUFYX1hFX1JFR0lPTlMJOA0KPiBAQCAtMTI2LDYgKzEzOSw5IEBADQo+IMKgI2RlZmlu
ZSBCQVRDSF9WQUxVRQk2MA0KPiDCoCNkZWZpbmUgTlVNX0lURVIJMjAwDQo+IMKgDQo+ICsjZGVm
aW5lIFVTRVJfRkVOQ0VfVkFMVUXCoMKgwqDCoMKgwqDCoCAweGRlYWRiZWVmZGVhZGJlZWZ1bGwN
Cj4gKyNkZWZpbmUgRklWRV9TRUPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKDVMTCAq
IE5TRUNfUEVSX1NFQykNCj4gKw0KPiDCoCNkZWZpbmUgTVVMVElHUFVfUFJFRkVUQ0gJCUJJVCgx
KQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfWEdQVV9BQ0NFU1MJCUJJVCgyKQ0KPiDCoCNkZWZpbmUg
TVVMVElHUFVfQVRPTUlDX09QCQlCSVQoMykNCj4gQEAgLTEzNSw2ICsxNTEsNyBAQA0KPiDCoCNk
ZWZpbmUgTVVMVElHUFVfUEVSRl9SRU1fQ09QWQkJQklUKDcpDQo+IMKgI2RlZmluZSBNVUxUSUdQ
VV9QRkFVTFRfT1AJCUJJVCg4KQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfQ09OQ19BQ0NFU1MJCUJJ
VCg5KQ0KPiArI2RlZmluZSBNVUxUSUdQVV9DT05GTElDVAkJQklUKDEwKQ0KPiDCoA0KPiDCoCNk
ZWZpbmUgSU5JVAkyDQo+IMKgI2RlZmluZSBTVE9SRQkzDQo+IEBAIC00ODAsMTUgKzQ5NywyMiBA
QCBzdG9yZV9kd29yZF9iYXRjaF9pbml0XzFrKGludCBmZCwgdWludDMyX3Qgdm0sDQo+IHVpbnQ2
NF90IHNyY19hZGRyLA0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgdm9pZA0KPiAtZ3B1X21hZHZp
c2VfZXhlY19zeW5jKHN0cnVjdCB4ZV9zdm1fZ3B1X2luZm8gKmdwdSwgdWludDMyX3Qgdm0sDQo+
IHVpbnQzMl90IGV4ZWNfcXVldWUsDQo+ICtncHVfbWFkdmlzZV9leGVjX3N5bmMoc3RydWN0IHhl
X3N2bV9ncHVfaW5mbyAqZ3B1LCBzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9pbmZvICp4Z3B1LA0KPiAr
CQnCoMKgwqDCoMKgIHVpbnQzMl90IHZtLCB1aW50MzJfdCBleGVjX3F1ZXVlLA0KPiDCoAkJwqDC
oMKgwqDCoCB1aW50NjRfdCBkc3RfYWRkciwgdWludDY0X3QgKmJhdGNoX2FkZHIsDQo+IHVuc2ln
bmVkIGludCBmbGFncykNCj4gwqB7DQo+IMKgCXN0cnVjdCBkcm1feGVfc3luYyBzeW5jID0ge307
DQo+IMKgCXVpbnQ2NF90ICpzeW5jX2FkZHI7DQo+IMKgDQo+IC0JeGVfbXVsdGlncHVfbWFkdmlz
ZShncHUtPmZkLCB2bSwgZHN0X2FkZHIsIFNaXzRLLCAwLA0KPiAtCQkJwqDCoMKgIERSTV9YRV9N
RU1fUkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DLA0KPiAtCQkJwqDCoMKgIGdwdS0+ZmQsIDAsIGdw
dS0+dnJhbV9yZWdpb25zWzBdLA0KPiBleGVjX3F1ZXVlKTsNCg0KWzFdDQoNCj4gKwlpZiAoZmxh
Z3MgJiBNVUxUSUdQVV9DT05GTElDVCkgew0KPiArCQl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdS0+
ZmQsIHZtLCBkc3RfYWRkciwgU1pfNEssIDAsDQo+ICsJCQkJwqDCoMKgDQo+IERSTV9YRV9NRU1f
UkFOR0VfQVRUUl9QUkVGRVJSRURfTE9DLA0KPiArCQkJCcKgwqDCoCB4Z3B1LT5mZCwgMCwgeGdw
dS0NCj4gPnZyYW1fcmVnaW9uc1swXSwgZXhlY19xdWV1ZSk7DQo+ICsJfSBlbHNlIHsNCj4gKwkJ
eGVfbXVsdGlncHVfbWFkdmlzZShncHUtPmZkLCB2bSwgZHN0X2FkZHIsIFNaXzRLLCAwLA0KPiAr
CQkJCcKgwqDCoA0KPiBEUk1fWEVfTUVNX1JBTkdFX0FUVFJfUFJFRkVSUkVEX0xPQywNCj4gKwkJ
CQnCoMKgwqAgZ3B1LT5mZCwgMCwgZ3B1LQ0KPiA+dnJhbV9yZWdpb25zWzBdLCBleGVjX3F1ZXVl
KTsNCj4gKwl9DQo+IMKgDQo+IMKgCXNldHVwX3N5bmMoJnN5bmMsICZzeW5jX2FkZHIsIEJJTkRf
U1lOQ19WQUwpOw0KPiDCoAl4ZV9tdWx0aWdwdV9wcmVmZXRjaChncHUtPmZkLCB2bSwgZHN0X2Fk
ZHIsIFNaXzRLLCAmc3luYywNCj4gQEAgLTY0MCwzOCArNjY0LDcwIEBAIGF0b21pY19pbmNfb3Ao
c3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gwqAJCQkgJmJhdGNoX2JvWzBdLCAmYmF0
Y2hfYWRkclswXSwgZmxhZ3MsDQo+IEFUT01JQyk7DQo+IMKgDQo+IMKgCS8qR1BVMTogTWFkdmlz
ZSBhbmQgUHJlZmV0Y2ggT3BzICovDQo+IC0JZ3B1X21hZHZpc2VfZXhlY19zeW5jKGdwdTEsIHZt
WzBdLCBleGVjX3F1ZXVlWzBdLCBhZGRyLA0KPiAmYmF0Y2hfYWRkclswXSwgZmxhZ3MpOw0KPiAr
CWdwdV9tYWR2aXNlX2V4ZWNfc3luYyhncHUxLCBncHUyLCB2bVswXSwgZXhlY19xdWV1ZVswXSwN
Cj4gYWRkciwgJmJhdGNoX2FkZHJbMF0sIGZsYWdzKTsNCj4gwqANCj4gLQkvKiBHUFUyIC0tPiBj
b3B5IGZyb20gR1BVMSAqLw0KPiAtCWdwdV9iYXRjaF9jcmVhdGUoZ3B1Miwgdm1bMV0sIGV4ZWNf
cXVldWVbMV0sIGFkZHIsDQo+IHRvX3VzZXJfcG9pbnRlcihjb3B5X2RzdCksDQo+IC0JCQkgJmJh
dGNoX2JvWzFdLCAmYmF0Y2hfYWRkclsxXSwgZmxhZ3MsIElOSVQpOw0KPiArCWlmIChmbGFncyAm
IE1VTFRJR1BVX0NPTkZMSUNUKSB7DQo+ICsJCS8qIEdQVTI6IEF0b21pYyBCYXRjaCBjcmVhdGUg
Ki8NCj4gKwkJZ3B1X2JhdGNoX2NyZWF0ZShncHUyLCB2bVsxXSwgZXhlY19xdWV1ZVsxXSwgYWRk
ciwNCj4gMCwNCj4gKwkJCQkgJmJhdGNoX2JvWzFdLCAmYmF0Y2hfYWRkclsxXSwNCj4gZmxhZ3Ms
IEFUT01JQyk7DQoNCldoeSBhcmUgd2UgdXNpbmcgYSBkaWZmZXJlbnQgYmF0Y2ggdHlwZSBhbmQg
ZGlmZmVyZW50IGNvZGUtcGF0aHMgaGVyZT8NCklzbid0IGl0IHN1ZmZpY2llbnQgdG8gaGF2ZSB0
aGUgYWJvdmUgY29kZSBbMV0gb25seSwgYW5kIHRoZW4gbGV0IHRoZQ0KdGVzdHMgdGhlbXNlbHZl
cyBiZSB1bmNoYW5nZWQ/DQoNCi9UaG9tYXMNCg0KDQo=
