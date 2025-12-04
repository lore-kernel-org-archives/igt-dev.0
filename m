Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D24CD20688
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 13:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2155D10E964;
	Thu,  4 Dec 2025 13:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I9GC91L+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6290B10E964
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 13:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764854945; x=1796390945;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=AuKCQ02G2a3VnLdESepZJ0oCVov0YgjP2nLsK5PVZYc=;
 b=I9GC91L+rsHR5z6/fNvMaovI2E+V1geOEbXY44kMK9rVwNvy5Khhr4yB
 yxIXpWR6c5GA+RBAaOOyV5CVsFoxE/qoZ4EXVlGnY/OxqV/5YWa+ZKUwO
 iPkMIsOsF1IgDFWB4iJX+e5fo04I8cvTugC15osmjUL2uy8a1x3936bUe
 RRt84fkc8oBSNZE3AMR6mzyG0Cc3ZbtjWnQEQtEEmyX07IAzdH0ZaBnJO
 aopK902WtTMWTImBCww/we4aMP9jeIN4tSDqE1Z5ZAUtsCfLesgYpTx3O
 B9E+T44vqdUgRt2pakeGsxUcTmt91w0XXiXCuHtaLPiqfJIzyhgEvchRr w==;
X-CSE-ConnectionGUID: O/PaJWpPREyyvKmvcLX6Bw==
X-CSE-MsgGUID: gGUohNf/RPObtvIA61fVWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77554008"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="77554008"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:29:05 -0800
X-CSE-ConnectionGUID: zw/uI5WkTuqNWu3KNofI5A==
X-CSE-MsgGUID: rcP+Hjc6TrCT+HeYKsLXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="194053525"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 05:29:05 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:29:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 05:29:04 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 05:29:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IhV654AXg2fGWzZDqn/D5U+Khvhqje6f+a5A6+80zuyQUItDYKkkaoEGl+6PdCh3zwIC0g7FjlkwcxVVmYtMHCpyjxaVEb+zU5TpPbwmY0J65UGTHyRtJEnBxYsDQftzFQU8aZ2pFCzAZEZP8xtN5syuy27hjR1Fu5i1ehF2cdlFr3gp6xaVqgZ+Iv1KLHFfRlXG0HGp8UfpNiu6c5rrbCUmpnEP0Ruc6GDuzNAfv6FU7IYNvag6JaCKBkRdyQ86aW73jsHa/0tZL2qaft0Yvx6Zz26vzogDnb86eqsDkjueGJN62u7dumQOg394vNRNpNxHkAJpHD3WTMt9tyu6mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuKCQ02G2a3VnLdESepZJ0oCVov0YgjP2nLsK5PVZYc=;
 b=dv5RD1535g2Vi1kppqAs9YHdd9mMLLaWW85jrjVCEJVn+ekd60lI6OA+HxBNupeaX6WFtzcYWSuDkgVbMiW3t26Oh/hQdwdPHXL/d1F0FezsQ3KgiQgxZztaikqZoCsp+vMWAYQyJatiGe2bEDmAaWiCr+Ytx9eh+keCeCkxDnvUmaGVzZUTdp1yY8f7MWPnnjVSLbK7ec3/MJGfjbqTrXvS4C/wskdpESaj24nC2AVM7b+R7FqRTRzgHrzkC0UvgAdLxZVPBCuptID5MQHpp/r/XuG3matPgAsyuaB8e6LkseLd/xu4TsWqI4RtNwttL1KGVVtYYWvZsOxwt7gPiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 (2603:10b6:518:1::d33) by CO1PR11MB5074.namprd11.prod.outlook.com
 (2603:10b6:303:97::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 13:29:02 +0000
Received: from PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04]) by PH3PPF7DB70F9CE.namprd11.prod.outlook.com
 ([fe80::6b12:23d6:2632:cb04%8]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 13:29:01 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v1 2/3] intel-ci: Add symlinks for Xe lists
Thread-Topic: [PATCH i-g-t v1 2/3] intel-ci: Add symlinks for Xe lists
Thread-Index: AQHcY7bMviqpqPnJfUSuIE+ZwOYRWLURfHeA
Date: Thu, 4 Dec 2025 13:29:01 +0000
Message-ID: <f6507ad73564f5b74f03130b32d3283e865d33fe.camel@intel.com>
References: <20251202180851.148444-1-kamil.konieczny@linux.intel.com>
 <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20251202180851.148444-3-kamil.konieczny@linux.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH3PPF7DB70F9CE:EE_|CO1PR11MB5074:EE_
