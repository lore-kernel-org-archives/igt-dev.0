Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBD8CCD1BF
	for <igt-dev@archiver.kernel.org>; Wed, 29 Oct 2025 05:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C93610E09A;
	Wed, 29 Oct 2025 05:03:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6/nemyL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1742010E09A
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Oct 2025 05:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761714210; x=1793250210;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hxjNC5E6dg0wJy9ipUCImcSCpWQ/IMRJMB7CjdOEKuw=;
 b=C6/nemyLDfDVyQSs0YXlv/cwkpNaEc9wWxo5/1kUyKjIvqR6OT6HjvCl
 xtPKjCs6qVSQIoHleF/86oAMpkOpJ0XOMVDX/tL8VgFkSBcyR2jty1x/k
 aJeoKlZa8yCCOjbkk+TE5vcYsBFoVIJg6vlv3wSuSrQBix53Z1j45UDfb
 fs+1o+8IKRP3eB8BcsO1P8FeYwQxedHE4YH1JOic6vICGTJfgUVa95vHB
 SJvfvwAUqkdbgpwX95urHfJaRBVab5sg9zLAuu8I8z347lTbyhXY1pvUD
 IzBJbtEVZCT5Li7SwL1Ock3UAf1g79ZE2KqKC0vJx5FTtjoCcFPCbcliP Q==;
