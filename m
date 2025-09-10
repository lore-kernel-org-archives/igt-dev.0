Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A4D5CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:02:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBD310E896;
	Wed, 10 Sep 2025 08:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jbljo6TS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6721C10E896
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757491374; x=1789027374;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=VCP6L78NjPuZe6RArbEaykoejeh1VRzwJDHaAMOvu4E=;
 b=Jbljo6TSa+2AlN1HDmvrQNcgOW3WBHSf+h/O7kKJd1rrFVpfn63LxE3O
 6RHy+kBwhKn1TW1BlFPrR1c9jXCqC8YYYk60oybNQ1IPQstxrEa48g6R8
 4XP2dSdk6TtEPb8s/m1deYLS8JjkC6m4UVyy0UYiq1FDgSJh7/c5AnvFc
 mc97lnps0KNzz2iDFETE6vmnMtW4MACKvRdBZnwdeC8+juCwLYObsX9Be
 IL9IHy++NciAKn4VEsjADziTXptyjHRHYfZ22swVdJNOSitjcHWyNppEO
 zV5fe/5O6fP3hTwNkfwUuF7kyn4h8cEqaTurHHfCc+PS7nwEk47kEo/IA w==;
X-CSE-ConnectionGUID: I10Ux/WrSMCyNl6jZ7GchQ==
X-CSE-MsgGUID: e5QWh1RuTYqRlBRroaV8ZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59649868"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59649868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:02:54 -0700
X-CSE-ConnectionGUID: oP7a8HuwQaO0WLXcSULyvg==
X-CSE-MsgGUID: YUhTWc3tRMiYlvptdG9ZzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="173232113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:02:53 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:02:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 01:02:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.46) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 01:02:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cu5pU+dQlt7hgB4Gt2JTz8hXQwHtOxdwBF+LjjIDxS1kSHAIpzlMhmj2kbSrZP102Yeca1eXAfyjaXXI0gmH/D6tH2H/T4jv2heZxHUjzo+hL36mYLRh0vCXqGulf3TmTNTWxOUoLkO571sxA2uAuy7YLk7w8auIpWiRM4YmYSKYFDFLnkfCg79mNE8yh62t8N2e0x7aHaD+Sl4I1iKNAMq/av5tOPWmqQH+EtHfFmpNll93GG2zA7fLAF2KR7dkdqcjb6UqZ/nH1QNtr48mNdT1Z03OsHSu+EaK68l6VNphE/t50u/tnHZrP8TtjwJc27G+kL2Il4rm7eiyUkft3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCP6L78NjPuZe6RArbEaykoejeh1VRzwJDHaAMOvu4E=;
 b=JeXb0wRwPGNcz3wpB2V5TIs2tGiE7s5G1Q3Ire83ubhaSmFq6iWXa1TfUow4pqsm4RvNQKr4K+nH/WVYsNdjn3d6njQ+ELjh44nQmcS7XCtm5kKm57fBOqa7J5iYkzQj+sameTXUcfyS0vscKsxUWKoP9DYzo9SoCdU/XsAoQpiiZAmqpP2EwtaRiIt4hHnTN8RHel/yFV+PLJO5dkqsiEH4R5IIiLi0EAaLqtsaRBFo76slbWGcWCUOA6BoyBvtDVJ1VdokTkOo/NZhDMlggcV21hkh/PVw3IhD/ugYGTXt2oByq1Pn/YMt6+6yBx95gq9e64mgWiOAcfe3zyDpLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 SJ1PR11MB6178.namprd11.prod.outlook.com (2603:10b6:a03:45b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Wed, 10 Sep
 2025 08:02:48 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%4]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:02:48 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
Subject: RE: [PATCH v2 i-g-t 4/4] lib/xe_eudebug: Don't fail in __wait_token
 if pipe was broken
Thread-Topic: [PATCH v2 i-g-t 4/4] lib/xe_eudebug: Don't fail in __wait_token
 if pipe was broken
