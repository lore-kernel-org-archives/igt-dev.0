Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C43C7115B
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 07:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB29D10E1D1;
	Wed, 18 Jun 2025 07:47:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iF0UY3zH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D32D10E1D1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750232827; x=1781768827;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNs9/uXRbCOY3zkywP7t4CUIizWbE3KFoqX7EUjIEYE=;
 b=iF0UY3zHLmBdT+4RaXMHikdIrMhACN9eQvJsoJThkHWnCts6ytol4pOb
 0C4FYyeMGW2NF4iSHVmyrMtdwjkMWzbdau0cKmf28jxwtDFgYeihSHNtT
 1RoAlmZSGlqq0whDc5TdEMij/CIOxHww/B/YT4cqE49i9VHApzrOThnqm
 FkhFrTzSuArBoBy5mmLNIIwfZcDSk6ufGQGqFgoG+Lj9Pu2QBrG1gjg5J
 K4Is9Iti/Sex5OZnbwtSlGXD0wDOD+t01Z9lk2JylvV35l0jv3aH+ExRR
 Bh9ir8jtJLDHzXjQiOCtVOP0iGpKWqnCLy1nJUQO3xCmtFw9oHdIT9Fl+ Q==;
X-CSE-ConnectionGUID: vEWtOXMkR7WNRTMKK+hgqg==
X-CSE-MsgGUID: yF3lzmmFQqGJJM0FQn1/rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63474225"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="63474225"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:47:07 -0700
X-CSE-ConnectionGUID: EznlnPD+TXmxe+T21W/pJQ==
X-CSE-MsgGUID: UxU/kJvtRJu2Z+wqDz9EnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; d="scan'208";a="149151139"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2025 00:47:07 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 00:47:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 18 Jun 2025 00:47:06 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.47) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 18 Jun 2025 00:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LYTMj0JhP8N4xOuywkShUS819ZJ2VZldFlNjRBaWs0dvWV3veSaXqVVcASEt1WpURevbNoeRZjVvpVC7WGWrqG53fvmlRTW9RW4ygNqAQ6zSspKXVrOUMSm/YJwhRZYvi7vdGQDoepyJbidSxn5giusRTDbRZ7yoX9zoKOP7pV92gdrFQlnXRJj+orITx5zlDikS6dpBtfw6Sb2jo7/vA4HAW05koV3gDQC590BaOjr/PATbgvBVgV93rAiBszNn2oGYwCu1EG83zRBsiw6vJRCKDQducNELQV89SCgt8fhA0SDnPwGnRikIkYmXmkj2s2gPEQYrY+GHjda/dCe9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNs9/uXRbCOY3zkywP7t4CUIizWbE3KFoqX7EUjIEYE=;
 b=My+P8MvCqXXJXHJRq0JfGSiEuOchIOc5s4w9KLUqj8KrTjDeWD+K0Hcc/azxKso+R6dk1/KEKdzRARMvUg0b88dUi2nfsSrJW2GJ7XEzheGKOX4fUge8QVjRKBJVbeXnywdNgYqtvpcQhuc0aBOslUj4ZsYY6sw+y5swl9sxkgJLO6Wuq6B6oc1fKw6NlueqeY7a+XOH6FMK+TRAZ4pBp5TBOts2nnwCb6/EOjC7O3f99spVnlhaFZPgcALUmUmk2lcm4G+ZsW4Wzd2JqNk7wDISBbNNqFUGFiSnOd4e0h3ExhiW6FQsrUhZSrV6byCHWbCtp5R/3pmiM8aMEgXEjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by LV3PR11MB8694.namprd11.prod.outlook.com (2603:10b6:408:21b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Wed, 18 Jun
 2025 07:46:50 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::1670:23da:3abe:c525%4]) with mapi id 15.20.8857.016; Wed, 18 Jun 2025
 07:46:49 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>, "Piatkowski,
 Dominik Karol" <dominik.karol.piatkowski@intel.com>
Subject: RE: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip: Adjust test
 documentation
Thread-Topic: [PATCH i-g-t 1/1] tests/intel/xe_exec_sip: Adjust test
 documentation
