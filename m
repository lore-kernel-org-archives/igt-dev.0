Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A2CCEACEF
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 13:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75FF10E092;
	Mon, 17 Nov 2025 13:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DeHWPCpa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006E10E092
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 13:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763385074; x=1794921074;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YFQ5BJw88+EGruIu+1GCSAbVT1Yo3HlQoTluK6ixrbs=;
 b=DeHWPCpaE4cOKAH5Pg27tLUSaFrnYjnzATIyok2VsAQ+wXpUsT2TnwTU
 ci4b5R5xPE9CuYgqJrXATc3PiUutXhnsIJx256nohl9dZW9QwSx51TUB8
 mlLj9tr0pxb6InFeuup6MXGnUERCKKbZiJrQY5Lc0EIgO5tAMCNbXkDaQ
 VSTMHYzYPsWoFcGHEcXv8tpfV0kjGsQ0R+IoDs9XyR3JyDuhqo9RvDpJE
 8iHPOw51CL6r5C0FP/9t+tvDBoD2WnemctnWAo9cqRivSsidazLyWzZoT
 +O20e/0DqK7dUu58A22k3FKF8c1VZa3VRcWt7+kz7ILOYSOU28bYAvrtU A==;
X-CSE-ConnectionGUID: ioXEjUcYTXCoKGXd92eHLw==
X-CSE-MsgGUID: 0cpifpm8QvK7rLQFm9s2FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82771757"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="82771757"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:11:13 -0800
X-CSE-ConnectionGUID: KUGSZrJmTJK/ySyMsLStKw==
X-CSE-MsgGUID: Gq72f4UiQ5W2HGnkr9J1QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; d="scan'208";a="227778399"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 05:11:14 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:11:12 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 05:11:12 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.51) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 05:11:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mUtecuqEeIMcCj72jsUGgUEteR9EcfsjF+gRXdxAFroqEBqYUsOemf/j0OyRlG2ursWPm1h2qkdfTBowcO1MRbSSj8BjOPqWEHJk1aqU0pGTxmOop48VAjRQOenQOQtiZCVtlEUZpk8cA+PSIH1nQsvG3dnOAA5fFuILT/m9HXd7NpQnyhbYz+UTHxcJR9wzbxbqHO6KkJ7R6cdCEFDttKo4J+ESETMOsqHSLpJsdZ/qPxF5bXNSXdBydO7cMHMT17zHo3u8iKap7opzdzvaC0RaWr0XqsTUlMblfUHEgDv8kp2kORoJulJFgPxLEmBd8aOrAsYp3nduCp2TuyyCNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YFQ5BJw88+EGruIu+1GCSAbVT1Yo3HlQoTluK6ixrbs=;
 b=KVQOvGREICoRptGVWkmrWEXcG/IRyjeMLnI2C3eAkH7sl9TEmwP+cz92OmqinaFtuuz1rQSej8re+uaym0PWCd2vZHFxcS48rHqV3kqgYgwh55tiMdhNSqUH2vDw+k/rMK3lNM5tVM4mAmx5b/i/dWNnv2zdAQToIa9JJ0CdDjPZspVO2spr7/UVhKo0CbQQsSJj5+8SE1471+/8DYRZvWojn0II520SMkVfCrG6CqUqWbTAVqAi+p37P4RSS5xx7Bx805hXky/YAxvYy2Hkrl6mGWiZR7M+Q/5O73QtWTLqcoRyF0vXMlcVK4cM1h46yGztLpBPamCnEuZHjvtW7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 13:10:58 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9320.013; Mon, 17 Nov 2025
 13:10:58 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Topic: [PATCH i-g-t v7 04/10] tests/intel/xe_multi_gpusvm.c: Add SVM
 multi-GPU atomic operations
Thread-Index: AQHcVLs7d04AjjZKqUms0yzRxyJeu7T23cKA
Date: Mon, 17 Nov 2025 13:10:58 +0000
Message-ID: <556b427ab266daec61e90f9f6db863dc5d19a279.camel@intel.com>
References: <20251113163308.633818-1-nishit.sharma@intel.com>
 <20251113163308.633818-5-nishit.sharma@intel.com>
