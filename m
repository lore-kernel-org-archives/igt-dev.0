Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D1AC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 13:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69EC610EA4A;
	Fri, 11 Jul 2025 13:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iu0qikKN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FB410EA4A
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 13:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752239104; x=1783775104;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:cc:date:message-id:mime-version;
 bh=6zT0Y8wO1gnyTS2huCe7ZR2qnNof6B7PN7KsKSs6ZLs=;
 b=iu0qikKNFZhmvGkk6v8ZwE4Pirh6/xi5Sr3YJbPdTopIkYVprApKr5l8
 9SgGz49miWasYlUcgLVF69ASB3JHAT3z80ZrkvE7LBe8ACZzlvVGS5+uD
 2/nRJJBM6SqVr8r2TdjJKb/dzprCzAhaoBgDy90J4CRELhHugMmH7mlCY
 e1BnErydiX3hl9xG43AAp0CmVn4gKOsQVBotryPEGCqOK1bdk8NMU37fx
 ymBPiD3sbjsb919KhfeRHODF6NTDgZ8mKyvhzb0FBdh9rB5gWGDL6s0dn
 HYbdNZlkQSVU8CEWQ4TwuIQRJQg3RL32LlprpwUjbTrZOpCRXD5a9HzVP g==;
X-CSE-ConnectionGUID: Pfbd8eL5QSOIu2JmnDBIhA==
X-CSE-MsgGUID: 9n8JURUpTMKXTaRPTs81Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="57149314"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="57149314"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:05:03 -0700
X-CSE-ConnectionGUID: HRLm9TZtT9q7EC6klObUyQ==
X-CSE-MsgGUID: btnFU5faQva8y/XH9KVVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; d="scan'208";a="161929548"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 06:05:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:05:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 06:05:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.50)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 06:05:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wABKIkNXkCJ6jjycwEEJVdIER+8CjDTWmJJDdTPoSEcwtqi+JCzWuXJk+1M4O51bhU7GSjWX5RIfQh+iAOXOb5VWOcylMfoY98li2crrOiC4PU4B8r2Vq6igPt947dEtEmcqmBDrx9OSwRBp/NO8eYdE8lp4WZbOOZppxVLJ/Q0Pu/QP8eSHI2EQCyTY2Enx1gGaCpdktB3WyIWejW51pYJ5/DJq0rwPXv0V7ZVSLNldEINdK9gEYjrrVfvR1oNwpFfPACs0x9otNZAg5wDmGswVgT1E7A71jQ1NA8A4v2FrZHo293xBEwXq9UdaOpVEBoiDH98FMMx+BPVsbc4D9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ld9tF5x5+gez/Ro8/AnTpb1S1cCUVb/xes34nhgKTm8=;
 b=GfwBq7y8JztqaPglQoI1732+nQjpoxKtiAfLstZOSddj4vmgbgipoRNYM+FQnVe4KACEsWvHw7U+rdhHj1evHGZqTLW7s1blR5fhni1wzf1kN8GMYEG35I2y5Xztx0iVcjfPMFSyKbjUoH7xl8UUSfCXeBMBMXICAZuXNBZ/Nz3vSaED6ll6ZsaxGv31ISSDxwK12a8mMfnntyNqgKKZiEgVjb/nJbgR1rNRw5GkpsAq3dZzFYQQ/MtCbZv2dsvJimXaSd1xeNZj0wtc8ZPyJLdUfcvVWVt5b7VSznxs78gnBbaOZX3mAUnb/vQvL4KbzGnyLO5XUs/x99FmWzUDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 13:05:01 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8835.026; Fri, 11 Jul 2025
 13:05:01 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250703150304.101208-2-peter.senna@linux.intel.com>