Thread-Index: AQHb4CSeFzWE+4JookeFAUyPGcS7MbQIid8g
Date: Wed, 18 Jun 2025 07:46:49 +0000
Message-ID: <CH3PR11MB84343F3F5216F4B332AAC4A08D72A@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20250618074227.3660-1-dominik.karol.piatkowski@intel.com>
 <20250618074227.3660-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20250618074227.3660-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|LV3PR11MB8694:EE_
x-ms-office365-filtering-correlation-id: 27b44b42-8793-41d6-a51a-08ddae3c48b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NTUxUms2aWpzcHBHM2YrOU9iTW45K0lneTU2M0NudWZIT084MksrbWtiQ3BC?=
 =?utf-8?B?TE5nbTNLZHArNXV6RXQ2czBCRU90RHZLZzNFMDRVbms3NFRoUVNDUlpjZGYy?=
 =?utf-8?B?TFVyQ1FNdHMweGRMSlBPOFJrcmxFVjI3eDZsOWFCdkRzRURFWHVkMG51ZjBE?=
 =?utf-8?B?SXVFVHVWcHgxdTdsTmtQZDRFc1FEUmRYczlHSzF3STBXV2ZCTGlxRXZaYXdz?=
 =?utf-8?B?YlZMdDh5emJwWElseEtKUHJpTEp1NWQzS0RmUmdacXQ3OU05cU5GOUg5SXFp?=
 =?utf-8?B?QjJUWkNaM3FMZzNzTEJzQXArVWtZSkNsbnB6ZGhaTnJtdUFyMFFQYmUxV2lD?=
 =?utf-8?B?TEloVzhYck5LQ1FkbmZ5M2s3bERIK1JTTURsL1Q1cjRaQ0hlbDJvWkRQR2ha?=
 =?utf-8?B?bzdtWkYvSEVQWFh0enBFcVBNK3ZmcDY5MVI2eDlCQ3grOERWSjF3R0ttYksv?=
 =?utf-8?B?cCtoV24wNGhOTFlnZm92Sjd5QUl2UFFMMm5NOWFtZjZHMkJqVlI5N1F3aEdu?=
 =?utf-8?B?UVFJcEF2bW1PKytrTmo2QlpIUk9yVXptWk1iekxyM0I1dGJLNG9XMzFjQ3JH?=
 =?utf-8?B?aVlWUDlJK2dncnBoWERLclEwUHE3VGJxNHRXdUtVOWxGdmRFMm5pbnN4aDNK?=
 =?utf-8?B?OHVyZ1BCRUt6VFU5MGlaT0ZxRWo5MHYwK3hmZFpLa1l5YkJmWllsNkQ4ZTQv?=
 =?utf-8?B?a3llS05JcXVnc2pMNkpFMlY3c0VhdHFnUUptS1ozNmVMS1NrNHpJdFJlcFNq?=
 =?utf-8?B?V2wwY0hhVXRVZ055R3FvWnEzaWNwZmlrUGtKdWRLUHdZdk02cmRSU1E5WXpt?=
 =?utf-8?B?STF3cWk3bXo2M0cxcUVZRy9sbjVudDlWeS9yUEQrYWlOemllbEdSeDBvSjFL?=
 =?utf-8?B?OHh2QVJHdWNFK2ZIMGNaUUEva1lpVHYwRzdTeWdsQ3RkZ2xIUzdvSDdaQmNV?=
 =?utf-8?B?T1dyWE10VjJybXFGNjZZS1Y3b2xxUisvYjVNcDJqZDRybldpTnhJYnNKb1BW?=
 =?utf-8?B?M3JZT3lOcU1PMzZ1Unh6MzdoMHBUODU4SXJiMXdFRmZTS2EzaFJuc2JwMXhW?=
 =?utf-8?B?Z1lHQTA2YitSMTh5VFA5V3BaRjdhS0x0RmpGOHFzVjJLVk5HQ1NVSUlycFFI?=
 =?utf-8?B?U2o0OVA5cUdlRjF4T2pPK1hHa1YzSXpUUVo5ODBnL1lhNnhoa0syTWxXSjNk?=
 =?utf-8?B?YmtnR05NQ2RVUi91NXZsYkgwZ3htK3A2L3MwSHIrMFA5TDhRMTV2cnhVV3BW?=
 =?utf-8?B?NTZGQXBrQkVJbGZrQUZKRVRpMjJFRlQyOXJqNVZGRXZscS9Rb3c5NUZ3NlpF?=
 =?utf-8?B?U2ZMaVNuSGFIc01SMWZvYk1HVGx2R2VaM3hpTFJLaVEzT05kNWh6cFpwam8v?=
 =?utf-8?B?ZzhJWmJqcXNKazlyb1o1di93bmxXQ1duNVFRb2pxTTUxdnlZeDFmUXAwQllT?=
 =?utf-8?B?OTk1VG0rUElVSnVHZzlwejlUMWdpQVFTemw3d3V0TXk0cFJJdnVTUDEvbDU0?=
 =?utf-8?B?V1g1ZWpqYzlPclY2cU5NRkswRG1HN1o0VjVwNmpBdmZOZTZ0dWJMbU9zam5l?=
 =?utf-8?B?R0RuK0JIQTRCL280YkgvTnMzek1ZRUdkTWF3blF5WFJQOHlaNjEyWUkyVVRz?=
 =?utf-8?B?MVpSL1ZTYkJLZ25QR3pVQVVPTHZueS9XWHBGMk9jWFc3WWdaeUdkVnh2MDEv?=
 =?utf-8?B?Y20vMGZMWHgyVjdwVGp5RjF1cnFscTJTUEY3bUVqMSttNVd1YkZwaXd4M1hr?=
 =?utf-8?B?ZmwzQ1lvZXdNa0wxekhwZmw2L0V6QlUra002enkrYmh6RWN3Tk8rOHRBR0VT?=
 =?utf-8?B?dkg2a3loY1d6cHVNZ00rSWZtOTdQSTRlR0lyaTVLL29qUktjbEN6NjhtQXlh?=
 =?utf-8?B?QkozU0VhLzQxSThiQjFiQVdzU0hKa1ZXNUpYYmNrRGsyc0tUS2VvODlrb2JQ?=
 =?utf-8?B?eDIxTGwvZ0xaZVRuOFpud3p6NFRSeGcrYmVnQVdpdmhOTjJ1d0JpWmwwa0xR?=
 =?utf-8?Q?fLJ/bzlo1QbYXJJAgsB7ufQA9G4m9M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckIrRnlaN3BMem9sMXUvc0U5cERjSDlxd0NHVzg5ajE1RGtUNlE3Q1oxbEFu?=
 =?utf-8?B?ZzluZ0p1MVR2TW1vVmMrd1JYWkdZNkJHQUVQdWJPNWcwRFc1NGw4WTFvdTZ4?=
 =?utf-8?B?UWhHWFA0ODdzSHhQM2VjM2l6T1lvdlQ4bVJSWlkvSDgwRkw5ZERXcXU0b1pR?=
 =?utf-8?B?MUVTS0VoTjJKSHFXaTRVT3VjeGMyV1hYbEFhbVJNUVN4b29qdHlDT0xUMC9x?=
 =?utf-8?B?TmZnTnhQOFQyNW9CNkFzZjJ6WjVvcFNJVkNOWXpDcTl4am13d1pDM0NVdFB0?=
 =?utf-8?B?MEsvZWpGMS9Sdms3cFRqYSs0dUlkS2VPK3pjcFBaZ1ZXNHVWYnBXR05vL0Er?=
 =?utf-8?B?ZEQ3MnBBM3JQODV2V2lGaUFDbGtDdHQ5YTZZNmhFUHFXSWxoVFI4RVpMNUs0?=
 =?utf-8?B?MjRwRVF1Mkw3ZlFNc3pQcnZGZzdHQkh5eTlzRXNaWldCekZJbXdBV1R2Rzl6?=
 =?utf-8?B?U2pCV09iS2lFV1cwaGlDMXJLQmpJdFFnUllnNkQxUjJ4ZUdMaVR4OHFDUlVT?=
 =?utf-8?B?YjR5T3JTMFV6QlpWV3A5MHJpUFR6ZGZKdlI0MEt2TjhCVW9CYmdEWE5PT2o1?=
 =?utf-8?B?b2Y0TUF4d2RQRkZpNnFmSlZibmZWczlnaXA2Y1UzR0FVelpOYTZUKzdmeUM0?=
 =?utf-8?B?RlpBRjUvNWR0c3hIL0ZST1VFTm0wUFFVK2RTdUl2bHNReXB4aCtSYmFRZmFD?=
 =?utf-8?B?UmU4UlA0M0RUWlVtd2F6MVhrWUFjYUJEeEFuWnp4REhCQlhsSHZadzVEb0xE?=
 =?utf-8?B?dVlvOXVDcG5PMGlaUisyS2JCUThZeE1Yb1FENU96QzlUaXdzaldMcCtzZzk4?=
 =?utf-8?B?NGZCK1RkVkw0MHA1VEM1RCtEWnVuTUg0TjRNZUNVRjA3S2dRc2FITEk1d2RS?=
 =?utf-8?B?V3ZUR1EvNE5xQ2JiakpDQXA0a0Y3dklhR3NvblR3b1hvWHNFMmhiSlQvcThx?=
 =?utf-8?B?NTdpeVQ0VW42SVRnZXpDOEtGOCtmMVArbjFGR1VQNG5yVXBGV1dWdld4VUo5?=
 =?utf-8?B?U2pxbWRzTXp3ekRFeUZXYWtqY0M4czJBTE9ZRWhvNVdmTE5na1hLa0M3Z3hj?=
 =?utf-8?B?WWxQRjVvbDJlUmRVM0p6dWZkdUZKVFVUWEw5S29FOVJrR1VlQUd1L2FPV2JP?=
 =?utf-8?B?bzNMdlh6OVhsc2dUNXpjQitKQm9ZUlo2UUpWd0RCVjk2RFdTaDlHNDk2WkNZ?=
 =?utf-8?B?NDRzN3QwSGoveGVYckZuVnduRzlkVTkzZmVYMXN2Z1BYM1pXYS9RN1Z2WlJu?=
 =?utf-8?B?WnFwWjFzaWplYU5uTm4rdjVGMUlCUzJRKzhnNXpUOVZROEEwU3BaemRiRWJn?=
 =?utf-8?B?dVJ0MDhSd0ZCSHEyWmN3OVlFWENUQzlyS2hYNmZUam9weXFWUml3VTZSZldE?=
 =?utf-8?B?MFIvaFZENElQaExGQWNOWmMweSt5dFNRZWliN3ROSyt6a2Fmd3J2UnFvVW1P?=
 =?utf-8?B?ZGNkTlNJM3RIWWptb1NFQi9FSlQzRUFWajFXRG1TL1h1YTlHMkxoZU0zemp1?=
 =?utf-8?B?SjV3bk0zMTV0QkhhdXZEM3dwV1UyMzA2M211T0tWenNJZVRRcTJPUXo3bGZG?=
 =?utf-8?B?R0xpY3NMQmZsR3l0WWdBZVpBZlJSK2tHeU50aHI1RjQ0d3BvdUVxSGRmcUpL?=
 =?utf-8?B?NERqdDhTSkhFUS92cEtRUjllbllDcDIyNythUlJpOGdWLzdYYjF3K1BtZngz?=
 =?utf-8?B?TmRnY1FFTXNuNHNXcUEvSzVqeW5BaC9mUGhzaG9vdmxMSXFJSnhoM3NPa1lF?=
 =?utf-8?B?VW9CdVNyYkxOL1pSYTVwcHpucko4ajdlK0luTkZsR1NvODljeGR6aDBzSWtE?=
 =?utf-8?B?NXlxbFdKZTZ6cVY1SU16REVoMDdLNUZMdDU4dCt2aVh2R1k3V1U0WDJRK2lS?=
 =?utf-8?B?NzJCZE1JcHlmejZCL3I4VVZjblZDbk13SGlPU0ZUemt1VU9jRU95OHF4ZHdX?=
 =?utf-8?B?UHdyQ3FsRHljbC9PSGY2MmppS0lqWlNvSklzVjZoUGJMZGJORDFuYjJjN0sv?=
 =?utf-8?B?QUhrSVJFcXdHVHprUWdnUG1RZitEM3UvWDkvbVdud0h2Rk42c1ZZVjFXR1lJ?=
 =?utf-8?B?VzVjaGE5VVAzUFhxeDNsWG9LUnd4eWV2dTRiMUVUSHZzUWxoRW5zYzBuaFcy?=
 =?utf-8?B?Rys4UFRQRXdxMS9aRlJRU0xoVWpEZVAweDBoSFRqOW5pTElUaWlORHVPcEg1?=
 =?utf-8?B?L3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b44b42-8793-41d6-a51a-08ddae3c48b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2025 07:46:49.7145 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IGpNPKn3tZW1ShIipiBtmhP1x0qHXVw8JFKB7dYcB1qG91ePS3SglnFC7LDV/i9ZpeeOBWkVYaoRJkBGlPqOIoHSFvJjambF9bVIdsn1vlM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8694
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