In-Reply-To: <20251113163308.633818-5-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|LV2PR11MB5998:EE_
x-ms-office365-filtering-correlation-id: 27cc7ae0-dac6-4e10-b69a-08de25dabfaa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?QjBXTUpTUGxaRXRGai9OS2RxRDdzRnhnaEd1NEc1ZGVDU2hoVlZKOGxpRlht?=
 =?utf-8?B?bS9Tc1huZXhrR2VycG4wVDZ3K3lJV2RSQVFVZytOSlk1L1VpVURNOWU4OWli?=
 =?utf-8?B?SDRVb0JXcEgyTkhyWVJjeTNMdkxSWmpWeHJ3UEFwRkhGL2Z4N0pNMVhObXZO?=
 =?utf-8?B?R0FuMDFzdDlGNlFSV3RnMkZHZTlSbDFOUk0rTWZ4dnZQUnZpRFFhbjl6VUM4?=
 =?utf-8?B?d3RSQ3VjbktQODA3OGkrREF4QzJONEtaWDFqQklXaVM3a2pYZytzL2tLaldP?=
 =?utf-8?B?eWFOZWFUL1lsK3ZjK3JBMkdIN0VOQmljcHFCeU82TVE1a0VFZXlwdmNuZXBD?=
 =?utf-8?B?K3dvUmU0TDI2bmxLZUVVUUdIT2lzcldFVlIvMnpGTERkT1BnZ0J4UThLWWZl?=
 =?utf-8?B?dEF4Q2phaHZ2MVBGSW5LbWJLSGxJNFZXVzY1SldUTDFHelJ2cDYyc1FEc0tN?=
 =?utf-8?B?NHBmN2J5enRNeWxRZHdWZFdScGxxQTQ0QmY1UHBzRDVxcnJ0ZnRLQWxHZ0Mr?=
 =?utf-8?B?elpsQjFKVWlKZ2FWdDM0cFh2M0gzR0NvblpNSmsrVHNacFRIektUMTl1K212?=
 =?utf-8?B?NzlBTkoxUFBncE9BcG1hV2I4WE0zVVlWUWlwaWE1cGNtY0pOalFpRmJNamRq?=
 =?utf-8?B?eFdycS9FbmRFeXZpc1Q3SEpUenpjQmgra0N4b1ZQWUJxRDJOSkpIQ0ljR0tI?=
 =?utf-8?B?QjhYakxMMDJjcHZ6QkEyajNXcUpZMmVMWVhKZHJ5dFVMd0xCb1FHY2Z2UFNP?=
 =?utf-8?B?UU0wSnBQdFFUWjdpNzMzSE9JcER2NExtVE9ON1dqNXFCeGpjV2hTdVFXZ1ZE?=
 =?utf-8?B?bFAwNit2VVpHOWFKai9NY2xMV3RBNGZZZXpXUzRPWnJPS0F6NXZ3U2R4b3E4?=
 =?utf-8?B?bHl2WFZVRnRBazRZQVdtc0g1My83YXNVeTA3elZrYW9VMGtXakMydTA1RFZS?=
 =?utf-8?B?RWlsZUdtcGVJS01yRnJ2eHoyaDZReVpQMHNFOXpRTkt0ekwrbjArTGdxVktl?=
 =?utf-8?B?Smt2NHpsUzhvQ0dpUEtlR2EyTGY3blc5V1pMcTRRRCs5Z2dsbkRNMlRVbGFV?=
 =?utf-8?B?NHNUNmF0dUN4MGVlTjQvdk5xZW9mTFlqTS9EUXhyVndramNaTVhsLzFOcjZQ?=
 =?utf-8?B?ZWdFVHk3Mm9Rc0hWNGFVSzNsTll4SHRvQk9LbU9EYzNZNzFMSEU1NVRYT1Zw?=
 =?utf-8?B?dXVhRXY3QlMyaS9PWktNdG9YZEFSZTFFOTBrWVBCN2VFNmE0QlplVWlmRU4v?=
 =?utf-8?B?SGs0Z3lnbkVvTlhUZWFBelRhWC92cURKWUE0MEhZRmNnOW5zVjBlbGwwRWdE?=
 =?utf-8?B?SEUwWDEraEc5WER0TmQxR1IzV0t5Z3RQeVdjMTBuM01JUnpJazNIaDQwZXM3?=
 =?utf-8?B?OGhzQkR5TWZrVmtmTUhTTDhzcVc4dTN1VUZmQnNBTlVWbkhRVFEzcFo2MjQ4?=
 =?utf-8?B?VmU1Vnk1MzBHdS9lc2Rmbml4Z2ZSY3g4d0VNblp4UTRlaWdITGl2RUFXeWdY?=
 =?utf-8?B?RzgralNSeTllVm9PTE5xQml3S3lmbkJKSWVkNTJUQ3ZwSW9ZRVFzK3pxSzRp?=
 =?utf-8?B?Q094Qk9Jb2VTb3EyTzc3ZE9XN1NyMnJXMmM3Y1hEeFJYejBaN0gzOHBtVk8r?=
 =?utf-8?B?RXBrVVBwQVl5cUJ6L29kMEdzVkwwR3FwZVBPbGUzMU5oUkZVTzdBVGViSXVp?=
 =?utf-8?B?L0JXU2xpWmw4MnlGMUt5d1gzWEVTemkvclU3a2JmR1FGTk5FOU9hMVE0Tkx4?=
 =?utf-8?B?cUVSYU9hYUZTbGFINlFNQm1UeElyeUcvWHA2NVhPbGc3cVFGOGM4aVY2Myto?=
 =?utf-8?B?T0NMUGlESm9ONVdJUkJiZW5DNGUzWkdCVHhpajRwWGJaM1VUQnNMTXhYZE0r?=
 =?utf-8?B?ajdjQXJ3bU9VeEEvNEl1SUp5WlBZL0p2TkwwWndjOHd0aE4xcEQrLzM0OEVl?=
 =?utf-8?B?M1lCbDRRUkhsMmUxMTBKZ1VTcGQ0RENnbUtnckJiUTRlcHJyMXNqTUZmOHRR?=
 =?utf-8?B?eDE1U3BSTkJDcGM3eEpTcGM0RkhFYjJLMEZqeElpd3RVY3NDbEJVREpjOW1R?=
 =?utf-8?Q?z58F6w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWRUUmhEVUl3bmt0SUxsU256b0kwQVRIT2Z0ZkdtMGYvTHhxS2xMSld3b1dK?=
 =?utf-8?B?Q2V3QjJ0RXZMTCtMR2VyVWVqNHhmamQzOWxwQVYzNXNqZWpISDlFc1h5VDVv?=
 =?utf-8?B?eDlsazVBMk84RXMwTGZxODQyZ0xZRkxyYXd5ZlJibXpTUFd1N2NwMVFkVm9K?=
 =?utf-8?B?bWxlaTZyREhweWpJU0dQWXVCU3FzOTFrMzhJNXpFSkNpUEFKNyt2Vlh2Tnd4?=
 =?utf-8?B?RUtRUUdhZ2svaDJNRC9JUDhEMDdnT2RVYlpwWklkZU4yRUdQOThNZ3dLMXps?=
 =?utf-8?B?Y0o5cnlVQWxXanBPcTRYcGJZRktxMlpYQ0tiQ3ZsRDlmS1c5OW9jOVNrWDlh?=
 =?utf-8?B?OGNtNUljK21iMnZSbGVvdUtOQlhaYWlJSEFuOVo4VE02WlFnZ3NDdVNCMnZR?=
 =?utf-8?B?L0dNVXJzTTUzWW4vZEwzL2JaSUZMV2FNWmF0YlFJb1FMdnh0WGFNV2VSdFo2?=
 =?utf-8?B?WktwSHRkcjBhM09GM2laTU82bFBxREErVXY3RnZ3SWtZVDk5K0twVmNQLzRk?=
 =?utf-8?B?WEJiNkRFNElxMUtiWFh5VHpDWklvSHRVSVVwOVliNjRLSm9IZnpicVZtYU5w?=
 =?utf-8?B?QkRZM0FHV3hWQXd0aTE2QlBraElOMGJ4eWNLa25qQmlmdkNiMytaZ3J0SWg0?=
 =?utf-8?B?eFRGQzhTVGorZVQ2MHE3VUcrNllDUml4VWNFb2tMbkhGdkZkamFVZmk3WDhi?=
 =?utf-8?B?d1NIdHhhNGlPbCsxVXNiUS9aa21VTXplNHdMemZTQUNCQjk1SmtSRnpwM1c0?=
 =?utf-8?B?cmROU3Q1TlA3S2dtd0l3TmJQWlpTQzY3SXlQaGNQRHh2dXl1TE5TWWRxKzZx?=
 =?utf-8?B?S1dsTXhYZkM3WnZnOUNaUzhrVXcrajcrRVYzdmxOVlRqWEpMTmVYZVI1Mm9m?=
 =?utf-8?B?K3BkUWh1bnJlOEVZdWlSbWJvZjdYVGZwZmlTb3hsNFMwV3MzZEpra0k3SDJJ?=
 =?utf-8?B?YmN5TDIwczhRWkZzNDlBUmtpT1djOVExWnhibkN3MWNzRGlYN0dhUm1vbEVV?=
 =?utf-8?B?R3FIQlMveDVqQ1hjV0lyMWxsMFRtaVg4WTJxSjZNczYwSWZ3eUxNR3dHbEJs?=
 =?utf-8?B?eExIblZDNENETFpoR1pmWXVpSFg2WkVCaHlBemJvSlpFYVlFTmNiNTZOTTdz?=
 =?utf-8?B?NjJRRmc3RVBtdXVqdXZEVW9LbDJHZFZFMXg0UlRKNktUalB5ODlkbCtSVUJv?=
 =?utf-8?B?RjlmNWEybVZoWmFKcDd2eWE5enV2R2ZBODFlRFZpTGhPVjV4WjYwb3p4R2tl?=
 =?utf-8?B?b3NZMTFCS0J3ZmxiaGNOU0FNTmJRdHpTQitpM3lBdGRWWFdNZWU3SFY4MkdM?=
 =?utf-8?B?UWwwZEtLTDRBdUVmSVNSNFg3TlQ2bUl4dWFDQVUzT3BHa0JaQW1FR0VnSllk?=
 =?utf-8?B?eUtqcWhuT3NMM1RuOVVxVkRRcFJtWFJzYTVZaFNmMElSOC9RZTg0dVNoZmxN?=
 =?utf-8?B?SFYvREQ4VzNIalhVMVNLdlQyaWs3ZTFKMVZDZlJ0TVVpZlk5RTJKQ2NNdzZm?=
 =?utf-8?B?WHVkWlJzZmROc0F4WDBPWVFBajV0OE5MVGcrWkRtZHhKT1Q5ZDVRd1JQS0Na?=
 =?utf-8?B?WjhNTTNpV2FYMXFPL2ZOVnFGeHAzbmFlaW9ocVpUNWdKbHJ5Rk5LeE5WczhJ?=
 =?utf-8?B?YSs5OTBUNmdTTUlTRnk1RHc5VXIyTXZaTXdpbHRHMkFDRmxZMjRBaGdGQTE2?=
 =?utf-8?B?bWhhY3JJbHZvNGhyMHY5a3NqU01BbmNrZzByUUd2TVZLOWtBZm5kMG5kdUxp?=
 =?utf-8?B?bEF3SFVubVhiUXpvMWl0cWtVQXlaT0YyVFdNS1ltS0NYSzNCNzJ5Q3FyclNo?=
 =?utf-8?B?OTJWdDRQazViemltNjNsQkRja3dEYjZtZUt4SDVRS0RFcndJbkw5YXp5SkxJ?=
 =?utf-8?B?NFVLSEp2aXcxT3lGYVExWklKRTVKM0h6QmYyOWpMeTlYaWRNMXpldjRicTFw?=
 =?utf-8?B?RUFCdEh2cEgrUUwwelBRQ0FOZCtEL2wrZG9KSFAzS1pIU2xwZDlxaGphZFdK?=
 =?utf-8?B?S3lSRTRMekZ3TnNGZVN1NE5CbDNuWlNLV3ZQNmhHYmttSUJtcXpmdEM4Q0J1?=
 =?utf-8?B?dDlRRis0c0tsUDBodkZmTk5RVkhnL1J3Q1JWdjBPWitjYjFGS2V0cEM5YjdW?=
 =?utf-8?B?SWdNeTFLcFJsU3JhOGp1UmdCUFVmTFZjbDNkOXNSeFM4VTlicXlrbmFLelhP?=
 =?utf-8?Q?gOpBVv6arRQolX2BL7RvdKkRX/x62rIWq4E6FQGGe4V1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <15901730191B704E89F4BA5B53E1E77A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cc7ae0-dac6-4e10-b69a-08de25dabfaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 13:10:58.1574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Hmmdw1SC9MsswtaXiWSCtlCnX4Yhhzi7ROJaM2FFQLSklBavIzTF88CMs0IDkzXz3VSO8hzSQp3vkSyOIPYUlniYLX9HcB0qrsGyun9/gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