References: <20250703150304.101208-1-peter.senna@linux.intel.com>
 <20250703150304.101208-2-peter.senna@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/2] igt_core: igt_hook_get_pointer() for external
 hooks
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 <lucas.demarchi@intel.com>
Date: Fri, 11 Jul 2025 10:04:55 -0300
Message-ID: <175223909559.2061.10833444579370175525@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0280.namprd03.prod.outlook.com
 (2603:10b6:303:b5::15) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 5520d1aa-d379-4e93-be8b-08ddc07b8b26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Uk9tK0VvTjhvQTRGeHlrMlJURDNGWWdNTDJlVXBYMGxjUzFXK1NRS3huYTZD?=
 =?utf-8?B?UGdZaXp5Vitpa0VoV0JtYURUbnk1ZDdYVUcyRkJFcEZWZTBQZEJCM0c3ZWhm?=
 =?utf-8?B?MFNnUlVKQ0lWVkxVWktzckd4QWIrVmhCNFg1aEFrSGpDTzQrTkxzN3ozaUlQ?=
 =?utf-8?B?djkvZ2tyRXZ4Tm1LcnQrZzREeDV6ZGp1ZGFqNFFRckRwSlRweVZKa3plUnVz?=
 =?utf-8?B?V3hESCtXVFZGeEJLaWpWZ002cVZTa1JQVVN4VW9xZkRZN1N5ZGprVnBDN093?=
 =?utf-8?B?WXEvanlQZkdtTDJYL21DVytZU1RNazNuaUlmdDEyVnRFamp3c1liajZ1czZC?=
 =?utf-8?B?VWlrVWJNbHhsOFpSc2t1M2JUQkFhVkp4czVxenJnOFhzZWplZnlZelI1U1VY?=
 =?utf-8?B?b1VWeERYRlBvd3hvOUkzT09FSkhQNmtqMU54QllndkEvUmJnOS9DUzBsc2xI?=
 =?utf-8?B?cmtoRXhSRmljb1BzUGc0K0xSNmUzbGl3NFNMZmhVUWtxS09QelhnRml5VE9t?=
 =?utf-8?B?aitjQXUrcnMzQXBjR2hJWGhsbEo4bmhiY21jdHhScnBmWTdWQlpFZEU0SHM0?=
 =?utf-8?B?dXlxTlVHMzd1YitmYWVqSEFCTVpkOG9KT3pHK1IxbXBBWXRWWDcvNXJPd2dU?=
 =?utf-8?B?T1l3MTR1VVV0QjZFcWN1dGRlMHhzR0tNY3o5R2s5ZE1UdE0wOEZrK2VvZVhM?=
 =?utf-8?B?R3BPV1FjZGZBc0ZFamJYdUNSdHRCMHRSYU5nbHhCcW5lOEw3RFAyYmlHVWJk?=
 =?utf-8?B?bkZIYjRXcmVZckthSFJYdy9XS1k3c2p4UGpCdGZRU0JFazhNaFU2Vktod2FP?=
 =?utf-8?B?OVdHU3FuNVEvTngweXk2QmlIK3hGREdJdVZSWGhDYy8zNGJLZ2hvQWE3aDlX?=
 =?utf-8?B?bmNxNllQSUhhSlNjMUsxa2N1QTF2STRUT3J6T2FMUDJxQ2kwODJ5bDlnSmxz?=
 =?utf-8?B?OFFvVEV1MUZzUTRoNnB6bG5URmR2SnEzQzlRcHpueCtTNWJDYmxyMlU3WkRG?=
 =?utf-8?B?ODZrbzJaNFBRUnNvU2REYmxXNVFZTXdzaUtES3JHK1A5WFhCZjg2MlVPRkF5?=
 =?utf-8?B?SXR2OXJtaXk1WnN3V01vdDIwR1ZhcU9EVlJlMFE1eUtqU3hNN3M3NlRreCtH?=
 =?utf-8?B?VEVReFNidVc2cEdQR0xCeUIrM0NrQkZtTGZINzVlZUFGYmFCQ3ZjU1JIMUUr?=
 =?utf-8?B?L3ErbUYwTWpaeXR3clJkUjlkVW80bllyL0MzRm1zUmUraEMvdUxzQVpjSGVB?=
 =?utf-8?B?S0t5VjUzNDBnTHJDZGZaTWF2RWxIcDRjQVlYZGxmQ2Jmc2M4RUtxa1BnNHJx?=
 =?utf-8?B?LzNmYnV6R2g4N1BwL1o5THhzR2V4ajM2NTZpRkFQbUJVY1lXT1djVFhwT1hS?=
 =?utf-8?B?a3l4NXdGZnJSNmNsL0ZwSjVrYmxWK252NUdRMzFYR1RoZFZXVGxoUXIwK01W?=
 =?utf-8?B?aEJlSVZIcE43Z0lWSUp5NVVKYkprNXRublVOYTNOb001ZmtHK0JjTXNPODAx?=
 =?utf-8?B?RFFrMHhOR0tOaE8vRDhoMHRpWWhtWHFyWmVNZFB2bm5NWURsaTd1NG4wZDJ4?=
 =?utf-8?B?Um9qUUNNK3dxRUQxeVFIamJWUU5RK3VleFFTRWxtbWNReUtVOGhFdUh0dXpt?=
 =?utf-8?B?T1NhQlZ1NS9uOGRUK0pJNEJTL1dvdnczczV3bnRQeVJBOFhGaTVoR0ZOVmtQ?=
 =?utf-8?B?UTcvMjdYODRxZWp6TDlBYXE3YVU2TXRkR1BlTVlUNlMydkQ0bUhsbEpydEpm?=
 =?utf-8?B?bXJ5aTI5S3VLeGU0Smo5NC91UkxubnlwTlNXQWdwZjVVUUdoNjJSbVRvWUdl?=
 =?utf-8?B?eWVDeVYvZDVsZVRqRmg1OU9jV0lWY0F4YkcwZEIxMDI5T1hBNk15UStIcHZC?=
 =?utf-8?B?aWRZUWhESGtVNXlucS9KZmRZMjZIeThaaHZYK1FvV0pTSzJqZGpVaEFQTVcv?=
 =?utf-8?Q?rZGPmM4/dGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0Y2VnYyNXhaSkFmV3dEQmJvc0cxVjNqdzk0bU94MFJCMDFrQVBpalMvK0ly?=
 =?utf-8?B?RUxncXg1ZFBWUlJxOEVERmZjLzlETWZFbHBsR1VUMFZueU8xTnhVMUZjK2ZO?=
 =?utf-8?B?VnNvM1lzTHNpcmZycnJlcUw2YUJIbzFZeG1PVGNSTEJwUnJXcXgvQU1rUU5Y?=
 =?utf-8?B?ZS8wZXVlSVlUeWNvN1V4RWFSRlZHTGVCYjdoNkpvdlUyL1haTGJqZGlQREh3?=
 =?utf-8?B?ZG5vOVNDV1R0QVlrNEVzZkljTWFMZnlXOGtjRGdJeWd5a3cwVlF6cHV1cGtq?=
 =?utf-8?B?Q1dQN3I5U2daQmg5RnBSMTdHZWU4MUh1RXlFOFlvaEQ0Q3lRNmU5T0syRjJs?=
 =?utf-8?B?MzdWYjNONDdUZVlUOENFRGRYT3NweDYrcWdzS25tY285djNqVnZqV0swRFUv?=
 =?utf-8?B?K0tLSkxRUVNubkRRMHEyQURKQzJ2Unc0cGVrdm5LS2w0WldjVE0yN2xEbW94?=
 =?utf-8?B?TEViVmMrYUNnTS8zTmlXK0NkZ1JJSGx0b2FrZUNlZzFKaDFNTmM0NlNEZEM4?=
 =?utf-8?B?L043dGhtcmdvdGZybFpZYnRvWjlYZHpBM2dHczA1eFpXRy9NMDlYaTJJT244?=
 =?utf-8?B?UFF3WGhhUWZsSytsMG5zNkNIMFJwc2NwZFBmbElGZXhicGVZZnVaRFZyMGJs?=
 =?utf-8?B?TzVUMmtjNGQ2cFYrTnJrc2NlM080a1dialBkUGJsSEl1RCszYlAzWlhsVWVi?=
 =?utf-8?B?V2t6VGhveXRubm9XZlYyUU53S1dsZkJPLythY1VVaUhTZXlVOWFXVFRWVHNF?=
 =?utf-8?B?eTB5eGZQUGk3TXFtT0ZzNUlVNVdWS1dXenZVSDYxc3gvV2ZXS0ZvdDRZWCtW?=
 =?utf-8?B?RmptL1R1WFNYcjZ5WXVWdnNxMlBpdXlKVFNyWC90UVlBUTRFYWNwYzZUN0NJ?=
 =?utf-8?B?c0wrTEdFMTJpSDJFV3pEQzVDYTFjUE5oYkt4UFFheUNIWEVkNVo5NGx3OXYw?=
 =?utf-8?B?RkxLd0hLZE85bzdFQng5K1J2bStlSXFUZmhtejFhbTU3aUo4S3R2VjRYdFlR?=
 =?utf-8?B?QTUrQ2NNWkN4bTFHalJxN2UzdE9kUm9yUnhvY0JEa0FlSjdQQXpsQkkvTHRN?=
 =?utf-8?B?MkVod2U4bjF2VjRRMzl2M2crQ3JWdXY3NHNBamFjU20xRXd3ZmY3dWxMd0Uw?=
 =?utf-8?B?TEk4R0N4cUtnNFEvRUFEVWxZTjREQ2tXNDBLT3pRSlFkZk1HZ1B2cDNscXFl?=
 =?utf-8?B?OHVvV081d2hpZEVLaWc5bENjWVRXRCtjU3FWWjJSdmRlYzhaN21ROE5vV0RB?=
 =?utf-8?B?VHloeEF5eFJBWkx4UVBaVTZZaE82cnk5OXozejdNbEZ0WXNCRGNwaGZQcTVC?=
 =?utf-8?B?eTk0NUNoMlVDeE1RQjNsZjNJbk1XbC9qcTJoVDRPcEprTXVxNVB6NTlQMGxC?=
 =?utf-8?B?d1gyaEZwUHlnSmpjbFJCN3E1SEljVjRBb21VTGU5L3lZNHZxQTJubnVheDk4?=
 =?utf-8?B?U0hUUHRBMUtvMUNPZE9IYytvNDBzckFOM1NBQ2VCRFZPeGN0UExJTmw2dldG?=
 =?utf-8?B?RUFTUlkwTHhpTHA2KzdzM1VBZndnTnBoZTV1UEZpaFd5VXZ4UktnOHhMc1FZ?=
 =?utf-8?B?cEpPUW5abFNTc2NlbjVNeTd3TVJvaTh6amlIVEp2eHg3T2xqaG91dW1MZFFX?=
 =?utf-8?B?Y2ZwcDNLUXJRK1hTQ3duSmVVbmZIYm5Hc05UTkxDUEpuTGlHWTg3TkN4NTFr?=
 =?utf-8?B?eVg4YmVITnNuVHl4THI0eUVGSjYvc3dPVlNjZTJqSnMwc0JqbFBjb3hSaU9Q?=
 =?utf-8?B?SlNXbkJkN3RtVU11TW1jeFAxZnltZGdYUzlyVi83SzJxREtYYkhmSXE0RHdL?=
 =?utf-8?B?dTNrdmJxZUdCQ3NNWExiK0FFcTBrK3dYa2NGYXp1OXVvRVBzWUIzOThQNVU2?=
 =?utf-8?B?cUZKbXE5UVJhZVdSSTZkUVJDekxlTXg1MkRacEFMYlRKY0o5NUVIOHFYZ2xR?=
 =?utf-8?B?ZmlPbnhDMHVFU3RPTVNyUU5Yc01HY2tWUFI5WTExT3VWSmVxUFoyWkxjMDBy?=
 =?utf-8?B?L1NDQ2JGajZ4ajVZMDF6Z2dkYWN2MzVyZzdxZTA4K0hTOStUckY4RS9GT0l4?=
 =?utf-8?B?NzIvNUlqbHdpRXJZT2NJVmxqNm9NOHJad0FORkZFUzJtU2lGL1ZuRU9oSUJZ?=
 =?utf-8?B?aHdyeThqNzJwYzBGZllHNG52dmJqSlkwdW52eVp4VEl6NlduanIvSFJGZTBx?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5520d1aa-d379-4e93-be8b-08ddc07b8b26
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 13:05:01.0474 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TIctKIWyGxI/s4Gx42qBSij/g75VCx/sBd/U3dOeDqG01bS7G4c3aBxZ00RENDZ1gtac6V3XGKXU4amZXWBslw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
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