X-CSE-ConnectionGUID: r0YVNybsRBW0WkzrNSuKjA==
X-CSE-MsgGUID: l1AwNgYVS9GKICIFiV6iaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67662327"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67662327"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:03:30 -0700
X-CSE-ConnectionGUID: tzMUucnHR86NR+9+q64lew==
X-CSE-MsgGUID: 4dotW6uVRNCVIF8B+RUhfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="189862454"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 22:03:30 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:03:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 22:03:28 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 22:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L5cTZF5l3AiM0+JNv6BFpQpI8GyjRQTi3IgBtj9OsI6FctvGT9r+sh5eBBYbXVO63fDtT1eYC3QGV0Ue0Tj2seI3vvuHarTsF+7Rp2Xf1+kihaP2malmLG93sRsSPCjj0cgyxKDJgNIoD6EYoDeX8OUZqfGR33eUhcdNubPZ0jwlTcmrV955kt+AEGYBG50xMMj2TeKZkvHWRC8X6IHhJenmZ1EIP9uocG8cFhTjH/IhD510+LESnzf/nvCNHtsrkTNMHjncjPYlnJrt/NAVFuV9C/j+LCfER57Hc8zoH1YxE5FIx9kKxHY/o096FcRzN51tffPvnjszTKYyGfLKfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxjNC5E6dg0wJy9ipUCImcSCpWQ/IMRJMB7CjdOEKuw=;
 b=YmaX7ap2sih1vkXi/NxxMf1E8ih/fqToD0SIJGVfNV8FHtfdntBT6gkWz10f6mwtUiQEtaapv2OEfOwHs13NYeFM/rWurQdigUQQk0jfEm0FnvD/pnYqIqOm9WKqQV59dM4dPMZ+ayeZLEqQ4ZxbV+SPPxiGKB7wccCMPKIVjLMOCSr4tAc/OmWPgYWDQA0KD+RNA46GFz+YcBPjMWptdPKbeRlmEf52fFBeohGiG8iWvKyxDlO7vhZj4soSGR0qI/pX2lPhTgoBbHV3XktIqlW8CQgwbjnPMkFjgS9jWM9NVA6CgQ1uPNDYmdXNMHeIwBQzWnmKwQoqzvNiQD/r+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by PH0PR11MB5190.namprd11.prod.outlook.com (2603:10b6:510:3c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Wed, 29 Oct
 2025 05:03:26 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 05:03:26 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Karas, Krzysztof" <krzysztof.karas@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Kempczynski, Zbigniew"
 <zbigniew.kempczynski@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Thread-Topic: [PATCH i-g-t] RFC: tools/gputop: Add GPU frequencies to the
 client headers
Thread-Index: AQHcR2LdHoo0wqKMSU+/HgFM4IPGpLTXQ2EAgAFOOcA=
Date: Wed, 29 Oct 2025 05:03:26 +0000
Message-ID: <CH0PR11MB5427F213A48FF182469CAB5998FAA@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251027164354.3546543-1-s.sebinraj@intel.com>
 <zdvlybgrzi3beoy2shqg37t3basozuttp7gdmu5bmwxmt6ngq3@l7kxcnvnltn7>
In-Reply-To: <zdvlybgrzi3beoy2shqg37t3basozuttp7gdmu5bmwxmt6ngq3@l7kxcnvnltn7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|PH0PR11MB5190:EE_
x-ms-office365-filtering-correlation-id: aa5e7152-9e48-472d-672c-08de16a87e89
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?c2xjd1hkSUtDY294ay9veHZLOHo5UFl3dXgrSjRxSmtrY2Q2YzFyc2JVNU15?=
 =?utf-8?B?V0JYSWZmYjBoV1AzdWdvNDFlRmNtNnRScDh0azFpOTl4OVFJVmRQRHU3c3Fz?=
 =?utf-8?B?OHNiMWM2RzNIRVFDcHg1dXA2akdaNjlPdTdkMXA5eHRweHBKSjBHRVJKbnEw?=
 =?utf-8?B?SDZId1hLeEtmZDEyd1YwSnFNdjRxeVF2ZlNPQjlZUkxTU3pBTnB3RnpvWkZa?=
 =?utf-8?B?NGVlRmZzT0dHOTFZNzIxcFgzcXFwMXBSaXRjbDhSRU1qa1FIdVlQY2t2cDFZ?=
 =?utf-8?B?K29XNnNmczRYSjN1d0h0dkpxWGpXNml3V1JmRjRTOGkxT2VhL2xVSTUvNmJj?=
 =?utf-8?B?UHVPMmVzbW1uRElHNW04OFo3RnBwUXl0VGVKc3ltOFVJczZMZjRmQlMxcWY5?=
 =?utf-8?B?Yk1MU3ZMVmVuVzYrTmFjaUFxNTFIMGVCQ2hyQ2dpZVdyck4wQ0xScXZhTlEx?=
 =?utf-8?B?SHVLUzlvdmFEVGJvbXRlYmh0bDg5aEhJeDJHSWhCbXBtT29rc01kbFZMSENF?=
 =?utf-8?B?SmRvbHM0UVR5NUJxdUVKMjNXVzI0NlhmcXdpdW9VdzZWU0NEcGVZbkVBeE5r?=
 =?utf-8?B?cDdEMnF4ZWxsTENLLzNkQ2xvUVV3eEtsbkVTR1pHRU9yZVh6R0JvRERlZ3ZW?=
 =?utf-8?B?ZGZrcFJlcG1kUTU5ckRPRm5QbWlOWFB3dlk3TFJPNXN6MTduTnVhRXZiV2Zs?=
 =?utf-8?B?bEVQQXZDajljazVwdER2Y0ZPYU0wWXZkb1ZwMitRWHZjMlQ2aWMydm9aMTg5?=
 =?utf-8?B?RTRWb09ZNkhEV3loSlI3V1Q1WlZuYTcrR2lhdWREOHB3MVJVcUhhTy9BcnU3?=
 =?utf-8?B?dGowNlNxaGRvRndHQUQ0dFJkblBtQlFSNUwvTnd4bzRGdEM4UUUxc2hUYXJ5?=
 =?utf-8?B?N0U2eFBTOFhzVTBpMjRDZ0FpelBBclNDLzhZVHFXTVZvVmdwei9UVDFramtL?=
 =?utf-8?B?Z3VvMGhUNjJudlIrVkorME96NUlpYktMWVNjSTVlVzhRbVh3SmFCbUp1R3cr?=
 =?utf-8?B?d3hKMTBHRU9yaGYvVXZUcWY1amFnYWJ6VVJHdk9CaHBqZlFQcndTaXJSOE5C?=
 =?utf-8?B?VXFCR1Q1T1BPWFB2VERZVUpjanlMMCtlSjJZZXZSMm5FWEUxZy9vSmJ0ZExm?=
 =?utf-8?B?QThEY0tuZWJLT3pPVStKMEx5OXpLR0ZMTnZZTDNCY2JWdVFDdjJsSVZ4K0VW?=
 =?utf-8?B?YW9MaWEyZmw0TUZBVTdpRzJlcGQ2bnVOZEJpdFE1ZldydkFrMjRTWDRlbGpn?=
 =?utf-8?B?K1VvRTE0Wm5JV0FUTVFvZmQ0NlpIazJWaGhyZ0NVM2VSUDZjMGdTZitYWjBi?=
 =?utf-8?B?T1lhSmwzQlpiNlpkYTBHY1IybURlTGxCa2xoYldtQjU1K3NyODQrZjJkZllh?=
 =?utf-8?B?TmJDMko5dEhkNjBselhmVzQ0K1g5c3YvVzFQWEI1UFNXVW9Cd21NcFcybVF2?=
 =?utf-8?B?eFJ0YlZwN0kyL0w2Q25CUlo3dzl0VUMvY2ljWmREWnNGSGltWHBpZ1ZjV3V2?=
 =?utf-8?B?M1hvQ2hTcWRPajJLVEhhOUxsNXYzTU4yVElsV1llajU5eDU4ZVczcTc5Y1V2?=
 =?utf-8?B?T3prdHE4MWwzcFJ6Ylo4OGNFeXB6M2lVK1JiUmVvUTNWM3FPeURGTm9LVk5m?=
 =?utf-8?B?M2FydmdLSG1ybDFDc3JUVHVHWkdIaExYZUF5MnUrd1MxQ0NWcXl0MFJVakdE?=
 =?utf-8?B?VW9XRlJ4MFJUbGI3ZXJUUTBCVGJVMFpHL2tIT3I1QjVXek8zUDhtM24xaVFr?=
 =?utf-8?B?U0hSL3prMFdhamtISk9jbWl3MjhrREZjNmx6cUt0Wldvak1lRnp2OE55Vjh3?=
 =?utf-8?B?anNyVWxPQkYxUW16a2FQbEFSUzF6aUVOY0xtZHhRa0VZTDQ3UjNxeVcyZUY5?=
 =?utf-8?B?K0VsV244VkNyU09XYkZVMDNQRTlQdEhIWHFQV0FuYmZvQmdLMVJWUytIQTlL?=
 =?utf-8?B?c1F2QkJpYXcxY1Q3eTVxb0V3RXNnQSt5Qk5VbS9RV0dQaHFoSjgwdmRxa3J6?=
 =?utf-8?B?VXZQVjA4SlNGSlRGYlBLTk9SNms4YmwwN0IvMy9aNDU3NjVTM1ViVEJTOTBq?=
 =?utf-8?Q?aRWbiT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bytZR2h2SGxsS2dKNzlTR25pcHFxa1M1MnZEN1E2NENRWFIwSUQ0RWJKeHla?=
 =?utf-8?B?WHRLWThyTE43L2tqcnk0Lzl0bnNhRTVIWmZlYU5Tei95Z3dwTjFGZU1wdzdG?=
 =?utf-8?B?Qy9LVVo0ZmUwQm8wSFI3L1dCZkRCTWxDbWsvR3BidTRXbHdPYjluWTRWK3Mw?=
 =?utf-8?B?Tm40bEkvUjBpdHRQbkFINEl1b3JlQ0k4ZnRXL3V6N1Z4eUxwVmxUdUhyQWZv?=
 =?utf-8?B?UWFCb20vb1IvOTNQTnlOWXoySXNXMGRYNU8vSXEzdDFUNHJUblpQTFlJSlY5?=
 =?utf-8?B?Z3NjZ0ZOTEJiRUN5RDNFQ0VXMWREM3dlWmYvWW0zRWY3NlJHTGdKRUs1MEJn?=
 =?utf-8?B?K3FnWFRQbVFpaklLTjUzekxwV3hwSEpyMlJJdGtoMHJUSGhIK2RNT05hZzE3?=
 =?utf-8?B?eVdnUzJIbHYvSjR6NTlGSzNVd2R2eEJ5dlNzNHdwdW5zcWVtZENZTi9mSDha?=
 =?utf-8?B?V2dTNzVCeGN6bnN2VmM5VENJUFgyVkp1b2lTR1JnWWlNVlJKU1FQeWdYZytG?=
 =?utf-8?B?d3E1QWlrVkhGU05Fc2ZqNnFDVEtpVEVrRHY5UkRLSXNDMGMrS1psWnZlbDQy?=
 =?utf-8?B?enJadFo5dGJyMGNRN2xuSEo4NFJBby93M1F5eWJYeVZtR1V2MmtreEJXU3c3?=
 =?utf-8?B?elozbGhUUmNqOVpOYmMxMjExa0JKV1dIUUo0U1piT0RRbXd4ZG55eWdoTFVE?=
 =?utf-8?B?azZER2NDUW14c2kwQXFwbEY0bjgwL2I1NzJ4TUtCcDF5VFZWT0ZORzIyNDhi?=
 =?utf-8?B?YjhkWlRKVVdLNDIyN0tmVVlQWUVwWkhKWDd4MjA1RjlkTFBBQmxReENSZkNM?=
 =?utf-8?B?M1hiUm9HbVJWOVF1MSt6L0d5NkJqQkg4dUNNaFJ1bVpjL2ZXd3pKQWhmZUxu?=
 =?utf-8?B?ekFKQXZoK2VkMDNHdkhQZXBjUlh5QXU3V29weWZPVFdzdjdWaGxqd3daNzl4?=
 =?utf-8?B?dExOa0UyRTBNaUZCQ1ZRaEhINnZ6NXc5cmJlYVZvaVJMK1lYZHNXUFAwNWpX?=
 =?utf-8?B?SmM3bmRjS1lqTWsxU3hleHFHbnZLV3I3RHhKVnJvWncrTjVob1dyMFBud1RK?=
 =?utf-8?B?OERacnMyOENNWE9vSnFZYWhicm9sL3VxQTZ4ZE4vU1dyUkExSm9TT0FQd0ND?=
 =?utf-8?B?VlZudERBYW9aS253Qm5YTmxPTE9wRDVLQjRzNm03S3VmWHQrRGhCVFFEcnRz?=
 =?utf-8?B?TGx4MWIxaHUxR3h6RnlEdGZVd1E4NzJhajBaWllPSzNPU05kOFNSbWtVWjc5?=
 =?utf-8?B?QVNrQ2pYVmtST3pJZnBJTFdMZU1TeXJJZ2hGOWNsR0ZwOEIwMzd3OTV5MVMz?=
 =?utf-8?B?U0ZOTjJ3WlpJTjJ0Y1VFMEdFdVQ2YVZ6TEYvZVJsWHQ4NG9ZRHRpRU9DdEkz?=
 =?utf-8?B?aGc5THVtN00vQ3hpL1BKSk8ya21TRk44ZHJBcUtJOWg3TFh5UWl3UVB0Y1pL?=
 =?utf-8?B?aGNjYlBTRzVZeXdxNG1qRGVNS2RVL2hMbWxIRVN5M3htRFBnaTFHR0ZORUxP?=
 =?utf-8?B?TTZXRytNUTlLeGxZSG93ZGtTTmdCdFNWQ3EwZE5qU3B2WUQ2Wnh6NU9YdDM3?=
 =?utf-8?B?bE84VE14SE9DRFBvU1JFZ1FZaGZhQ2JUVEZkYnJoSjA1SytOTzkwdkdScjIz?=
 =?utf-8?B?clVEY0dacEo3aVRIVktJRmd3VWxHa2tFR3ozc0J6cjBKb0x1L1E5cy9MSGdI?=
 =?utf-8?B?aXBLMmM0R2VobXRRbUZUbm9FNUpJM3pPRVZOVmVNVHVTRzl1N2g3ZjhxNDNq?=
 =?utf-8?B?OWQvbDczWXhXeTRnVFpNeFBVRCt3Nm8yVnNHZkxBbzJvOTh6NnJmTThva3lF?=
 =?utf-8?B?RnduNGUrc0tiSEVDMkpNeldjejZVWmhCS2dMTkJVOVdibmswR2FoSnM1N1BT?=
 =?utf-8?B?dUNsT2pNbGtiZmZJWFVCemxlSzliTERtd0MxYjNtWEpSVktFWlJzWWxZaFdI?=
 =?utf-8?B?VnRJNU5tdjlJMzZzVlNqdnpydFpacXV3U015d2xOVEZxUHREY0hYNE03c05o?=
 =?utf-8?B?VHdqdmxPWEJRNVB3eVFPem9lditnYzV0Nnpodk93cmV4aWJaazNYOCtCaFhy?=
 =?utf-8?B?S1R5dFBMWTQxaG1GZW1kaUtGR205SWQ4dS9IVVdsN3pUV2JMeDc2c1BaUGZ2?=
 =?utf-8?Q?a4WnGDFMu46sz4PSWQyOI9jzc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5e7152-9e48-472d-672c-08de16a87e89
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 05:03:26.6136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8T0Zr13VxVNKSSRDxTyDT5opBwaBMGtS9d9BKVtHuTBYhedCa/6cBGc9n1zjDdwZTRh/uJBzR7Wj7ai0Ct1uMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5190
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

DQoNCj4gSGksDQoNCj4gRW5oYW5jZSBncHV0b3AgdG8gZGlzcGxheSBHUFUgZnJlcXVlbmN5IGlu
Zm9ybWF0aW9uIChjdXJyZW50L2FjdHVhbCkgDQo+IGZvciBlYWNoIEdUIGluIHRoZSBjbGllbnQg
aGVhZGVyIGxpbmUgYWxvbmdzaWRlIHRoZSBEUk0gbWlub3IgbnVtYmVyLg0KPiANCj4gS2V5IGNo
YW5nZXM6DQo+IC0gQWRkIGdldF9ndF9mcmVxdWVuY2llcygpIGZ1bmN0aW9uIHRvIHJlYWQgR1Qg
ZnJlcXVlbmN5IHZhbHVlcw0KPiAtIFN1cHBvcnQgYm90aCBpOTE1IGFuZCBYZSBkcml2ZXJzIHVz
aW5nIGFwcHJvcHJpYXRlIHN5c2ZzIHBhdGhzDQo+IC0gRGlzcGxheSBmb3JtYXQ6ICJEUk0gbWlu
b3IgWCAgRnJlcShjdXIvYWN0KSBHVDAtZnJlcS9mcmVxIEdUMS1mcmVxL2ZyZXEiDQo+IC0gVXNl
IElHVCBBUEkgZnVuY3Rpb25zICh4ZV9zeXNmc19ndF9wYXRoLCBpZ3Rfc3lzZnNfZ3RfcGF0aCkg
Zm9yDQo+ICAgZHJpdmVyLWFnbm9zdGljIHN5c2ZzIGFjY2Vzcw0KPiANCj4gVGhlIGZyZXF1ZW5j
eSBpbmZvcm1hdGlvbiBoZWxwcyB1c2VycyBtb25pdG9yIEdQVSBwZXJmb3JtYW5jZSBzdGF0ZXMg
DQo+IGluIHJlYWwtdGltZSB3aGlsZSBvYnNlcnZpbmcgY2xpZW50IHdvcmtsb2FkIHV0aWxpemF0
aW9uLg0KPiANCj4gRXhhbXBsZSBvdXRwdXQ6DQo+ICAgRFJNIG1pbm9yIDAgICAgICAgICAgRnJl
cShjdXIvYWN0KSBHVDAtMTgwMC8xODAwIEdUMS00MDAvNDAwDQo+ICAgRFJNIG1pbm9yIDEyOCAg
ICAgICAgRnJlcShjdXIvYWN0KSBHVDAtNDAwLzQwMCBHVDEtNDAwLzQwMA0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUyBTZWJpbnJhaiA8cy5zZWJpbnJhakBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdG9v
bHMvZ3B1dG9wLmMgICAgfCAxMTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLQ0KPiAgdG9vbHMvbWVzb24uYnVpbGQgfCAgIDIgKy0NCj4gIDIgZmlsZXMgY2hh
bmdlZCwgMTEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvZ3B1dG9wLmMgYi90b29scy9ncHV0b3AuYyBpbmRleCANCj4gZjU3N2ExNzUwLi4y
M2RmM2IzNjcgMTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2dwdXRvcC5jDQo+ICsrKyBiL3Rvb2xzL2dw
dXRvcC5jDQo+IEBAIC0zMCw3ICszMCw5IEBADQo+ICAjaW5jbHVkZSAiaWd0X2RybV9jbGllbnRz
LmgiDQo+ICAjaW5jbHVkZSAiaWd0X2RybV9mZGluZm8uaCINCj4gICNpbmNsdWRlICJpZ3RfcHJv
ZmlsaW5nLmgiDQo+ICsjaW5jbHVkZSAiaWd0X3N5c2ZzLmgiDQo+ICAjaW5jbHVkZSAiZHJtdGVz
dC5oIg0KPiArI2luY2x1ZGUgInhlL3hlX2d0LmgiDQo+ICANCj4gIGVudW0gdXRpbGl6YXRpb25f
dHlwZSB7DQo+ICAJVVRJTElaQVRJT05fVFlQRV9FTkdJTkVfVElNRSwNCj4gQEAgLTc2LDE3ICs3
OCwxMjUgQEAgc3RhdGljIHZvaWQgcHJpbnRfcGVyY2VudGFnZV9iYXIoZG91YmxlIHBlcmNlbnQs
IGludCBtYXhfbGVuKQ0KPiAgCXB1dGNoYXIoJ3wnKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGNo
YXIgKmdldF9ndF9mcmVxdWVuY2llcyh2b2lkKSB7DQo+ICsJY2hhciBmcmVxX3N0cls1MTJdID0g
IiI7DQo+ICsJY2hhciBndF9pbmZvWzY0XTsNCj4gKwlpbnQgZmQgPSAtMTsNCj4gKwlpbnQgbnVt
X2d0cyA9IDA7DQo+ICsJYm9vbCBpc194ZSA9IGZhbHNlOw0KPiArCWludCBndDsNCj4gKwlib29s
IGZpcnN0ID0gdHJ1ZTsNCj4gWW91IGNvdWxkIHNvcnQgdGhlIHZhcmlhYmxlcycgZGVjbGFyYXRp
b25zIGJ5IHR5cGUgaGVyZSBhbmQgYmVsb3cgYXMgd2VsbC4NCg0KT2theSBnb3QgaXQsIEknbGwg
Y29ycmVjdCB0aGVzZS4NCg0KPiArDQo+ICsJZmQgPSBfX2RybV9vcGVuX2RyaXZlcihEUklWRVJf
SU5URUwgfCBEUklWRVJfWEUpOw0KPiArCWlmIChmZCA8IDApIHsNCj4gKwkJZnByaW50ZihzdGRl
cnIsICJGYWlsZWQgdG8gb3BlbiBEUk0gZGV2aWNlXG4iKTsNCj4gKwkJcmV0dXJuIE5VTEw7DQo+
ICsJfQ0KPiArDQo+ICsJLyogRGV0ZWN0IGRyaXZlciB0eXBlIGFuZCBnZXQgR1QgY291bnQgKi8N
Cj4gKwlpc194ZSA9IGlzX3hlX2RldmljZShmZCk7DQo+ICsJaWYgKGlzX3hlKQ0KPiArCQludW1f
Z3RzID0geGVfbnVtYmVyX2d0KGZkKTsNCj4gKwllbHNlDQo+ICsJCW51bV9ndHMgPSBpZ3Rfc3lz
ZnNfZ2V0X251bV9ndChmZCk7DQo+ICsNCj4gKwlpZiAobnVtX2d0cyA8PSAwKSB7DQo+ICsJCWZw
cmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGdldCBHVCBjb3VudFxuIik7DQo+ICsJCWNsb3NlKGZk
KTsNCj4gKwkJcmV0dXJuIE5VTEw7DQo+ICsJfQ0KPiArDQo+ICsJLyogUmVhZCBmcmVxdWVuY2ll
cyBmb3IgZWFjaCBHVCAqLw0KPiArCWZvciAoZ3QgPSAwOyBndCA8IG51bV9ndHM7IGd0KyspIHsN
Cj4gKwkJY2hhciBndF9wYXRoWzk2XTsNCj4gKwkJY2hhciBmcmVxX3BhdGhbMTI4XTsNCj4gKwkJ
Y2hhciAqcGF0aF9wdHI7DQo+ICsJCUZJTEUgKmZwOw0KPiArCQl1bnNpZ25lZCBpbnQgY3VyX2Zy
ZXEgPSAwLCBhY3RfZnJlcSA9IDA7DQo+ICsJCWNoYXIgZnJlcV9idWZbMzJdOw0KPiArDQo+ICsJ
CS8qIEdldCBHVC1zcGVjaWZpYyBzeXNmcyBwYXRoICovDQo+ICsJCWlmIChpc194ZSkNCj4gKwkJ
CXBhdGhfcHRyID0geGVfc3lzZnNfZ3RfcGF0aChmZCwgZ3QsIGd0X3BhdGgsIHNpemVvZihndF9w
YXRoKSk7DQo+ICsJCWVsc2UNCj4gKwkJCXBhdGhfcHRyID0gaWd0X3N5c2ZzX2d0X3BhdGgoZmQs
IGd0LCBndF9wYXRoLCBzaXplb2YoZ3RfcGF0aCkpOw0KPiArDQo+ICsJCWlmICghcGF0aF9wdHIp
IHsNCj4gKwkJCWZwcmludGYoc3RkZXJyLCAiRmFpbGVkIHRvIGdldCBzeXNmcyBwYXRoIGZvciBH
VCVkXG4iLCBndCk7DQo+ICsJCQljb250aW51ZTsNCj4gKwkJfQ0KPiArDQo+ICsJCS8qIFJlYWQg
Y3VycmVudC9yZXF1ZXN0ZWQgZnJlcXVlbmN5ICovDQo+ICsJCWlmIChpc194ZSkNCj4gKwkJCXNu
cHJpbnRmKGZyZXFfcGF0aCwgc2l6ZW9mKGZyZXFfcGF0aCksICIlcy9mcmVxMC9jdXJfZnJlcSIs
IA0KPiArZ3RfcGF0aCk7DQo+VGhlc2UgcGF0aHMgY291bGQgYmUgZGVjbGFyZWQgYXMgI2RlZmlu
ZSBJOTE1L1hFX0ZSRVFfU1VGRklYIG9yIHNvbWV0aGluZyBzaW1pbGFyLg0KPlRoYXQgd2F5IHdl
IGRvIG5vdCBuZWVkIHRvIHNlYXJjaCBmb3IgdGhlbSBiZXR3ZWVuIHRoZSBjb2RlIGxpbmVzIGlu
IHRoZSBmdXR1cmUuDQoNCk9rYXkuIEnigJlsbCBjaGFuZ2UgYWNjb3JkaW5nbHkuDQoNCj4gKwkJ
ZWxzZQ0KPiArCQkJc25wcmludGYoZnJlcV9wYXRoLCBzaXplb2YoZnJlcV9wYXRoKSwgIiVzL3Jw
c19jdXJfZnJlcV9taHoiLCANCj4gK2d0X3BhdGgpOw0KPiArDQo+ICsJCWZwID0gZm9wZW4oZnJl
cV9wYXRoLCAiciIpOw0KPiArCQlpZiAoZnApIHsNCj4gKwkJCWlmIChmZ2V0cyhmcmVxX2J1Ziwg
c2l6ZW9mKGZyZXFfYnVmKSwgZnApKQ0KPiArCQkJCWN1cl9mcmVxID0gYXRvaShmcmVxX2J1Zik7
DQo+ICsJCQlmY2xvc2UoZnApOw0KPiArCQl9IGVsc2Ugew0KPiArCQkJZnByaW50ZihzdGRlcnIs
ICJGYWlsZWQgdG8gb3BlbiAlc1xuIiwgZnJlcV9wYXRoKTsNCj4gSSB0aGluayBmYWlsdXJlcyBj
b3VsZCBza2lwIHRoaXMgaXRlcmF0aW9uIG9mIHRoZSBsb29wLCB1bmxlc3MgeW91IGFyZSBhZGFt
YW50IG9uIHdyaXRpbmcgZW1wdHkgc3RyaW5ncy4NCj4gWW91IGNvdWxkIGFsc28gd3JpdGUgRVJS
IG9yIE4vQSB0byB0aGUgY3VyX2ZyZXEvYWN0X2ZyZXEgYXMgZGlyZWN0IG5vdGlmaWNhdGlvbiB0
byB0aGUgdXNlciB0aGF0IHNvbWV0aGluZyB3ZW50IHdyb25nLg0KDQpPa2F5LCAgdGhlc2Ugd2Vy
ZSBhZGRlZCBhcyBmb3IgZGVidWdnaW5nLiBJIGd1ZXNzIEknbGwgcmVtb3ZlIHRoZXNlLiANCg0K
V2l0aCBSZWdhcmRzLg0KUyBTZWJpbnJhag0K
