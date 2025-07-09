Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD411C83F03
	for <igt-dev@archiver.kernel.org>; Wed,  9 Jul 2025 13:00:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777389358;
	Wed,  9 Jul 2025 13:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrToGlEx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAFE89358
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jul 2025 13:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752066038; x=1783602038;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=IdD7LLIaG8JLFioMyEQavAJlrMH+rvnFKDFSNBLRTls=;
 b=DrToGlEx+KGqfPMtticMAPhaeeNUIvSQ2lPvWOam4a3nKlt30qDuTNwH
 XamNbNmmdqfvVdfkeaAPeuC0AeTN0ByNvEEZnh39KwW1FCo+Bdx/IoQ9I
 5pkDLtrR7XnbTMRpKNvcIZFYUtCA84/kgIIt7xtYEu7Z+46+XmtDiHYXL
 vJiWP0M5QeALdqIMpYqeG9KivD9RPZRzlzYjX2SDfPCoTlMHYGalgZlvK
 otvYmnDgh3n/w91vjsSYSjgguaQrgxJyUhdKnHgmAH0BEi46cTqhvrvaP
 LA0paI1YyrzP0DAKidyHY+Y0np1WVebvQL4jt16e6ytrBztBcNl0ar6jS g==;
X-CSE-ConnectionGUID: j14YUr4bSPOFPMMUSWfuwQ==
X-CSE-MsgGUID: +8Tf6f+cQGuqQMS2xTtKkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="57991904"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="57991904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:36 -0700
X-CSE-ConnectionGUID: iejE3PRYRICqUIh3a2761A==
X-CSE-MsgGUID: RauwM3itT/2AaHAHnGEY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; d="scan'208";a="155191633"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 06:00:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 06:00:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.70)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 06:00:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gNR9QqzX+vL6XNkgDDefYwKbWtwzy6amJzYr7YA6Sx9gTJVqkVsPgjSRvWEKZt6B87lcsviayFbCKMxcVJyjx0yAe+ukLIlBBjo2jStcXhZ+g3mWbDtZPA6shSgasmLZ5FfI21R5POaBPijVVyEudWj5tEurS75R2CFoNrFOFpae4lWK210p5hkVNut5Kzcuj3uAoCYDlvDMENDv0PHkbE+30d5KpUL4B2ft+VQ40gtxW9xbcwexl9GtPutW1zth2fltKCarjowm2U0rIHdbGWqZruA3Fs8eRPoe9uPaaG4hwmrjwsVMZjHGhx9FkWHIWrrP1cyqiWyMv7Yfp1ifJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYeiwDdJr0S0iMcV37WwndqFByQv8VcAtKHkQ4E27YE=;
 b=r6WRTFj/ccdv+qDXM05kZHyVHSvej1eG1u12V3VfnY7hLI9wlJU9xRBuPjAvevddyAOjMoFdxl5/P1MmOUps0+zQD9WVlk+FiLNdYqkJuC6BSSno0MR+u02fqKj3ur9cZpli0Ck3mMBmO001S16457PiJgM6Lo3cG3WyAbdK8edA5fHXBeBXxAVX+j+M34kwEZ0oOV4+HmansYx4c75suhby8mj5ZJmm2D4HyU9RRcYAeyQZ0ne7A7S4Cc6gKR9GjQ7Ga1F8sM3kIYfTrgAsXgNdnIYgChlxTQ+n+Cf/hCJBp0aHzui8Xpzql+XmFJO09az01xnPzqskzetrjm9jag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839) by BL3PR11MB6459.namprd11.prod.outlook.com
 (2603:10b6:208:3be::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Wed, 9 Jul
 2025 13:00:31 +0000
Received: from SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc]) by SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 ([fe80::eb7f:6dc0:d823:ccc%7]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 13:00:30 +0000
Message-ID: <f930087c-7b6a-4062-ba41-941b9682b682@intel.com>
Date: Wed, 9 Jul 2025 15:00:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/5] gitlab-ci: Update Intel i915 blocklists
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250708152808.59977-1-kamil.konieczny@linux.intel.com>
 <20250708152808.59977-3-kamil.konieczny@linux.intel.com>
Content-Language: en-GB
From: "Hajda, Andrzej" <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250708152808.59977-3-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0013.POLP291.PROD.OUTLOOK.COM (2603:10a6:1d0:1::8)
 To SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::839)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PPF7DCFBC32A:EE_|BL3PR11MB6459:EE_