TEdUTSwNCkFja2VkLWJ5OlByaXlhbmthIERhbmRhbXVkaSA8cHJpeWFua2EuZGFuZGFtdWRpQGlu
dGVsLmNvbT4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2
IDxpZ3QtZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRG9t
aW5paw0KPiBLYXJvbCBQaWF0a293c2tpDQo+IFNlbnQ6IDE4IEp1bmUgMjAyNSAwMToxMiBQTQ0K
PiBUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFBpZWNpZWxza2EsIEth
dGFyenluYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPjsgUGlhdGtvd3NraSwNCj4g
RG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogW1BBVENIIGktZy10IDEvMV0gdGVzdHMvaW50ZWwveGVfZXhlY19zaXA6IEFkanVzdCB0
ZXN0IGRvY3VtZW50YXRpb24NCj4gDQo+IENoYW5nZSBtZWdhIGZlYXR1cmUgYW5kIHN1Yi1jYXRl
Z29yeSB0byBFVWRlYnVnLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQacSF
dGtvd3NraQ0KPiA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gLS0tDQo+
ICB0ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ludGVsL3hlX2V4ZWNfc2lwLmMgYi90ZXN0cy9pbnRlbC94ZV9leGVjX3NpcC5jIGluZGV4DQo+
IDA2MmI4MGEwOC4uMzEwNTI2NTMxIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9leGVj
X3NpcC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfc2lwLmMNCj4gQEAgLTYsOCArNiw4
IEBADQo+ICAvKioNCj4gICAqIFRFU1Q6IFRlc3RzIGZvciBHUEdQVSBzaGFkZXIgYW5kIHN5c3Rl
bSByb3V0aW5lIChTSVApIGV4ZWN1dGlvbg0KPiAgICogQ2F0ZWdvcnk6IENvcmUNCj4gLSAqIE1l
Z2EgZmVhdHVyZTogQ29tcHV0ZQ0KPiAtICogU3ViLWNhdGVnb3J5OiBHUEdQVSB0ZXN0cw0KPiAr
ICogTWVnYSBmZWF0dXJlOiBFVWRlYnVnDQo+ICsgKiBTdWItY2F0ZWdvcnk6IEVVZGVidWcgdGVz
dHMNCj4gICAqIEZ1bmN0aW9uYWxpdHk6IHN5c3RlbSByb3V0aW5lDQo+ICAgKiBEZXNjcmlwdGlv
bjogRXhlcmNpc2UgaW50ZXJhY3Rpb24gYmV0d2VlbiBHUEdQVSBzaGFkZXIgYW5kIHN5c3RlbQ0K
PiByb3V0aW5lDQo+ICAgKiAgICAgICAgICAgICAgKFNJUCksIHdoaWNoIHNob3VsZCBoYW5kbGUg
ZXhjZXB0aW9ucyByYWlzZWQgb24gRXhlY3V0aW9uIFVuaXQuDQo+IC0tDQo+IDIuMzQuMQ0KDQo=