Thread-Index: AQHcIL/XNw/h9f/VBky0lDvaeO3MJbSK9IIAgAEb2RA=
Date: Wed, 10 Sep 2025 08:02:48 +0000
Message-ID: <DS0PR11MB726454495B438A5B18939488D90EA@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20250908125448.13420-1-dominik.karol.piatkowski@intel.com>
 <20250908125448.13420-5-dominik.karol.piatkowski@intel.com>
 <87o6rjmzv5.fsf@mkuoppal-desk>
In-Reply-To: <87o6rjmzv5.fsf@mkuoppal-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|SJ1PR11MB6178:EE_
x-ms-office365-filtering-correlation-id: eb295ea0-40eb-40f5-e850-08ddf0406ef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?TmZMU3B0K1RWTnV6a1B0WlJ0ZEl0NUV3RWMyNWQ4cG8yQVorMEFvSVgyQ1FH?=
 =?utf-8?B?R0NLVXZhNjJvSk5JRGxFMU9TSkN2VlVCM0RjRWRkQ3Q5OVZtT1dJQlFZRnlx?=
 =?utf-8?B?bk10TkxzOEp4TFZBQWRwRU44OTlaL1RwQm9yV1RKZzQvTzdiUitCUTI3eXR5?=
 =?utf-8?B?K1BLQTQ1VnoySVRBK3dRQ09idEdEN1FlcElKL0dZTXdXOFRlZit3KzFyamNH?=
 =?utf-8?B?OEFRZmlEYW5jVmtkSXZHVzEzQ3k5QzVEdmlMSkdNZDBEdnZhSGh6T2laMDhE?=
 =?utf-8?B?WEdpakdhYUNlS0poODdnR21Zc2d3WkV1RzY3K0hTNTNkaFF0Q3hVMXpXbEZt?=
 =?utf-8?B?d1NPN3FWc3BjMVE1dXdkeWdGUTRLd1U1dTVqQU1Eb1BMU0VxODFoSkp6eFk4?=
 =?utf-8?B?bUVpcXhxWUk0dUZnODN1RnFMKzlsWEZiVFJCSm9PUzMvaWV3eUE1aFVGUGNV?=
 =?utf-8?B?bURVeDkydy9MUVFqN1dnME1ULzdBVHp4YmhSVVVYT2RXaDAxT0lDRlZkU0RM?=
 =?utf-8?B?RnhsVGhxSjRudUJnOVQ0OFhnOTB5RFZkbFJ5dTZab3JQMnV3WWJzdnE3SDFY?=
 =?utf-8?B?NHA1SElPcndmb1YwLzZUQWUyVC9vbW9YYzlOMnZJNldvNFJ1NjBUZUpJdUh2?=
 =?utf-8?B?bnlVRmhWck41UVk0Mmt4Q0l0amdvQVpNTktLekZ0dnUyVTRtVG5XQzdaWFZB?=
 =?utf-8?B?d0RQMUpFaUZhcjFzeEJETWZpNFhTWmhkWjl5MjNvKzF3L2pvSEZhY3V0RDlU?=
 =?utf-8?B?dUdoa1BybkpsYTlGNUZNV0ZmYUVPYmdKa3lmaGRnbk1FK3FZcGg1K2Z1UThM?=
 =?utf-8?B?NzdyVFJGTlZkVzdNdTFDKzIreHV5SVljLzE4TE5FUmNSK0J4SjJaOUIwZm1x?=
 =?utf-8?B?eWcwM3BjY0dHNWhFK1lhUzU0b1ltZ0VPaWZtTWt5WWgwRGdqWXNSVEY5UUVr?=
 =?utf-8?B?NUJZWWdaRmZuUjBtRjVqZDR5OWtudWIyckdyL0NraHdhbmRUNnR6QUkwMmwz?=
 =?utf-8?B?RlNDb2hUMERyengzZ2JRcU91VWFaUTdLU2I3YWJzNWNZa1hiMWN1TC9SUmFX?=
 =?utf-8?B?aXVkaEFiT1pQM0xwYUFPelJFUFk1THJaQkNqMGh5NUhnUnkya2RWTWdHa2l5?=
 =?utf-8?B?TDMzNVFUazNDdTFJSVZ3TWNVNG0zTGFyK2pQaVRVYVZIYjcvb05POXlVOFN2?=
 =?utf-8?B?TWFLWjJiV2VBN3dlRFNiNDkzYUNDem9hL3hHU2tVRWcrL01qeU1IblRGbEd1?=
 =?utf-8?B?Q2ltWTF1TFlDeVlTOHdZV2NvNWpuY3JlamhtRnFxdXREaXQzYVVnMkY1NGc0?=
 =?utf-8?B?c2RIb0lISlcrbVRYUFo3eEx1UmtOMHp2cGlXRW9vT081aUFCTUpmRTRaQ0ll?=
 =?utf-8?B?U2hLb1ZLeDhHSGtnVGk2RUROVXlhcW9XY3EzeE1MWlpsb01pSVdvSEtQVVVo?=
 =?utf-8?B?V0NJejJVVjlLbWM3ejhhNFlISDViK2Z4NTFJbVVtWHdZaHJab0ZXUCtMMHJh?=
 =?utf-8?B?dlJOZ2VBWXBlb2dvK3NSWlEwLy9BQW1IbWQzTVREdnlncU4wMmNqZTFIalhF?=
 =?utf-8?B?ZjRmeHNnNmw3b2hkOEEyaTdoeGo1b2t5aXFmUFgveTNSNEUyeTBZNDFZWlpR?=
 =?utf-8?B?TmNDbkZtSnRrRHFxZUl0eE1HZ2hnampJV0N5Sk1rcDJPUFJzVGZzamUvSUxQ?=
 =?utf-8?B?MTI5cTJaK2Erb2JKUkliWFRTWk9vcThvZE5vRDBocGprdk1ZOTIyOFVvL0V0?=
 =?utf-8?B?TDVrMXoxaUZYWHdlMk4yTVc4YzZMRzJRNmtYeExSdnVWa240QUhRTDRwZWha?=
 =?utf-8?B?eHpiVFpPS3RwaE9BdlVMYmo1Q2VoTFoza2IwMFAyYk1tNnQ3WjNpUzNKSi9W?=
 =?utf-8?B?WllpMkxRa2I3UzB6LytMTnU3ejJXSkRNdG83Y1l2dWphYlhDZGEzR1BiS25M?=
 =?utf-8?B?M0Z5SU84VWtaMi9BUnkxK1hJSjFoaFdWeks3NUlsdFdvL3F3b0YwQUpOZzZr?=
 =?utf-8?Q?VLSJ8sX/oSNFJnr9eajCf/7d6XZLoE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UVZjQWVxdmd2S29QUTNtNzFvVEJlSkRJS1AwcEorYjBDNmVOeS91bG42OXhv?=
 =?utf-8?B?Z3VBL0FrMVEyOEY2MFR3N09qVUl6RzlYMElYVGZsclpqY2U5bSt2K2tUOXQ5?=
 =?utf-8?B?MTRhdGUvMEgxdk5kZzZkMUhpYjlVbE1EWVFKTXlmY1A1S0hTMVZrd1V6SUdx?=
 =?utf-8?B?NWZvbkVsMldRczZxQ09VMXV4NjNiVTJ3ZWhaRkJ5bEUwV25kWW8wRkw4OXVh?=
 =?utf-8?B?a1hRWTlFNy9SaGsyS2RIU3pzNTZrZml5UHJ5dkRNbUxoSnBYOHRSbEhwYXBz?=
 =?utf-8?B?blAvYU1jSFFZenJ3eENnT3d3NHhPVlJjWkdzb2krU1dEUWRZemtwVEpuSWVs?=
 =?utf-8?B?ZlIyK29tUmdacFoxeU1zdGZ0N2FDc1IraWtXRUlkU2dqRDV3Z3lRMHVBQjE2?=
 =?utf-8?B?bzRzZzBFak5LeCtmZjZIbVJQalBMb1BuRk1IUjVzd1pGNW5xcTFOeGNLYS8v?=
 =?utf-8?B?bVQvNFVXR1AyMGJuZEFja3NRbDRuSzRkUFJDNFlaNWUwZGNYTkcraFNia2Jq?=
 =?utf-8?B?anFjSlNKQ2hZVC9iQTU4cnNZRlVsKzA2SFVFelJHWHh6R1pVbGJoVkZlSEhY?=
 =?utf-8?B?cFo4OWNtYmdIVkl2dWZEcnhMcUxkR3VGOStaeUFhL0orenpmQVFNdjhlYzJ6?=
 =?utf-8?B?aHFuNFRhTGpGczl4S09PYXpkdERlbVVOTncxUWJ6eTlzeVMreVVGVWE5ek12?=
 =?utf-8?B?UkhCOXBPOGRZcGxMTlN0VUR0dWovNUUzZFVpZU1uWU90M1VjcHNCVWQ2Vk9Q?=
 =?utf-8?B?N0xmQlJCQmFKSXRlVmVKQjB1Wmh2TDRsVHJuc0VUMGtwWUdOOGZ6bngrMlNi?=
 =?utf-8?B?ZUxBbjQxU2JMSHhCWnRWcFVyOWw1RzVHbTJDOFV4ellwZFI0UTM0a2JHTGQz?=
 =?utf-8?B?VEMxWGRFaTUybDZqNzFuS1RMVmY1cUVKOU9JQVVIM0czVldyRWtYM0U5ZFZ0?=
 =?utf-8?B?N015dWtRUTR1TlYxeXFJblgwUXNjTmZLUllFRVk3RmVZaVpLM0RvdVdMSUMv?=
 =?utf-8?B?NWQxOHZMOG5nTzN3d3FZNE0xQnNwcmordm9abVAyemp3VWF4Q3p6S2VBOWwy?=
 =?utf-8?B?N2grVnNJeXBBbUJSTlRwbk05cUVkK1AwU2NOc1pLMTczbzd1Ym9QOU9WUUdo?=
 =?utf-8?B?TmhBZXZkQlhiS2FMTW04TVRXa2JwLytWZEtPMWU4cENqdDV3Tm4wa0owWU9M?=
 =?utf-8?B?K3ZkKzM1a3RKVXdhM0dGS1RKN0xMWkVuQ2NEa01NWWJmeExxa3N6VTVRNUt3?=
 =?utf-8?B?SkttdS8yMFZFaWtwUHVaTnVBZFZqczd1bURNeGN6cmxWdmIrK3pFZmR5Z3h2?=
 =?utf-8?B?ZHd2ZHBhaEFYLzQ0YyswdzlRRm1LVXNZNXZTc2hPUTJJUytHc2g4dkN2MG56?=
 =?utf-8?B?VURGaDRnZE9hc3c2dm9xS3Bsa2lSVytOMDVWRklZNTJoRkF5dVpLbHY1MzJ6?=
 =?utf-8?B?c1dPQjVNbUZnaFppTGxsMnBnME9OT09FVzZSV25ITE1nSXZCOE1hNGxwcFQ4?=
 =?utf-8?B?TkFMNVJ3bCtleEQ3YlRnekpZT0xVYUlXYnBQc3hFZkVXTGUxRUtKdWhCemRZ?=
 =?utf-8?B?VlNCRHhXNmlzRmtuVEs3SXgyS3FHVmRPMkZrd2U0QUhNRnYxS0FwRnR4Q3hO?=
 =?utf-8?B?bS9KSUR3ZEZIbnVzYkxzd3VHdmZVeUFlNkhwdlkySGhyd3I4Rk8zbTBxT0ZF?=
 =?utf-8?B?dDNUbGJqMHZsK1RBMFZpWkZtR29ZaE11aDdxaUh0RHNudHJOdXhGZjJTUzBx?=
 =?utf-8?B?MnVTSFk3bE42dGVMSk4xL0pqNnk2THkyRDRpcldVVHlUTzY3V0ZlY0tUSEpD?=
 =?utf-8?B?TVNTdkRIVE1PNDJwRitpT3lXVnQ4WHlDeDNScEtSa09DeW5VUU1jSStWNEgy?=
 =?utf-8?B?V3BTbEdLSDV6SnRidFg4aFNBZ0dwN2htQ2xUWlNWZzF2TTVKVlM1ZDQwam9w?=
 =?utf-8?B?K2RWKzlWK3JCeUk2UXpRQ0RCa0xYMzFkZTVPQXNDMEpaZWlWZlM1MUxOT2Zu?=
 =?utf-8?B?elRtSVJLekhCVEd2MXlmMWlqUHAweUJVS0VMa1lwUy9KUUEvOElXVUI0YXhj?=
 =?utf-8?B?NUlqKzZIRzJNYmkzb0t1OWV6VUJNNXpSYVJORWhJK3hIY2ptdmFlMnNxdTVG?=
 =?utf-8?B?aitqSkRDTytiMHVkTFVEK2M2eEN3aC9IcFlxa1N2bGdaVWZSN2xwSVlWcE9x?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb295ea0-40eb-40f5-e850-08ddf0406ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2025 08:02:48.5945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y06Ws9LENbM44NIxAKTeMKya+jJ7SYsqIurB8kDjASEZVll+A8zl5etxeFsrwrAlicxJ7fEXGRvroycRfBk9xyqgC/FQHLfcKrx2dd4IPcjrMvmH4HpK5g6sqjfJ3dyN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6178
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