x-ms-office365-filtering-correlation-id: affe9392-ca76-4ea7-1961-08de333916a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cTJYSU5FT3Rwc0JWRUdNVHZPdzBFcmdaTWw5TW9tdmorWlhFTmkyaW1zZ0gr?=
 =?utf-8?B?ZXlnY1VsRjFXMFZSYkpWc2hUQjdESnJCMTdEQjF6T0tHNFFIVy80VzVobHNX?=
 =?utf-8?B?WGVYOUNVOGRSSjA0NXAwTjR3Wkx1K05zYUNkd0VTMjVYNGU4cFNUZ2VWM1JX?=
 =?utf-8?B?NWVKZ2xFS2dVSjJ4THNyaDFQS2lnQ0F6QldBc0RkQ01kZVo2bndqSmg5ZnVs?=
 =?utf-8?B?QzZWVmxiN0xWbXY5N3RUbmQ3RVo1MTJMQWk1NW85dGgvSG1sTjUyR0MySkdx?=
 =?utf-8?B?QVRCUE02TFJIM1JYYkw4WE5MNjBSWmVYYjZ5U0FIeDhBUHFYSSs2M2pxK3Js?=
 =?utf-8?B?SlBZc24ySWtEdG9JdzZzaWdGaWt0bzNCeVNqZFdGb3c3a2wxeXRkOEJLRUZR?=
 =?utf-8?B?bjkzTERXaklucEtwNDI2N3YzZmFlYnRXenlKRWpHTDJGRnJCV05LcnYyYVJY?=
 =?utf-8?B?L3FDT2doTVpFdGxISGdLSlhKQktyZUpQbnJiOGphT3plRDFvbGZsWlVhMXJP?=
 =?utf-8?B?YUxSQ3JKR0JlTkpxMjEwTGRwZ3UrbEpvVUJXL0tMMjM0NERwYlBEb1FoajlP?=
 =?utf-8?B?QTdzR3NXUjVNaVR0ZjRhWFpJVXV6QTlNOEdUUkh4a3p0d09ZeEpYVmU0Ujkz?=
 =?utf-8?B?Z3lxSmQrVlhUS0J2MGFaS1NyY2FoY1hqak4xYkdMUFZEYTN3MklMNmd5YnFy?=
 =?utf-8?B?STZvQmlUNFhVOStSeHJaMUxHbHRXY3NaTW05OXE3T2NyOXBuUkduL0N0OUVk?=
 =?utf-8?B?YVFZQ0Z2eHk0dzJqUmV6STBKTWVocTE0anM5Ujl4dHhzRkQwcFJvbkpqclk2?=
 =?utf-8?B?T09mcThZZHUrbUthcURLdWNQN21xZFR0SXNCRHlRTWlHVFlTakY3MVE3WTlP?=
 =?utf-8?B?V2ZhS1BIR1lsUzVRUnd4UGVSR1huN2JLc2JZRDBidTdtZ0hITjJpNytxTlVP?=
 =?utf-8?B?Wk9CN29lVVRXaXk0eHB0cXpYeGd6VkwvVWloN040YkxvRTgxbldEOWY2dWZO?=
 =?utf-8?B?TndnamxUM1ZnZ3ltSHY0WWY4Z1MrcWJxMFVVd0c4WTM2RXNoWDhMN3BMa1Q1?=
 =?utf-8?B?YXpMb1psZmY2Y3BKZ2k4ZWlBMzlZWDYxVnlqS1VWc3pvc3RqYTBHQnhscnFE?=
 =?utf-8?B?d1BPR2xkZk5sYzlkayt2bk9tUFVxdzgxRlFkQktXU2F3MW5wRlU1cXgwL3Bz?=
 =?utf-8?B?dTk4emRMWjY3TS9UaDYyT0pxRjVlL1RNL1hwMHV5YWd3RERwNVdmb2hHMjRG?=
 =?utf-8?B?VzdzUVE5ZitVWU9rSm1TbEpzMTBSME1USHhFY2Y3aVp2OHhTZlcrQk5uaWdl?=
 =?utf-8?B?ZCtQWFRwQjBnN1NyeE14S2krSFYyeTRGdkxVUzQ5MFRibEwyUTJlN1BjOWk5?=
 =?utf-8?B?SjNuelIvOEd4VzFFTi82VWIyNkNRcUFQdWR6V2kyM0ZzVlZKZnl1NWVhLzlI?=
 =?utf-8?B?RkFXZm9XcW9mejVCZzJtdHFqTXlOQmI1dWNva2NjYUsyQzlwL2UvcjNEYW9D?=
 =?utf-8?B?QkhmWHB2TjFFRWFoSzhFdk5XdTB4TjNDWUZUNTJrcHJkT2pZZ2V3OFluZ3lw?=
 =?utf-8?B?SXV0dHNKMVVRY2w4eDFob0Nkci8xUmxaVVFyVnVMUFhqV1pWOGZENWRqSi83?=
 =?utf-8?B?eFNGWllXTXdKRmZPNWp1ZURISWtCbDEza2tydUFQbDdBNzZYQmEzdmp1YnA5?=
 =?utf-8?B?SnZaNk9oeEUzUkVTNGN2SXpCQlk5RTRyaE5pV2dPNkJmYUNxTC8yeWJmN1BF?=
 =?utf-8?B?Y1FYM1N2K2o0SWdNNXhoZ0xHbGpMbkpMdHhyd0w0d1UzMDFabE5RT1B5b0ZK?=
 =?utf-8?B?VlQ0aXdnLzlmVm8vVDgwSFFjMmNYcTE5TDFOYW5SbFkwa3YvbG9uUk9SRnJK?=
 =?utf-8?B?S3oyQ05QNmE3anRNSEhOVnhNaDNpMURKNlRTV0ZHSlFPMUFZRmZnTzJHM2JN?=
 =?utf-8?B?Y1ZzWUF2bW10MUUvNzdHajRvYVpVc3NQTUxvQjZpWXdSTGVpSk9PK3NNdXVW?=
 =?utf-8?B?RzcwN2xCZkxxdnZtRTJwSi9oR09ueC9qN1VHN1dGbi9ORk41NnZ5Z1RxZXdO?=
 =?utf-8?Q?fnXK1L?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH3PPF7DB70F9CE.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXhtSCtQVDBjMDhIRTF3N0N1MHFUd09IMTBhdHJMTGxtM25ZeXl2RlFzUG1l?=
 =?utf-8?B?UjZQOElsWlhNNE5NTVpUblZPS3pGVHFnM3FoajRzd0Z5aERzcndUR1lmMFBm?=
 =?utf-8?B?TkhlWkt6SUIwUzMrd1ltV3JEQjJiVkVDS2ZRZjNhK0ZnSS8zUDdTUkN5cGhK?=
 =?utf-8?B?d2hVMkJJdVdYSjI2TEJDL0FCK1ZmMnZxeTZIaTl2WW8yWXZ2dnFxTEpxUHZi?=
 =?utf-8?B?V0Jlemp2bjJudElyUUVwTVpFaUxZZVpjSENSWEpTdjQ2ODhxanBzaTB4UWNQ?=
 =?utf-8?B?bENRNUhBRmFUWEJEWmlkNzFEVEl0aS91Y2tzR3g0dGtjS3Q1M0dVWUZzT29G?=
 =?utf-8?B?cFYwbVQydnJkQWNXMWNUY1FrS0pLUms3WU52MFJidUNSSXIydDVnOEFNWVRs?=
 =?utf-8?B?OEZoNkdCR0FQSUpISVh6M3N4SUJpYlZCdnVnWXd5VXgxSExYQnRzNjdnc0Fo?=
 =?utf-8?B?YVVIdjB3aDBVb1NFMUkzdDAvc0Y5M05yRWc1QktQZFhrb1lKbU5nYVBmSFpL?=
 =?utf-8?B?YWRhSzhVNStSODdmV0FGZHozV2NTSTFkZWNjYlgzRGdqTmZNMnp3ZnJZMENn?=
 =?utf-8?B?SWxWL0xJdUtYYmlOa2F5TUxGRWhIbjVRUHFZeUxsL3ljMFhnaTNqRFZjcFRj?=
 =?utf-8?B?RVRoaDJ4eGpFdXB0akNmY2hla2RLOUpVU3dmam1DT1hZTVBZUGdYOVU0Zkkw?=
 =?utf-8?B?OXA4UEZwaXJYWjU2MlM2VHJNQlE2d05ZV004MUpDeFE4SU4zT3F2NTcxR1ZZ?=
 =?utf-8?B?Qk16MW1TMzhLb1FKZjBSa2YweVk5UFdtZys1WVk5TFlaS3V3bENRUzF3WW44?=
 =?utf-8?B?N2hMM0x1WVRydTh3Tmd5VHJjb1N4SjJHTTllRi9xdGpmM1JYV3NqS292MUkw?=
 =?utf-8?B?QUttVkNwdXBXYWQvdkYyaURwdzNINU5XMnZIcjVsam1TYjlZUDFNREZsemxU?=
 =?utf-8?B?SlFlVHJnV2dYemtMRkpzeUhlYlFnM1crdnFkS1U5VkkyTjd0UWh4TkxGWWYy?=
 =?utf-8?B?a3RzZS80L29wY0FCUmR6eEVxcUpmTXE3NVBYb0trN0xtR0JoY090YW4veEl5?=
 =?utf-8?B?OXo5dkpMaktSQnZqNDVZNmU4QUZVRGNhZmtnRmM2R3owSzRuOCszZWV4QXZY?=
 =?utf-8?B?NUE2cXJ5QVZqdk1MWDR3SGE4azIvdGkxZ0xHSWZsNnZCL2xjNmh3cnNobnhB?=
 =?utf-8?B?Zkhrams2THV5cU8yeDVIbkNnS0ZoUTUrZWI5QWRZbFBEdzN4NmsxaFFUNThQ?=
 =?utf-8?B?SDd5dXhQNUdCZjFncFlDdnVQcUp1eldCZzlON2c5dnMrQTZCczdWTWZQaHM2?=
 =?utf-8?B?Znc1OVoweUtSaVRKZ2luR1ZuL0IrdVlaNUNHZkxQdWJBMGJ5Y3IvemxZWGw3?=
 =?utf-8?B?TVZ5eGNUZ0diYmlYTDVsamI0YTZFcnZJbEVYUUs3TndtQW42L24yT21ubzl0?=
 =?utf-8?B?K2ZWREJtZk1MbXgyZXoxcm1BNjFYcm1wclNkR2lEb3NvNjZDY2tjamZiVTk5?=
 =?utf-8?B?d0wxQXk2Mkg5L3o2RmU3dkhHZkZDNXpXa0xUeDZ5emFlL0FhYi9HRzdVdENG?=
 =?utf-8?B?T2F4cjlWcFVTYm9hcDVldkxrQTlvdDYxRCtBSUw4NFIzN1ZtZnNFa2Vsc3Iy?=
 =?utf-8?B?cS9XQVRBYzZQSWllUVJXckl2a1YzTjdNN0l4ZlR2aUh1RzBIekFZMHI1em4r?=
 =?utf-8?B?ZVZXVEkxckVrU3JLd0JmTW1oZ2ZLV2pScy9qeS9ZbHd3Y01oZHBoUXR4N2Rk?=
 =?utf-8?B?eWpxeDJYQU53MGtMenJHQkY2Z3NCTmxUVkR3L3dEZUlGVXNDVW8wZGxPdklR?=
 =?utf-8?B?TU1JbHE1R1JUNFVrTm4yNlptTG53MThSbGYydkxRak00Mk1QUU9mSzBod1FY?=
 =?utf-8?B?d3NlMU56eW1WbkcwaGtob1pRdnZMYUFjWm5LQWxTTmw3d3REQUNySlhxZHhk?=
 =?utf-8?B?NVo0UkE0OVBUWnc3VzFveUhJUzhWMUF1WFZPcjNBdmFES1F4RWc4dWQyMnF0?=
 =?utf-8?B?QktpTGh5Z3RheDN5WmFKUThVQmhSZW5ORnJPK0hRdFNkL1p3R1BvK1JNbGp3?=
 =?utf-8?B?MlMzckJNVWFoRzRkRlVwdjlnVytFR2V2QlZkOGx2WUpCeXZEVkFzSFFySHFw?=
 =?utf-8?B?M3lvSGJVUDcvYXpvaDhod3hNVU91OWx6Z2d5dHdNd2NTOGk2RXh2enF5Nzkx?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D01AD35AE5C2AB42BE34FF7227749D3D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF7DB70F9CE.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: affe9392-ca76-4ea7-1961-08de333916a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 13:29:01.8763 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q9FjSyRPcNiBLl31R9CwwUb27qLEh/ht5M7+VAjmE+OtFYTP9WowpumxXktNux4NEeYIsH4vExJktiLwrXgXqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5074
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