X-MS-Office365-Filtering-Correlation-Id: 2675c7c6-380f-4564-0504-08ddbee89560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dTlTL3dXSHd6L2MyWE5SZENOSTZPbWN2R1JPd2YyaGlaVk9zTE1xUlF1VzEw?=
 =?utf-8?B?M2FJelNTaGNnbkY1aHlmdFo2dHVCcm5VblNqYWhRS012WWlGSS8xVEJvMDlq?=
 =?utf-8?B?OGw2ZGhwaDNYYytqeHhhb0lwa0dyL29JOFdMVzZzQ3RYVUt2VnNWQmVlTTJF?=
 =?utf-8?B?Qmg0dmhnNUNTU1lmWEhzOUtENzN1MWF3SjQ5REluK0p4T0pwNnZ5L3M5Mkhw?=
 =?utf-8?B?RWNkZ2F1Q3R2TGlGYW05dGV1M1NWbmFJZlZVRG51dC9hSy81UEJSNU1GUGp5?=
 =?utf-8?B?OC9pMDNrZ05ta2JoTmZxblBLMUxCV2k4SEdaallJR1hJbzU3VmFLa000Nkxy?=
 =?utf-8?B?N2p4VHVSQ1FZYkFCS29xWE4yZGJoeFkySnpwVnFNMDBDS0VMbnd6Vm02dVhS?=
 =?utf-8?B?UEhnc1h4am9MKy81aEJ2QXhjK2M0c1hRYTIvVmJGYjUwajl5ajl2VFd0dDRm?=
 =?utf-8?B?eng4QzNWeDYwd0xpdU1iazJEWmZkSEZEeDErbUJQSkhvem5GMjlUbWtWY1FI?=
 =?utf-8?B?ZnlyNHo3elh6ZVN3Tm9Jcm9laDlDUUtFUnQ2MHJvcXVyZjBZRzI3RENNN1ZN?=
 =?utf-8?B?UHE4VnpwOGY5SEhkb0h0cjB6eVMrZ2cwbjZIMWRhOGlKTm83OW16VWhMcVN2?=
 =?utf-8?B?TS8rYUhSdzRBRkZvaWFaWWI5c1FmUGhIaHRBL0E2NTc4MDFwRWdUTEZjTnVo?=
 =?utf-8?B?UmRNMVpia0IzN3NZY1VCbkk2NyttTFZIdUNXcWJWSUZFV1pQVU8zY002MFBY?=
 =?utf-8?B?QWpwNlkwY1Y4T0dDTGdtSXY1WG43ZVpBQmlob2JvTjljV2pRenRRVnBjR2xY?=
 =?utf-8?B?TUZnR2pMWlN3dmc5UFAvK2dRNEZOUG5ocnRQZUhvV0w2TlIrb0xFVjFGRi9V?=
 =?utf-8?B?dkNWMGF4cGduK0I3N3pNdFlhSkQvYlNHVDdZcWFLNGU2alIyWlQ5UjZFWWVC?=
 =?utf-8?B?U21OT2J2QmNGS0k0YUxTU2h4ZFJZN2loUXBFV2NYVi9ibmVNRzFseEorY0FV?=
 =?utf-8?B?QllnZ1BjTVVzZU1LOCtsWklWK1lobW02ZzV3Q2w0WjAwYkJ0OXV2dXoyaXFQ?=
 =?utf-8?B?bVVqWnBjMTRFdDlJQ0FoWk1iVnQzTDFzWlJzck56WFlpNnZqdkRSckZOQjlJ?=
 =?utf-8?B?Q3cwSkJkSzFWWHE2T1p3VTdvMGhYSWo0REZHT3FoNHAvbEFySEJ6bzVLd0dQ?=
 =?utf-8?B?eWt4SEdBeGRQZUFycDRTR3hvS01pZ1MwWFRoSk9OSk5NVDVTMktFMzFPaGNx?=
 =?utf-8?B?c0tGM2lYd3dtbEZpSlJhZU9jd21iZU9CT3h1Y2tjcC91cGE2T09sZnVnemt2?=
 =?utf-8?B?dEVtZ0lsYTQxdGp1N2g5UVRNQnhwQjlZZFRGZVFGaGdoWWFtbHRKdUdRUmhX?=
 =?utf-8?B?S2g1dVhZY0pNeDNlaGJyOGdLQzRsRi9vM3ZNT2NERFIxaFMwY3dZeitUR2Zh?=
 =?utf-8?B?VGJ5eVBBOUQ0NGRiR3hrS2dwK011NCtGK3R3TDgxSElFc25rT2NZWWVnTlRr?=
 =?utf-8?B?L2orZkRUVDZIREw0VFFCUzlRNFI2RjNsMkNVWnNnS3dlMitTbHF5TktxQUtV?=
 =?utf-8?B?QS9IaWJhQ2U5b1pSUUVtbVhRKytkWkJ5SzA4MTI5d0tyWHN5N2JCd1ViZDUx?=
 =?utf-8?B?ZmtUUzJhNUVIQVNUd2h6UEthWDQzbVloNzBibmo3dXJXNnRvMnJnSDlqZ2wv?=
 =?utf-8?B?Yk14T0VBQktRTFpGQjVudTRoQjF3YWVFWjFXM2RuWmJoNFJSdUo4Ky9mWVhj?=
 =?utf-8?B?YlprUVBBcW5tUlZrRjBualV0Uk4weXduVSt3N1EwcE5PUGRQcHRQZUVacCtW?=
 =?utf-8?B?a2F5bTBpWWp0Vkc1ekNmdXZmVTRXdlpoRDcrM1NTcWpsOTNGVlJ1VTNlNVBT?=
 =?utf-8?B?UkZpeDM1emFuSWttS0hrcWxGNWxDcUFGeE05cDlyb3FrMzUrdXM0c3c0WkhN?=
 =?utf-8?Q?Xayg4bvq84Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ5PPF7DCFBC32A.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b25RU0k3cVRyU0M3c2R1NkpmTmgvTWY1YUI0NGFIQVJkdVdVaGZtNVVTRnNT?=
 =?utf-8?B?RnhPVm1nVE5xczhrTE82aEswWDN2YllLQWE1WGQrd01LVTIzVU5GRnMzWW02?=
 =?utf-8?B?Y0hJbXUrOVFiNjdxVk01MndoQVE1Qm00VFlEZllNUVgzNnVTV05sbnp0dytX?=
 =?utf-8?B?dzFLbWEySnJzb0VMU3pjSTFqTHNJMGJ3bzNhWmdEMVZyYkNtS0M3RHMvUHBY?=
 =?utf-8?B?cU5nSlpBckxKQ2tnMGtQSVJpN3NVSU4wSWNDbC9YNnAvOXBibjNlbCs5Ny9l?=
 =?utf-8?B?ZU1BSnhwVGxHQldqckZTU2luQ3hIMmJUeVQ0MVhvZmNNVWgzWGNiZS9uY3Js?=
 =?utf-8?B?aXhJMjNtTlV1d0h6T28wRjd4OHZFN0JqWUlLREY4cWxXOSt0dzVRNit2M1Fp?=
 =?utf-8?B?blNyUWpJZTZ1dkhjV29TUjJCd1JaTkt3M1NaMERyTS9WdWVwZGJ3UW5oOGNY?=
 =?utf-8?B?K1FKWnA3NDF6WVdCRmNPeEdzdW1BR2U5eHVsdStLMjl4Z0FMWnB5UzA2TUFw?=
 =?utf-8?B?MmZpU1NtTmhvR091YWk0Z3dGTlR0ZDVIRTlXVUJyS3lxNWVTUVk0T3FoVjNp?=
 =?utf-8?B?RzlvSERyNzVnc2s5ZzlJWGZmTmoyUGRlYVdERm1VNHd6bmFOTjNyTlBOK3dI?=
 =?utf-8?B?a0kzcldrY2dtWXJMZ0x3NnQzMEh6T1NXZGpDYkNUZjc1MFU4aU14bHNBN0pX?=
 =?utf-8?B?UU1rTE9DVVRSSEpiNHNxOVdFdERRYkxrNjJwY1V4RDlGNWdicWJVQnVZR2hm?=
 =?utf-8?B?OHZUWWg0SVJmcHUwV0UzQ0VGQ0g5T0RLNkUxU1FHR3BuTGt1OEMzeDg5dEhj?=
 =?utf-8?B?WjB2elVTaGNIb1E3QitSSDhaMDVjdnpmZ0tDYVE1NW0yTWJBaSs2cFFlM2hs?=
 =?utf-8?B?Q1FKZnZaMEVqYkJMRkErWXRXU1hXanhxODV2STZ5VmMxWmszVWk4N1hQOTVF?=
 =?utf-8?B?TFV0TkEwanhlT3RuQ3hNUmhQdUp5N2NlYlk0R2thTm8rM2Z0eUo0VGtYUUQz?=
 =?utf-8?B?VXhuRXRheFM1QVdrb0puRHowU2orRTdaeHF0Nkpxa1o4aHJRLzdTSHNXTm1w?=
 =?utf-8?B?cllNYmVXNUdNK1Z1bDB6SUlKeE9LWDdFODB3YlY5V2dNTjlsWVkxc0Z6Um5P?=
 =?utf-8?B?cXUraEZBbzkxU05zVnRFbEcweWJmT1Q4Mng4K0FOS0UxdGp6T0NWM044bmUv?=
 =?utf-8?B?USs3TTNqODZ6OEtWVFB3MFFmNWZjQnV0SnVCb1ZzK3pFTnVPaDdpSy9pVjBW?=
 =?utf-8?B?RmhYUEUxNUlaT3Y4emcreUtXS3dRVXdjQVVtMHNXSFFWTmZxaENkZVNIamZQ?=
 =?utf-8?B?QmUrbkhGVlNOVXhSdDNYK3NZYmZ2ekhyckpGZ0tUK2pJQUxVKzVxTCsvSVBF?=
 =?utf-8?B?dEh6cWpkRUhwN1E0eEVKVnl4bFhtSmZPWkh2ZVFYR20wTzdPNUZhdk9kQ3ly?=
 =?utf-8?B?RVJNbHJrSjdyWHFtVWw5VjI2VGcyeXRodmE2R0N1OVBydnFOVzF5aXlLL21V?=
 =?utf-8?B?Y0QvTTFuUExVT0wzSExrNlN3SlphZ2c5QW9mMFRvOUNJWnQ1YXo0eW1ZVDBo?=
 =?utf-8?B?UUVPR01INUdTTjJud21DVkJCanlleGV0K09SYks5WFZOSEM4MVBSZEUzSEYr?=
 =?utf-8?B?dnQwRGhxZFl5aHlOMExHRW9mTmdkNG5VeklKdFhwUXd4NE9NazNWUnloNTVr?=
 =?utf-8?B?YkE5S1V1eHp4S0krc1JkVldHOUpNQ25XRlo3am5uQWg1U0ZQSU1sTjVOdmRB?=
 =?utf-8?B?dWw2MGV4U3ZXMkNBWG9Va0RTc0FQRlNZeG80dFFSS01vUnkwOEhqaWRmUHdn?=
 =?utf-8?B?bzBpRDFYMWRTN0h3MnRWU1IyckhIdkxGcXRRVmtyd3FiRVJyazZlUTZaYWF4?=
 =?utf-8?B?YWtFK0lySC9ZdWE3TVBaS1JmSmFBMWpYcW9Gck93OFBtN3FJMk5xQURKRUdu?=
 =?utf-8?B?U1NQM3BJZTJrbWFIVXc0YkxZU3czMDZnTnJCSVRZamNmWmNZRXUvMVd4eFRV?=
 =?utf-8?B?VEF3LzIvTEk5K2hXb2lFa21rU1hrQjBzUzYzbzBFL2U1Y1NvVUNsclM1bU9E?=
 =?utf-8?B?dDFjeUVoUGxvczNXTDR3YVNLeGhSeWRPa2tPREs2aGp2WEJCeW01MVRialBi?=
 =?utf-8?Q?c/PP+MCbjqSDvOwrhSIwgI5q8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2675c7c6-380f-4564-0504-08ddbee89560
X-MS-Exchange-CrossTenant-AuthSource: SJ5PPF7DCFBC32A.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 13:00:30.6931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofgg1M4zjJbXRlEbqK4P/xv8GrtlD0hWPoNDcG4jvvqJaeMV4gHdQ5wbu+K1HvorUSffv+qOxy3xZ5eimxzg9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6459
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


W dniu 08.07.2025 o 17:28, Kamil Konieczny pisze:
> Update Intel blocklist names in runner testing.
>
> v2: drop xe as this should simplify change, also
>    there is no pre-merge for xe (Kamil)
>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>


Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards

Andrzej


> ---
>   .gitlab-ci.yml | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 637112e4e..8098f2b70 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -231,7 +231,7 @@ test:verify-blacklists:
>     dependencies:
>       - build:tests-fedora
>     stage: test
> -  script: for bl in tests/intel-ci/blacklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
> +  script: for bl in tests/intel-ci/i915.blocklist{,-pre-merge}.txt; do scripts/verify-blacklist.sh build/runner/igt_runner build/tests "$bl" || exit 1; done
>   
>   ################### DEPLOY #########################
>   