Quoting Peter Senna Tschudin (2025-07-03 12:03:03-03:00)
>Previously, all igt_hooks were defined, initialized, and freed within
>lib/igt_core.c, limiting hook creation to this file. To enable other
>libraries to add hooks, introduce a function that returns a pointer to
>the main hook structure.
>
>This change allows hooks to be created from external libraries without
>requiring separate initialization or teardown of the hook
>infrastructure.
>
>Cc: Gustavo Sousa <gustavo.sousa@linux.intel.com>
>Cc: Lucas de Marchi <lucas.demarchi@linux.intel.com>
>Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
>---
> lib/igt_core.c | 12 ++++++++++++
> lib/igt_core.h |  9 +++++++++
> 2 files changed, 21 insertions(+)
>
>diff --git a/lib/igt_core.c b/lib/igt_core.c
>index c2674a272..f7a1ee36c 100644
>--- a/lib/igt_core.c
>+++ b/lib/igt_core.c
>@@ -3604,3 +3604,15 @@ unsigned int igt_measured_usleep(unsigned int usec)
>=20
>         return igt_nsec_elapsed(&ts) / NSEC_PER_USEC;
> }
>+
>+/**
>+ * igt_hook_get_pointer: To allow for using hooks from other libraries, t=
his
>+ * function returns the pointer to the struct that is likely already
>+ * initialized.
>+ *
>+ * Returns: Pointer to the igt_hook structure.
>+ */
>+struct igt_hook *igt_hook_get_pointer(void)
>+{
>+        return igt_hook;
>+}

Perhaps the name of the function should be changed?

I would expect functions starting with "igt_hook_" to belong to the
igt_hook library, but this one is specific to the pointer that is
initialized by core.

What about igt_core_get_igt_hook()?

Not sure I like we repeating "igt" in this one, but I think
igt_core_get_hook() is not very good either. So, between the two, I
prefer igt_core_get_igt_hook(), which is more precise.

>diff --git a/lib/igt_core.h b/lib/igt_core.h
>index 2db579423..2e65c89dd 100644
>--- a/lib/igt_core.h
>+++ b/lib/igt_core.h
>@@ -1601,4 +1601,13 @@ void igt_pci_system_cleanup(void);
> void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
>=20
> unsigned int igt_measured_usleep(unsigned int usec);
>+
>+/**
>+ * igt_hook_get_pointer: To allow for using hooks from other libraries, t=
his
>+ * function returns the pointer to the struct that is likely already
>+ * initialized.
>+ *
>+ * Returns: Pointer to the igt_hook structure.
>+ */

We can drop this duplicated documentation.

--
Gustavo Sousa

>+struct igt_hook *igt_hook_get_pointer(void);
> #endif /* IGT_CORE_H */
>--=20
>2.43.0
>