T24gVGh1LCAyMDI1LTExLTEzIGF0IDE2OjMzICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgcGVyZm9ybXMgYXRvbWljIGluY3JlbWVudCBvcGVyYXRpb24gb24g
YSBzaGFyZWQgU1ZNIGJ1ZmZlcg0KPiBmcm9tIGJvdGggR1BVcyBhbmQgdGhlIENQVSBpbiBhIG11
bHRpLUdQVSBlbnZpcm9ubWVudC4gSXQgdXNlcw0KPiBtYWR2aXNlDQo+IGFuZCBwcmVmZXRjaCB0
byBjb250cm9sIGJ1ZmZlciBwbGFjZW1lbnQgYW5kIHZlcmlmaWVzIGNvcnJlY3RuZXNzIGFuZA0K
PiBvcmRlcmluZyBvZiBhdG9taWMgdXBkYXRlcyBhY3Jvc3MgYWdlbnRzLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+DQo+IC0tLQ0K
PiDCoHRlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jIHwgMTU3DQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMTU2IGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9tdWx0
aV9ncHVzdm0uYw0KPiBiL3Rlc3RzL2ludGVsL3hlX211bHRpX2dwdXN2bS5jDQo+IGluZGV4IDY2
MTRlYTNkMS4uNTRlMDM2NzI0IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9tdWx0aV9n
cHVzdm0uYw0KPiArKysgYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBAQCAtMzEs
NiArMzEsMTEgQEANCj4gwqAgKsKgwqDCoMKgwqAgcmVnaW9uIGJvdGggcmVtb3RlbHkgYW5kIGxv
Y2FsbHkgYW5kIGNvcGllcyB0byBpdC4gUmVhZHMNCj4gYmFjayB0bw0KPiDCoCAqwqDCoMKgwqDC
oCBzeXN0ZW0gbWVtb3J5IGFuZCBjaGVja3MgdGhlIHJlc3VsdC4NCj4gwqAgKg0KPiArICogU1VC
VEVTVDogYXRvbWljLWluYy1ncHUtb3ANCj4gKyAqIERlc2NyaXB0aW9uOg0KPiArICrCoAlUaGlz
IHRlc3QgZG9lcyBhdG9taWMgb3BlcmF0aW9uIGluIG11bHRpLWdwdSBieSBleGVjdXRpbmcNCj4g
YXRvbWljDQo+ICsgKglvcGVyYXRpb24gb24gR1BVMSBhbmQgdGhlbiBhdG9taWMgb3BlcmF0aW9u
IG9uIEdQVTIgdXNpbmcNCj4gc2FtZQ0KPiArICoJYWRyZXNzDQo+IMKgICovDQo+IMKgDQo+IMKg
I2RlZmluZSBNQVhfWEVfUkVHSU9OUwk4DQo+IEBAIC00MCw2ICs0NSw3IEBADQo+IMKgI2RlZmlu
ZSBCSU5EX1NZTkNfVkFMIDB4Njg2ODY4DQo+IMKgI2RlZmluZSBFWEVDX1NZTkNfVkFMIDB4Njc2
NzY3DQo+IMKgI2RlZmluZSBDT1BZX1NJWkUgU1pfNjRNDQo+ICsjZGVmaW5lCUFUT01JQ19PUF9W
QUwJNTYNCj4gwqANCj4gwqBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvIHsNCj4gwqAJYm9vbCBzdXBw
b3J0c19mYXVsdHM7DQo+IEBAIC00OSw2ICs1NSwxNiBAQCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
IHsNCj4gwqAJaW50IGZkOw0KPiDCoH07DQo+IMKgDQo+ICtzdHJ1Y3QgdGVzdF9leGVjX2RhdGEg
ew0KPiArCXVpbnQzMl90IGJhdGNoWzMyXTsNCj4gKwl1aW50NjRfdCBwYWQ7DQo+ICsJdWludDY0
X3Qgdm1fc3luYzsNCj4gKwl1aW50NjRfdCBleGVjX3N5bmM7DQo+ICsJdWludDMyX3QgZGF0YTsN
Cj4gKwl1aW50MzJfdCBleHBlY3RlZF9kYXRhOw0KPiArCXVpbnQ2NF90IGJhdGNoX2FkZHI7DQo+
ICt9Ow0KPiArDQo+IMKgc3RydWN0IG11bHRpZ3B1X29wc19hcmdzIHsNCj4gwqAJYm9vbCBwcmVm
ZXRjaF9yZXE7DQo+IMKgCWJvb2wgb3BfbW9kOw0KPiBAQCAtNzIsNyArODgsMTAgQEAgc3RhdGlj
IHZvaWQgZ3B1X21lbV9hY2Nlc3Nfd3JhcHBlcihzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9pbmZvICpz
cmMsDQo+IMKgCQkJCcKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2Ug
KmVjaSwNCj4gwqAJCQkJwqDCoCB2b2lkICpleHRyYV9hcmdzKTsNCj4gwqANCj4gLXN0YXRpYyB2
b2lkIG9wZW5fcGFnZW1hcHMoaW50IGZkLCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICppbmZvKTsN
Cj4gK3N0YXRpYyB2b2lkIGdwdV9hdG9taWNfaW5jX3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVf
aW5mbyAqc3JjLA0KPiArCQkJCcKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiAr
CQkJCcKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4g
KwkJCQnCoMKgIHZvaWQgKmV4dHJhX2FyZ3MpOw0KPiDCoA0KPiDCoHN0YXRpYyB2b2lkDQo+IMKg
Y3JlYXRlX3ZtX2FuZF9xdWV1ZShzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUsIHN0cnVjdA0K
PiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+IEBAIC0xNjYsNiArMTg1LDM1
IEBAIHN0YXRpYyB2b2lkIGZvcl9lYWNoX2dwdV9wYWlyKGludCBudW1fZ3B1cywNCj4gc3RydWN0
IHhlX3N2bV9ncHVfaW5mbyAqZ3B1cywNCj4gwqAJfQ0KPiDCoH0NCj4gwqANCj4gK3N0YXRpYyB2
b2lkIG9wZW5fcGFnZW1hcHMoaW50IGZkLCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICppbmZvKTsN
Cj4gKw0KPiArc3RhdGljIHZvaWQNCj4gK2F0b21pY19iYXRjaF9pbml0KGludCBmZCwgdWludDMy
X3Qgdm0sIHVpbnQ2NF90IHNyY19hZGRyLA0KPiArCQnCoCB1aW50MzJfdCAqYm8sIHVpbnQ2NF90
ICphZGRyKQ0KPiArew0KPiArCXVpbnQzMl90IGJhdGNoX2JvX3NpemUgPSBCQVRDSF9TSVpFKGZk
KTsNCj4gKwl1aW50MzJfdCBiYXRjaF9ibzsNCj4gKwl1aW50NjRfdCBiYXRjaF9hZGRyOw0KPiAr
CXZvaWQgKmJhdGNoOw0KPiArCXVpbnQzMl90ICpjbWQ7DQo+ICsJaW50IGkgPSAwOw0KPiArDQo+
ICsJYmF0Y2hfYm8gPSB4ZV9ib19jcmVhdGUoZmQsIHZtLCBiYXRjaF9ib19zaXplLA0KPiB2cmFt
X2lmX3Bvc3NpYmxlKGZkLCAwKSwgMCk7DQo+ICsJYmF0Y2ggPSB4ZV9ib19tYXAoZmQsIGJhdGNo
X2JvLCBiYXRjaF9ib19zaXplKTsNCj4gKwljbWQgPSAodWludDMyX3QgKiliYXRjaDsNCj4gKw0K
PiArCWNtZFtpKytdID0gTUlfQVRPTUlDIHwgTUlfQVRPTUlDX0lOQzsNCj4gKwljbWRbaSsrXSA9
IHNyY19hZGRyOw0KPiArCWNtZFtpKytdID0gc3JjX2FkZHIgPj4gMzI7DQo+ICsJY21kW2krK10g
PSBNSV9CQVRDSF9CVUZGRVJfRU5EOw0KPiArDQo+ICsJYmF0Y2hfYWRkciA9IHRvX3VzZXJfcG9p
bnRlcihiYXRjaCk7DQo+ICsJLyogUHVuY2ggYSBnYXAgaW4gdGhlIFNWTSBtYXAgd2hlcmUgd2Ug
bWFwIHRoZSBiYXRjaF9ibyAqLw0KPiArCXhlX3ZtX2JpbmRfbHJfc3luYyhmZCwgdm0sIGJhdGNo
X2JvLCAwLCBiYXRjaF9hZGRyLA0KPiBiYXRjaF9ib19zaXplLCAwKTsNCj4gKwkqYm8gPSBiYXRj
aF9ibzsNCj4gKwkqYWRkciA9IGJhdGNoX2FkZHI7DQo+ICt9DQo+ICsNCj4gwqBzdGF0aWMgdm9p
ZCBiYXRjaF9pbml0KGludCBmZCwgdWludDMyX3Qgdm0sIHVpbnQ2NF90IHNyY19hZGRyLA0KPiDC
oAkJwqDCoMKgwqDCoMKgIHVpbnQ2NF90IGRzdF9hZGRyLCB1aW50NjRfdCBjb3B5X3NpemUsDQo+
IMKgCQnCoMKgwqDCoMKgwqAgdWludDMyX3QgKmJvLCB1aW50NjRfdCAqYWRkcikNCj4gQEAgLTMy
NSw2ICszNzMsMTA1IEBAIGdwdV9tZW1fYWNjZXNzX3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVf
aW5mbw0KPiAqc3JjLA0KPiDCoAljb3B5X3NyY19kc3Qoc3JjLCBkc3QsIGVjaSwgYXJncy0+cHJl
ZmV0Y2hfcmVxKTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9pZA0KPiArYXRvbWljX2luY19v
cChzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpncHUwLA0KPiArCcKgwqDCoMKgwqAgc3RydWN0IHhl
X3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwnCoMKgwqDCoMKgIHN0cnVjdCBkcm1feGVfZW5naW5l
X2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICsJwqDCoMKgwqDCoCBib29sIHByZWZldGNoX3JlcSkN
Cj4gK3sNCj4gKwl1aW50NjRfdCBhZGRyOw0KPiArCXVpbnQzMl90IHZtWzJdOw0KPiArCXVpbnQz
Ml90IGV4ZWNfcXVldWVbMl07DQo+ICsJdWludDMyX3QgYmF0Y2hfYm87DQo+ICsJc3RydWN0IHRl
c3RfZXhlY19kYXRhICpkYXRhOw0KPiArCXVpbnQ2NF90IGJhdGNoX2FkZHI7DQo+ICsJc3RydWN0
IGRybV94ZV9zeW5jIHN5bmMgPSB7fTsNCj4gKwl2b2xhdGlsZSB1aW50NjRfdCAqc3luY19hZGRy
Ow0KPiArCXZvbGF0aWxlIHVpbnQzMl90ICpzaGFyZWRfdmFsOw0KPiArDQo+ICsJY3JlYXRlX3Zt
X2FuZF9xdWV1ZShncHUwLCBlY2ksICZ2bVswXSwgJmV4ZWNfcXVldWVbMF0pOw0KPiArCWNyZWF0
ZV92bV9hbmRfcXVldWUoZ3B1MSwgZWNpLCAmdm1bMV0sICZleGVjX3F1ZXVlWzFdKTsNCj4gKw0K
PiArCWRhdGEgPSBhbGlnbmVkX2FsbG9jKFNaXzJNLCBTWl80Syk7DQo+ICsJaWd0X2Fzc2VydChk
YXRhKTsNCj4gKwlkYXRhWzBdLnZtX3N5bmMgPSAwOw0KPiArCWFkZHIgPSB0b191c2VyX3BvaW50
ZXIoZGF0YSk7DQo+ICsNCj4gKwlzaGFyZWRfdmFsID0gKHZvbGF0aWxlIHVpbnQzMl90ICopYWRk
cjsNCj4gKwkqc2hhcmVkX3ZhbCA9IEFUT01JQ19PUF9WQUwgLSAxOw0KPiArDQo+ICsJYXRvbWlj
X2JhdGNoX2luaXQoZ3B1MC0+ZmQsIHZtWzBdLCBhZGRyLCAmYmF0Y2hfYm8sDQo+ICZiYXRjaF9h
ZGRyKTsNCj4gKw0KPiArCS8qIFBsYWNlIGRlc3RpbmF0aW9uIGluIGFuIG9wdGlvbmFsbHkgcmVt
b3RlIGxvY2F0aW9uIHRvDQo+IHRlc3QgKi8NCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTAt
PmZkLCB2bVswXSwgYWRkciwgU1pfNEssIDAsDQo+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5H
RV9BVFRSX1BSRUZFUlJFRF9MT0MsDQo+ICsJCQnCoMKgwqAgZ3B1MC0+ZmQsIDAsIGdwdTAtPnZy
YW1fcmVnaW9uc1swXSwNCj4gZXhlY19xdWV1ZVswXSwNCj4gKwkJCcKgwqDCoCAwLCAwKTsNCj4g
Kw0KPiArCXNldHVwX3N5bmMoJnN5bmMsICZzeW5jX2FkZHIsIEJJTkRfU1lOQ19WQUwpOw0KPiAr
CXhlX211bHRpZ3B1X3ByZWZldGNoKGdwdTAtPmZkLCB2bVswXSwgYWRkciwgU1pfNEssICZzeW5j
LA0KPiArCQkJwqDCoMKgwqAgc3luY19hZGRyLCBleGVjX3F1ZXVlWzBdLA0KPiBwcmVmZXRjaF9y
ZXEpOw0KPiArDQo+ICsJc3luY19hZGRyID0gKHZvaWQgKikoKGNoYXIgKiliYXRjaF9hZGRyICsg
U1pfNEspOw0KPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5j
X2FkZHIpOw0KPiArCXN5bmMudGltZWxpbmVfdmFsdWUgPSBFWEVDX1NZTkNfVkFMOw0KPiArCSpz
eW5jX2FkZHIgPSAwOw0KPiArDQo+ICsJLyogRXhlY3V0aW5nIEFUT01JQ19JTkMgb24gR1BVMC4g
Ki8NCj4gKwl4ZV9leGVjX3N5bmMoZ3B1MC0+ZmQsIGV4ZWNfcXVldWVbMF0sIGJhdGNoX2FkZHIs
ICZzeW5jLCAxKTsNCj4gKwlpZiAoKnN5bmNfYWRkciAhPSBFWEVDX1NZTkNfVkFMKQ0KPiArCQl4
ZV93YWl0X3VmZW5jZShncHUwLT5mZCwgKHVpbnQ2NF90ICopc3luY19hZGRyLA0KPiBFWEVDX1NZ
TkNfVkFMLCBleGVjX3F1ZXVlWzBdLA0KPiArCQkJwqDCoMKgwqDCoMKgIE5TRUNfUEVSX1NFQyAq
IDEwKTsNCj4gKw0KPiArCWlndF9hc3NlcnRfZXEoKnNoYXJlZF92YWwsIEFUT01JQ19PUF9WQUwp
Ow0KPiArDQo+ICsJYXRvbWljX2JhdGNoX2luaXQoZ3B1MS0+ZmQsIHZtWzFdLCBhZGRyLCAmYmF0
Y2hfYm8sDQo+ICZiYXRjaF9hZGRyKTsNCj4gKw0KPiArCS8qIFBsYWNlIGRlc3RpbmF0aW9uIGlu
IGFuIG9wdGlvbmFsbHkgcmVtb3RlIGxvY2F0aW9uIHRvDQo+IHRlc3QgKi8NCg0KV2UncmUgYWN0
dWFsbHkgbmV2ZXIgdXNpbmcgYSByZW1vdGUgbG9jYXRpb24gaGVyZT8gSXQncyBhbHdheXMgYWR2
aXNlZA0KdG8gbG9jYWwuDQoNCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEtPmZkLCB2bVsx
XSwgYWRkciwgU1pfNEssIDAsDQo+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BS
RUZFUlJFRF9MT0MsDQo+ICsJCQnCoMKgwqAgZ3B1MS0+ZmQsIDAsIGdwdTEtPnZyYW1fcmVnaW9u
c1swXSwNCj4gZXhlY19xdWV1ZVswXSwNCj4gKwkJCcKgwqDCoCAwLCAwKTsNCg0KDQoNCj4gKw0K
PiArCXNldHVwX3N5bmMoJnN5bmMsICZzeW5jX2FkZHIsIEJJTkRfU1lOQ19WQUwpOw0KPiArCXhl
X211bHRpZ3B1X3ByZWZldGNoKGdwdTEtPmZkLCB2bVsxXSwgYWRkciwgU1pfNEssICZzeW5jLA0K
PiArCQkJwqDCoMKgwqAgc3luY19hZGRyLCBleGVjX3F1ZXVlWzFdLA0KPiBwcmVmZXRjaF9yZXEp
Ow0KPiArDQo+ICsJc3luY19hZGRyID0gKHZvaWQgKikoKGNoYXIgKiliYXRjaF9hZGRyICsgU1pf
NEspOw0KPiArCXN5bmMuYWRkciA9IHRvX3VzZXJfcG9pbnRlcigodWludDY0X3QgKilzeW5jX2Fk
ZHIpOw0KPiArCXN5bmMudGltZWxpbmVfdmFsdWUgPSBFWEVDX1NZTkNfVkFMOw0KPiArCSpzeW5j
X2FkZHIgPSAwOw0KPiArDQo+ICsJLyogRXhlY3V0ZSBBVE9NSUNfSU5DIG9uIEdQVTEgKi8NCj4g
Kwl4ZV9leGVjX3N5bmMoZ3B1MS0+ZmQsIGV4ZWNfcXVldWVbMV0sIGJhdGNoX2FkZHIsICZzeW5j
LCAxKTsNCg0KSWYgZ3B1MSBoZXJlIGRvZXNuJ3Qgc3VwcG9ydCBmYXVsdHMsIHdlIHNob3VsZG4n
dCBleGVjdXRlIHRoaXMuDQoNCg0KPiArCWlmICgqc3luY19hZGRyICE9IEVYRUNfU1lOQ19WQUwp
DQo+ICsJCXhlX3dhaXRfdWZlbmNlKGdwdTEtPmZkLCAodWludDY0X3QgKilzeW5jX2FkZHIsDQo+
IEVYRUNfU1lOQ19WQUwsIGV4ZWNfcXVldWVbMV0sDQo+ICsJCQnCoMKgwqDCoMKgwqAgTlNFQ19Q
RVJfU0VDICogMTApOw0KPiArDQo+ICsJaWd0X2Fzc2VydF9lcSgqc2hhcmVkX3ZhbCwgQVRPTUlD
X09QX1ZBTCArIDEpOw0KPiArDQo+ICsJbXVubWFwKCh2b2lkICopYmF0Y2hfYWRkciwgQkFUQ0hf
U0laRShncHUwLT5mZCkpOw0KPiArCWJhdGNoX2ZpbmkoZ3B1MC0+ZmQsIHZtWzBdLCBiYXRjaF9i
bywgYmF0Y2hfYWRkcik7DQo+ICsJYmF0Y2hfZmluaShncHUxLT5mZCwgdm1bMV0sIGJhdGNoX2Jv
LCBiYXRjaF9hZGRyKTsNCj4gKwlmcmVlKGRhdGEpOw0KPiArDQo+ICsJY2xlYW51cF92bV9hbmRf
cXVldWUoZ3B1MCwgdm1bMF0sIGV4ZWNfcXVldWVbMF0pOw0KPiArCWNsZWFudXBfdm1fYW5kX3F1
ZXVlKGdwdTEsIHZtWzFdLCBleGVjX3F1ZXVlWzFdKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZv
aWQNCj4gK2dwdV9hdG9taWNfaW5jX3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqc3Jj
LA0KPiArCQnCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZHN0LA0KPiArCQnC
oMKgwqDCoMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwNCj4g
KwkJwqDCoMKgwqDCoMKgIHZvaWQgKmV4dHJhX2FyZ3MpDQo+ICt7DQo+ICsJc3RydWN0IG11bHRp
Z3B1X29wc19hcmdzICphcmdzID0gKHN0cnVjdCBtdWx0aWdwdV9vcHNfYXJncw0KPiAqKWV4dHJh
X2FyZ3M7DQo+ICsJaWd0X2Fzc2VydChzcmMpOw0KPiArCWlndF9hc3NlcnQoZHN0KTsNCj4gKw0K
PiArCWF0b21pY19pbmNfb3Aoc3JjLCBkc3QsIGVjaSwgYXJncy0+cHJlZmV0Y2hfcmVxKTsNCj4g
K30NCj4gKw0KPiDCoGlndF9tYWluDQo+IMKgew0KPiDCoAlzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZv
IGdwdXNbTUFYX1hFX0dQVVNdOw0KPiBAQCAtMzY0LDYgKzUxMSwxNCBAQCBpZ3RfbWFpbg0KPiDC
oAkJZm9yX2VhY2hfZ3B1X3BhaXIoZ3B1X2NudCwgZ3B1cywgJmVjaSwNCj4gZ3B1X21lbV9hY2Nl
c3Nfd3JhcHBlciwgJm9wX2FyZ3MpOw0KPiDCoAl9DQo+IMKgDQo+ICsJaWd0X3N1YnRlc3QoImF0
b21pYy1pbmMtZ3B1LW9wIikgew0KPiArCQlzdHJ1Y3QgbXVsdGlncHVfb3BzX2FyZ3MgYXRvbWlj
X2FyZ3M7DQo+ICsJCWF0b21pY19hcmdzLnByZWZldGNoX3JlcSA9IDE7DQo+ICsJCWZvcl9lYWNo
X2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9hdG9taWNfaW5jX3dyYXBwZXIs
ICZhdG9taWNfYXJncyk7DQo+ICsJCWF0b21pY19hcmdzLnByZWZldGNoX3JlcSA9IDA7DQo+ICsJ
CWZvcl9lYWNoX2dwdV9wYWlyKGdwdV9jbnQsIGdwdXMsICZlY2ksDQo+IGdwdV9hdG9taWNfaW5j
X3dyYXBwZXIsICZhdG9taWNfYXJncyk7DQoNClNhbWUgY29tbWVudCBoZXJlIGFzIGZvciB0aGUg
Zmlyc3QgdGVzdC4NCg0KL1Rob21hcw0KDQoNCg0KPiArCX0NCj4gKw0KPiDCoAlpZ3RfZml4dHVy
ZSB7DQo+IMKgCQlpbnQgY250Ow0KPiDCoA0KDQo=