QWN0dWFsbHksIG9uZSBtb3JlIG5vdGUgYmVmb3JlIHRoaXMgZ2V0cyBtZXJnZWQsIHNob3VsZG4n
dCB0aGlzIGFsc28NCmFkZCB0aGUgc3ltbGlua3MgdG8gaW50ZWxjaV9maWxlcyBpbiBtZXNvbi5i
dWlsZD8NCg0KT24gVHVlLCAyMDI1LTEyLTAyIGF0IDE5OjA4ICswMTAwLCBLYW1pbCBLb25pZWN6
bnkgd3JvdGU6DQo+IEFkZCBzeW1saW5rcyB0byByZWNlbnRseSByZW1vdmVkIFhlIGxpc3RzIHNv
IENpIHdpbGwgaGF2ZSB0aW1lDQo+IGZvciBjaGFuZ2luZyBpdHMgZmxvdy4NCj4gDQo+IENjOiBS
eXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEth
bWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+
ICB0ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLWNoYW1lbGl1bS1vbmx5LnRlc3RsaXN0
IHwgMSArDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRlc3RsaXN0ICAgICAg
ICAgICAgICAgIHwgMSArDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS1zcmlvdi12Zi5ibG9ja2xpc3Qu
dHh0ICAgICAgICAgICAgICAgIHwgMSArDQo+ICB0ZXN0cy9pbnRlbC1jaS94ZS1zcmlvdi12bS5i
bG9ja2xpc3QudHh0ICAgICAgICAgICAgICAgIHwgMSArDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKQ0KPiAgY3JlYXRlIG1vZGUgMTIwMDAwIHRlc3RzL2ludGVsLWNpL3hlLWZh
c3QtZmVlZGJhY2stY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QNCj4gIGNyZWF0ZSBtb2RlIDEyMDAw
MCB0ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRlc3RsaXN0DQo+ICBjcmVhdGUgbW9k
ZSAxMjAwMDAgdGVzdHMvaW50ZWwtY2kveGUtc3Jpb3YtdmYuYmxvY2tsaXN0LnR4dA0KPiAgY3Jl
YXRlIG1vZGUgMTIwMDAwIHRlc3RzL2ludGVsLWNpL3hlLXNyaW92LXZtLmJsb2NrbGlzdC50eHQN
Cj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLWNoYW1l
bGl1bS1vbmx5LnRlc3RsaXN0IGIvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVkYmFjay1jaGFt
ZWxpdW0tb25seS50ZXN0bGlzdA0KPiBuZXcgZmlsZSBtb2RlIDEyMDAwMA0KPiBpbmRleCAwMDAw
MDAwMDAuLjU1OTBiYjEyMg0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBiL3Rlc3RzL2ludGVsLWNp
L3hlLWZhc3QtZmVlZGJhY2stY2hhbWVsaXVtLW9ubHkudGVzdGxpc3QNCj4gQEAgLTAsMCArMSBA
QA0KPiAreGUuZmFzdC1mZWVkYmFjay1jaGFtZWxpdW0tb25seS50ZXN0bGlzdA0KPiBcIE5vIG5l
d2xpbmUgYXQgZW5kIG9mIGZpbGUNCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL3hlLWZh
c3QtZmVlZGJhY2sudGVzdGxpc3QgYi90ZXN0cy9pbnRlbC1jaS94ZS1mYXN0LWZlZWRiYWNrLnRl
c3RsaXN0DQo+IG5ldyBmaWxlIG1vZGUgMTIwMDAwDQo+IGluZGV4IDAwMDAwMDAwMC4uMThmMGIz
Yjg5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvdGVzdHMvaW50ZWwtY2kveGUtZmFzdC1mZWVk
YmFjay50ZXN0bGlzdA0KPiBAQCAtMCwwICsxIEBADQo+ICt4ZS5mYXN0LWZlZWRiYWNrLnRlc3Rs
aXN0DQo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQ0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
aW50ZWwtY2kveGUtc3Jpb3YtdmYuYmxvY2tsaXN0LnR4dCBiL3Rlc3RzL2ludGVsLWNpL3hlLXNy
aW92LXZmLmJsb2NrbGlzdC50eHQNCj4gbmV3IGZpbGUgbW9kZSAxMjAwMDANCj4gaW5kZXggMDAw
MDAwMDAwLi4yMDdlOTQxZTcNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi90ZXN0cy9pbnRlbC1j
aS94ZS1zcmlvdi12Zi5ibG9ja2xpc3QudHh0DQo+IEBAIC0wLDAgKzEgQEANCj4gK3hlLnNyaW92
LXZmLmJsb2NrbGlzdC50eHQNCj4gXCBObyBuZXdsaW5lIGF0IGVuZCBvZiBmaWxlDQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC1jaS94ZS1zcmlvdi12bS5ibG9ja2xpc3QudHh0IGIvdGVzdHMv
aW50ZWwtY2kveGUtc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0KPiBuZXcgZmlsZSBtb2RlIDEyMDAw
MA0KPiBpbmRleCAwMDAwMDAwMDAuLmQwN2QyYjMzMA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L3Rlc3RzL2ludGVsLWNpL3hlLXNyaW92LXZtLmJsb2NrbGlzdC50eHQNCj4gQEAgLTAsMCArMSBA
QA0KPiAreGUuc3Jpb3Ytdm0uYmxvY2tsaXN0LnR4dA0KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9m
IGZpbGUNCg==