SGkgTWlrYSwNCg0KVGhhbmtzIGZvciB0aGUgaW5zaWdodC4gRGVjaXNpb24gb24gdGhlIHVwcGVy
IGxheWVyIHNvdW5kcyBiZXR0ZXIuDQoNCkRvbWluaWsgS2Fyb2wNCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4
LmludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgU2VwdGVtYmVyIDksIDIwMjUgNTowNCBQTQ0K
PiBUbzogUGlhdGtvd3NraSwgRG9taW5payBLYXJvbCA8ZG9taW5pay5rYXJvbC5waWF0a293c2tp
QGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBQaWF0
a293c2tpLA0KPiBEb21pbmlrIEthcm9sIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwu
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIGktZy10IDQvNF0gbGliL3hlX2V1ZGVidWc6
IERvbid0IGZhaWwgaW4gX193YWl0X3Rva2VuIGlmDQo+IHBpcGUgd2FzIGJyb2tlbg0KPiANCj4g
RG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVs
LmNvbT4gd3JpdGVzOg0KPiANCj4gPiBJZiBzYWZlX3BpcGVfcmVhZCByZXR1cm5zIC1FUElQRSwg
cHJpbnQgaXQgYW5kIGNhcnJ5IG9uLiBUaGlzIHdpbGwgYWxsb3cNCj4gPiBmb3IgZGVidWdnaW5n
IGlmIHNvbWV0aGluZyBnb2VzIHdyb25nLCB3aGlsZSByZWR1Y2luZyB0aGUgZmFsc2UgdHJpcHBp
bmcNCj4gPiBvZiB4ZV9ldWRlYnVnX29ubGluZUBzZXQtYnJlYWtwb2ludC1zaWdpbnQtZGVidWdn
ZXIgdGVzdC4NCj4gDQo+IEkgZmFpbCB0byBnZXQgdGhlIHdoeSBwYXJ0LiBZb3Ugd2FudCB0byBj
YXJyeSBvbiBpZiB0aGUgY2xpZW50IGlzIGRlYWQ/DQo+IA0KPiBTaG91bGQgd2UgdGhlbiBqdXN0
IGRlZmluZSBDTElFTlRfREVBRCBhbmQgbGV0IHRoZSB1cHBlciBsYXllciBkZWNpZGUNCj4gaWYg
aXQgaXMgYWNjZXRhYmxlPw0KPiANCj4gLU1pa2ENCj4gDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpDQo+IDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lA
aW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBsaWIveGUveGVfZXVkZWJ1Zy5jIHwgOCArKysrKysr
Kw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvbGliL3hlL3hlX2V1ZGVidWcuYyBiL2xpYi94ZS94ZV9ldWRlYnVnLmMNCj4gPiBpbmRl
eCA4ZTU2NjQ0OTYuLjdhNDNiYzkwMiAxMDA2NDQNCj4gPiAtLS0gYS9saWIveGUveGVfZXVkZWJ1
Zy5jDQo+ID4gKysrIGIvbGliL3hlL3hlX2V1ZGVidWcuYw0KPiA+IEBAIC0zMDIsNiArMzAyLDEw
IEBAIHN0YXRpYyB1aW50NjRfdCBfX3dhaXRfdG9rZW4oaW50IHBpcGVbMl0sIGNvbnN0DQo+IHVp
bnQ2NF90IHRva2VuLCBpbnQgdGltZW91dF9tcykNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAg
CXJldCA9IHNhZmVfcGlwZV9yZWFkKHBpcGUsICZpbiwgc2l6ZW9mKGluKSwgdGltZW91dF9tcyk7
DQo+ID4gKwlpZiAocmV0ID09IC1FUElQRSkgew0KPiA+ICsJCWlndF9pbmZvKCJzYWZlX3BpcGVf
cmVhZCByZXR1cm5lZCAtRVBJUEUhXG4iKTsNCj4gPiArCQlyZXR1cm4gMHgwMDAwZGVhZDsNCj4g
PiArCX0NCj4gPiAgCWlndF9hc3NlcnRfZihyZXQgPiAwLA0KPiA+ICAJCSAgICAgIlBpcGUgcmVh
ZCB0aW1lb3V0IHdhaXRpbmcgZm9yIHRva2VuICclczooJSIgUFJJZDY0ICIpJ1xuIiwNCj4gPiAg
CQkgICAgIHRva2VuX3RvX3N0cih0b2tlbiksIHRva2VuKTsNCj4gPiBAQCAtMzA5LDYgKzMxMywx
MCBAQCBzdGF0aWMgdWludDY0X3QgX193YWl0X3Rva2VuKGludCBwaXBlWzJdLCBjb25zdA0KPiB1
aW50NjRfdCB0b2tlbiwgaW50IHRpbWVvdXRfbXMpDQo+ID4gIAlpZ3RfYXNzZXJ0X2VxKGluLCB0
b2tlbik7DQo+ID4NCj4gPiAgCXJldCA9IHNhZmVfcGlwZV9yZWFkKHBpcGUsICZpbiwgc2l6ZW9m
KGluKSwgdGltZW91dF9tcyk7DQo+ID4gKwlpZiAocmV0ID09IC1FUElQRSkgew0KPiA+ICsJCWln
dF9pbmZvKCJzYWZlX3BpcGVfcmVhZCByZXR1cm5lZCAtRVBJUEUhXG4iKTsNCj4gPiArCQlyZXR1
cm4gMHgwMDAwZGVhZDsNCj4gPiArCX0NCj4gPiAgCWlndF9hc3NlcnRfZihyZXQgPiAwLA0KPiA+
ICAJCSAgICAgIlBpcGUgcmVhZCB0aW1lb3V0IHdhaXRpbmcgZm9yIHRva2VuIHZhbHVlICclczoo
JSIgUFJJZDY0DQo+ICIpJ1xuIiwNCj4gPiAgCQkgICAgIHRva2VuX3RvX3N0cih0b2tlbiksIHRv
a2VuKTsNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0K
