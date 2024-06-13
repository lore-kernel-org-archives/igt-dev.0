Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E1DC27C6E
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 13:37:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBD089091;
	Thu, 13 Jun 2024 13:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fWFkAyTt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E0089091
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 13:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718285835; x=1749821835;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=yzFBQPdDVnqZ/OBlz4/KsIMm1kncBzgIVKFNHb/anRQ=;
 b=fWFkAyTt1WL6BLVd8TzRG9U71IADz9c7WWVBRSqAQMy5yDgooQC3HTGw
 HoC7QMn+vc/kdmUP2SZ6rcnjFYtJaOYMQkiL3TKOMIagYxdjc8fR+3nIT
 fuJXid+rQpsrqgoBaFxMOpiuZKayeYhYYc3bgjD8ZBCxYCrSXI0S7hQv4
 88fQ8tAZKHjBjOjifa0cb18btgtPDHfthrKR9KC9/iOyRq9fr4G4fNO+a
 S6kxi8Cz4FkW2hLJLuCkDMOBsER6d05vjd/q3ScX/pwyN+RpiKQKMAgFc
 Ssy4k58pqh7yYh3XBliRPATKr6bWpfL0w5iRlqzl8iOsFcaqgpDTkHNph A==;
X-CSE-ConnectionGUID: JXrgOa6TSAKAu87nDAF2jg==
X-CSE-MsgGUID: vObAjrysR7+6FNrDkZFkSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="26526102"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="26526102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 06:37:14 -0700
X-CSE-ConnectionGUID: ZhHtzCcBSAWj0Nu06HO3og==
X-CSE-MsgGUID: 3ZT4nbRaQGeOPNtzHa8C8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; d="scan'208";a="63326379"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jun 2024 06:37:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 06:37:13 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 06:37:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 06:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZRsvQq2oge03DsIuGvFi49B8lw4cbgJfw2SQ3dzmp3vRsgc9nrBHlcm6x626ms5yMWXEnGigm9ypNyHvLqRc2iNZKOPEv15xfv/3eDbE/eVCqfvKh2UjJD3U/+5oOltSZsq1GHj54bnxo8y8dobvr3xLPiBLp9MpVZgDr69V9wucOUX7EQ1vLlVnid+SIQu9+nd4YAkYWgwgzUu3WaDdux6IX2cGcXqjogo1grbye8o6CiWiQpKusjtxrXlv7m8//nTOp5pZFCxqNBJlDq8gkpCBy7zO1bBBkcPvmHnw5fEaA6tzPpUN5IFtK+HlyNx1x7hAs59YhqRJr4JzcdiSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzFBQPdDVnqZ/OBlz4/KsIMm1kncBzgIVKFNHb/anRQ=;
 b=GPvU+NCaF/p9WoBBwhMcQS68+69CDgn9fctteKRxO3Bn0ja0X9T9lmUn3togUL/NVnCDfnREPu1Fh1ALXBXVa0eqWpwRKIs68oNSnuvHWxSsfz5hrKqaHI9vrNzKAcHTofC3j6yBvqLGnZs74Csmrcgb9y8iaH1X2XpywCP6aXzh009S3Ri3/tLFz+RDnvAM1W7S0z9P6OLdVJAbX8dHwUo4uxIMtFPGQ1DyQz0cHJuXj/4y0O7ITOHB10yUhlTOBWgz3c1Pd/QedrKiWzpI86QaSFp9gvlpMvEk/Cq0Q+oUWNv4F3hvi48EdL8CfPIQfxA7AjlGyq6Zc8VAif90eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7382.namprd11.prod.outlook.com (2603:10b6:8:131::13)
 by DM4PR11MB7759.namprd11.prod.outlook.com (2603:10b6:8:10e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Thu, 13 Jun
 2024 13:37:10 +0000
Received: from DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee]) by DS0PR11MB7382.namprd11.prod.outlook.com
 ([fe80::80b3:e6e7:efec:dbee%6]) with mapi id 15.20.7677.019; Thu, 13 Jun 2024
 13:37:10 +0000
From: "Coelho, Luciano" <luciano.coelho@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Thread-Topic: [PATCH i-g-t v3 2/2] tests/intel/i915_pm_rpm: check
 drmModeGetConnector() before use
Thread-Index: AQHauO0Akfjob5CpTUW1A9XcMfk9e7HEMtAAgAGHf4CAAAFpAA==
Date: Thu, 13 Jun 2024 13:37:10 +0000
Message-ID: <159e9cf82b8d04533cff0a1063274f09ad0f2cfe.camel@intel.com>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <20240530085908.564733-3-luciano.coelho@intel.com>
 <20240607151123.4o66krb6y4kwyg5u@kamilkon-DESK.igk.intel.com>
 <64137841cd6f4d3f0c8b994664a46798effefa8a.camel@intel.com>
 <20240613133205.ikd3kvkd7xepbufx@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20240613133205.ikd3kvkd7xepbufx@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4-2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7382:EE_|DM4PR11MB7759:EE_
x-ms-office365-filtering-correlation-id: 16f874d3-9dfb-4cbd-be69-08dc8baded2c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230035|376009|1800799019|366011|38070700013;
x-microsoft-antispam-message-info: =?utf-8?B?dCt5OXloeDkyM3YwNjVldUNQZ3RwaWUvZTdyZE50dmFCUHB5bXp3enc5bXFH?=
 =?utf-8?B?eFNDZmpvUUNFaHZZL1lOYXp5STV0VDZtbHJ1bzNUUStnbVk2RVE1ZmxlUTBy?=
 =?utf-8?B?VysxWnlBVkFjZFY1S28wM0ZCS1laS2pGMWswYm82RzFuZkp5ZHBVRG42cE5I?=
 =?utf-8?B?cm16QVR0RzVlbzdmVjM3aE5sSWZBN2YvempIbFh0UDZhWkxnNlRrNld2MEkz?=
 =?utf-8?B?cDdSdkdlOFpBd3M3ZGUxTzRBYlJBYXl6a3Bwd05oZTh3ZC8ydHcvUkYxV3ho?=
 =?utf-8?B?dzZpSndVRUZTdzEwelFpSTk4V0d6Z3N2VFQ2YkRZUE1KMUxXbnEydnpGMFg3?=
 =?utf-8?B?Q3J4dWxoY3FZSmYyUWIwOWtkYU9xeDNwaThoalQwUlJSZUYxT3VHTHd6YVRE?=
 =?utf-8?B?NmFkamR6MlNQcEFpSW5iSlkwcHFhY2piSEdmaXZHbUo5MHNubUcrQk9kRXNG?=
 =?utf-8?B?SjdUNjZ2ZTdDYjcxRFlOOUt6ZTZoUlE4VjhHajloZGxQTUphbklGZ1JUWHA3?=
 =?utf-8?B?b05pcEdqd1VJS0tpZnk3UWRTREROOWtlT3RMandIcm04TlN5bUpyczFHTUM4?=
 =?utf-8?B?c2cxZ0JLU2FuNDBOSzFkQ0c5SE5LdUN2VVAxbXNuVWtpamFGYU9zQWQvbW1K?=
 =?utf-8?B?VlhkaSs1Q0hRK0VRMmg5RldYeEo3NHlJbDRaVXNFbFpVUVdXeU1xeVdmL3BH?=
 =?utf-8?B?VXFFMDJpSmFCL0dtQkMxb25jYnRKWTdPN2xlU3AxTXlYOUlod3IvNkxXM0py?=
 =?utf-8?B?NEVpV010R2kyY3JWOGJUbGZ6d09mYTB4Y2pxS0hqNjZFSlp2Q1lLRWFrR0F3?=
 =?utf-8?B?OG1QamtwL3poeSthb1J6U3k0YWtRMVFnMm8rcTJxYUlBYU8yZ3RETW42VStW?=
 =?utf-8?B?cTM5bGxqR0xsVUxTWThrSVBNV3dnTFN2bWdSQk9hbUFweVY3WmhqcGtPSmZo?=
 =?utf-8?B?L0tuQnQvRUxLOFJzNldYLy8xQ2xNZmljQU9UVTAvVW0zWWs5ZUhtT01NS21z?=
 =?utf-8?B?UnNsVkdJWjcycnBpL3VRQUJhMDlNeXJTZHFHK0ZjRlBkNjRhQmZjTGdSUHhE?=
 =?utf-8?B?bkVwVWtQYW9RTjFkWGUxa1dxSm9wdTluK0VIUDZPVGN1VlRQUFZiV0lUOVVM?=
 =?utf-8?B?bFRweDh2VFFGVGJ6aURPVXdRTVFNbHUvS0VERzUwSjE3eVVLK0psODVDNGkz?=
 =?utf-8?B?TUxhZkJSbmFMd0dtblh5N2hqMHI4VDlFTEtsYUhCbDgxanJXamtKMHBjYVpm?=
 =?utf-8?B?MnN0bE9KR1FzMzlWbXZrTThMbWRvdlRQY1RxNkpDM0ZyYzVUZFEvUWR3NkE1?=
 =?utf-8?B?M1BpMVpmZmZFWnUxN2lIem1tZjRIQVFiRm1RbW95cXI0ZGczZlJSeXgyZnRy?=
 =?utf-8?B?TEFsWC9IeDRuTmVENDBSMHorUFo4ZUpiWEhrMjBRL2JFRGNrc1UzV0RoaURE?=
 =?utf-8?B?Ky9HL25JcC9FbjA5eFAzM09rTkVGMFdIaGRHa1IzT1lYNzVrdDhBdFFaRGVG?=
 =?utf-8?B?TjRiMHlmbER1RlFYa3ljcG1qMkNZUGhLdTRQVFRGWlpTb2orRks0VWJuM04w?=
 =?utf-8?B?bHkxQWNKUXB1bXhHeGdOZUhrYXlhTW1obDNBcWJzbUtHZFE5R3d1bGtub010?=
 =?utf-8?B?bHh3RWN5Z2VkNkRpM2F6NEozblRabXZxdk5ES2hidmtwaFM2M0FLYW4vQ3NG?=
 =?utf-8?B?QkYwSEtoZWhMR2E3OUVRZmo5RGltSitCVk9MRXVFbjJxdjBaWkVpZkZvVDdX?=
 =?utf-8?Q?0WxNX0B12PBNoYPn1jyJWIfm+DA13MRmxPzhmXK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7382.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(366011)(38070700013); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXR3bGtJTkZia3NxVFdLUGdrVm4rRng0d2EwTXo2eUg5Q3dzeVhmTE5vNy9B?=
 =?utf-8?B?SkUyTGEyNnBOcWJhOHl4ZVZ6Nk1QUFBRSDMzWnhXN1FibTBtQVZqQUtsRGg2?=
 =?utf-8?B?M3IvZFo0bkhnV0hsZEpWSEZGK3c0Nkk0a3RFem9ITW5JemJGc2xhYWI1R3JH?=
 =?utf-8?B?WDl0T0Z3aXN4TTMvTDRtMlJ4clJidDhvRVBad3NraWFDVnduL0grS2gzM2lv?=
 =?utf-8?B?S1lkenErNW9xVXZDVVZmemEzcjhZNTlvWW9Iazd5RkdZVGluVnlTS0w3Q0d2?=
 =?utf-8?B?eE9CTXkxYjdMUVd0VVlYMU1rZUZOZHpBK1NXV3c3cUUvU3JCMnFtbkx6OFcx?=
 =?utf-8?B?SFdGOXNXSFVPOVZTVjBYRUJQWjJoRkczTEdrcldkQ0lKQnBQcCs1Z1FXMDBY?=
 =?utf-8?B?SzVtNHBKMUI5aHMxL055QnpCeGpJVHcxQWcxQmR6MTc3SUlhandzS2RMUTZQ?=
 =?utf-8?B?TllsR01BcDZHanpwUjRWdG40NWtvdTZlU240S2k4cTg1akN4RmdLQUl5WWtX?=
 =?utf-8?B?bUREOGt0QzNzclBKb1UyS0FiM1g1b2V1Ty9BMzdtbU1kYkYvU2MvaVpvVjll?=
 =?utf-8?B?ZW41ekF0KzBTdnBMWW11dk9qSHB3RjVuamR3akw4WHZZR0xIbllVVEVoUlZ2?=
 =?utf-8?B?eHAvYnJFa2VRNXh6OGZ0REdUN2dWRGZGc2EzVVM1b3F5U2s3NmpweTFuQkg5?=
 =?utf-8?B?OHo3ektVRER1cmR0WUpXRWJMT0VadW01UWxjNHBaYlFRSWdWNlNBbkRSTFZW?=
 =?utf-8?B?WUFUd0JQNElJdTBmcTdxanhNSzg0a1JWZVYwZ29McnpncGJ5T1hvcTBBZEpK?=
 =?utf-8?B?NjdCV0FEc1ZMcFpxd2RsVk9nTkpCTVNSUzdqcjh5OElvOEc4djNDRjZnam13?=
 =?utf-8?B?R1JiRlVqbjZxZzUwbzNCM0o3UCtLQzhHc2xyRXNqbVFzcWgrSzVVK2Z0V1Rl?=
 =?utf-8?B?b1dzTUZTOUE2UW9tMTBTUFVPdHF0K05CdTdYTXRoMmxxY3M0YU9oTXhOSUVy?=
 =?utf-8?B?akZGeGtvVnFOYThwdFVxMXpRSVkyVHJiSUxPZE16U3Nsbzk5R1JocWJqMlJL?=
 =?utf-8?B?YW1UTG9weFpqbGhCZmhyRExLNkZHRjV4R3dFZHdtdXBzMVVPVlloUjhUcmRk?=
 =?utf-8?B?WDJVZ1FrbzVPN01RZkV2aGMxeDlXeDlRelM0ZFBKNWVBNzhhRHJLb0x5Vldh?=
 =?utf-8?B?cGtWYWI5aENxU1l3bXh4N3cvQjdYc2xuWHpXcnk2Wktja3pPNmlVS00vbEhF?=
 =?utf-8?B?aGV4RHE4djc2WEtpV01OMEl6d3pXRXpncjJwNDE3VXAvclBwNHdKQkM4SlUz?=
 =?utf-8?B?b0I4NDg0MlowR0toZTh3MG5XbXl3TnFHWVpvTDZDbG84VVFNU3BOWTVQUFY1?=
 =?utf-8?B?MUYzSFlSU0I4aWVFTUh3c2hkUmVscTBzT0hqVytGaWFNNzBLNjYyWXdoU28v?=
 =?utf-8?B?RmR5OFE1bjFpcXdPUU5aK04wMmdGZnZJbXRhNWZud0E1cTFaRWlkdXhjbXUv?=
 =?utf-8?B?TnFseEpkK3VCQ1F4TUg1MjRWOGRrcEhBbDR2U2FNVFJBUjNPRTkyR2VIMkNp?=
 =?utf-8?B?MnRnMFJHTUJrZzZOTzF0TjVSWVBsU3NQT0lBaEt0a3QrWVBtU1dESmFhVGUy?=
 =?utf-8?B?ZjhTN0h3bkRMbWt2NzhlN3g1ZC9mMGlBM2drNGgyWWtwN2tzRmlzR2l6WWlO?=
 =?utf-8?B?R2xYSzRQUlR0ZjRWSnF4RkViWXBrMHBETzRUelA5NTZuOTJKZnJxNXdVNEZ6?=
 =?utf-8?B?YkFEaDEyeFdyMXJTQTNSWUE5UHVZeHRxZXh5dUxBQnJ4V0x2c21SSW9GZWFL?=
 =?utf-8?B?NHNzQnVDelVDNzAzSHUzVHpTczhZa2MzNFNDSHVmNHAvMGtaVU50QS9ZT21C?=
 =?utf-8?B?c2JEa2puMnphWDZVKytYYmlDN1ZralFxRk10d2hjd09xVkEwRGZmNjZCZlJn?=
 =?utf-8?B?WUNUc2VpYXRtNGlybTlwckdMNzFoWkRMdTVNZURtbmFxUzZvaGNSVDdQSGRP?=
 =?utf-8?B?UTd1REZmMjVVVDBUS3FHSFh4RFVlcDRuTEkwM1ZUK0twVjREQjFSTnpOTFNO?=
 =?utf-8?B?eGZXRDRmUWdtb2NwNW5hcmxoNWU4bjBNV0R5cThXSjFSbzJzZXZpYTRidTEr?=
 =?utf-8?B?T1ZRRlo4K3ViUjFQekdlZDBOSGErRHVEM241cGZ5NXlrbDdwYTVIVXI3MUVE?=
 =?utf-8?B?bHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <59A7CD033991CE43864DBF5573F454B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7382.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f874d3-9dfb-4cbd-be69-08dc8baded2c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2024 13:37:10.4438 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: euHo9Njpxa6JN6q/VDs1T88lC74I1cSXZsh08I1+RFHSFuaRnUQGMhKL/5bY4P4LywpulB92+d9exuq7v5r40xmjz4LU/pdVfqF2NOIG1mE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7759
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

T24gVGh1LCAyMDI0LTA2LTEzIGF0IDE1OjMyICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIENvZWxobywsDQo+IE9uIDIwMjQtMDYtMTIgYXQgMTQ6MTA6NTYgKzAwMDAsIENvZWxo
bywgTHVjaWFubyB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjQtMDYtMDcgYXQgMTc6MTEgKzAyMDAs
IEthbWlsIEtvbmllY3pueSB3cm90ZToNCj4gPiA+IEhpIEx1Y2EsDQo+ID4gPiBPbiAyMDI0LTA1
LTMwIGF0IDExOjU5OjA4ICswMzAwLCBMdWNhIENvZWxobyB3cm90ZToNCj4gPiA+ID4gVGhlIGRy
bU1vZGVHZXRDb25uZWN0b3IoKSBmdW5jdGlvbiBjYW4gcmV0dXJuIE5VTEwgaW4gc29tZSBjYXNl
cywgc28NCj4gPiA+ID4gd2UgbmVlZCB0byBjaGVjayB0aGUgcmV0dXJuIHZhbHVlIGJlZm9yZSBh
Y2Nlc3NpbmcgaXQuICBUaGlzIGlzIG5vdA0KPiA+ID4gPiBiZWluZyBjaGVja2VkIGluIGluaXRf
bW9kZV9zZXRfZGF0YSgpLCBzbyBmaXggdGhhdC4NCj4gPiA+ID4gDQo+ID4gPiA+IEZyb20gdGhl
IGJ1ZyByZXBvcnQ6DQo+ID4gPiA+IA0KPiA+ID4gPiBTdGFydGluZyBzdWJ0ZXN0OiBtb2R1bGUt
cmVsb2FkDQo+ID4gPiA+IFJlY2VpdmVkIHNpZ25hbCBTSUdTRUdWLg0KPiA+ID4gPiBTdGFjayB0
cmFjZToNCj4gPiA+IA0KPiA+ID4gTm93IEkgdGhpbmsgdGhhdCBsaW5lICdTdGFjayB0cmFjZScg
aXMgbm90IG5lZWRlZCwgb25seSB0aG9zZQ0KPiA+ID4gdHdvIHdpdGggc3VidGVzdCBuYW1lIGFu
ZCBzaWduYWwgYXJlIGVub3VnaC4NCj4gPiANCj4gPiBPa2F5Li4uIGl0J3MgbW9zdGx5IG5vaXNl
IElNSE8sIGFueXdheS4NCj4gPiANCj4gPiANCj4gPiA+ID4gQ2xvc2VzOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEwOTExDQo+ID4gPiA+
IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+
ID4gPiA+IENjOiBCaGFudXByYWthc2ggTW9kZW0gPGJoYW51cHJha2FzaC5tb2RlbUBpbnRlbC5j
b20+DQo+ID4gPiA+IENjOiBKYW5pIFNhYXJpbmVuIDxqYW5pLnNhYXJpbmVuQGludGVsLmNvbT4N
Cj4gPiA+ID4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEx1Y2EgQ29lbGhvIDxsdWNpYW5vLmNvZWxo
b0BpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgdGVzdHMvaW50ZWwvaTkxNV9wbV9y
cG0uYyB8IDYgKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
DQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwvaTkxNV9wbV9ycG0u
YyBiL3Rlc3RzL2ludGVsL2k5MTVfcG1fcnBtLmMNCj4gPiA+ID4gaW5kZXggMGVhNWZiZDhhZmQ5
Li5lMGYzOTVmYThhODQgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2k5MTVfcG1f
cnBtLmMNCj4gPiA+ID4gKysrIGIvdGVzdHMvaW50ZWwvaTkxNV9wbV9ycG0uYw0KPiA+ID4gPiBA
QCAtNTE1LDYgKzUxNSwxMiBAQCBzdGF0aWMgdm9pZCBpbml0X21vZGVfc2V0X2RhdGEoc3RydWN0
IG1vZGVfc2V0X2RhdGEgKmRhdGEpDQo+ID4gPiA+ICAJCQlkYXRhLT5jb25uZWN0b3JzW2ldID0N
Cj4gPiA+ID4gIAkJCQlkcm1Nb2RlR2V0Q29ubmVjdG9yKGRybV9mZCwNCj4gPiA+ID4gIAkJCQkJ
CSAgICBkYXRhLT5yZXMtPmNvbm5lY3RvcnNbaV0pOw0KPiA+ID4gPiArCQkJaWYgKCFkYXRhLT5j
b25uZWN0b3JzW2ldKSB7DQo+ID4gPiA+ICsJCQkJaWd0X3dhcm4oIkNvdWxkIG5vdCByZWFkIGNv
bm5lY3RvciAldVxuIiwNCj4gPiA+IC0tLS0tLS0tLS0tLS0tLS1eXl5eXl5eXg0KPiA+ID4gaWd0
X2RlYnVnDQo+ID4gPiANCj4gPiA+ID4gKwkJCQkJIGRhdGEtPnJlcy0+Y29ubmVjdG9yc1tpXSk7
DQo+ID4gPiA+ICsJCQkJY29udGludWU7DQo+ID4gPiA+ICsJCQl9DQo+ID4gPiA+ICsNCj4gPiA+
IA0KPiA+ID4gV2UgZ2VuZXJhbGx5IGRvIG5vdCB3YXJuIGFuZCBmYWlsIGEgdGVzdCBpbiBjYXNl
IHNvbWUgcHJlcmVxdWlzdGljcw0KPiA+ID4gYXJlIG5vdCBwcmVzZW50LCB0aGF0IGlzIHdoeSBp
dCBpcyBiZXR0ZXIgdG8gaWd0X2RlYnVnIGhlcmUNCj4gPiANCj4gPiBUaGlzIGlzIG5vdCBhYm91
dCBwcmUtcmVxdWlzaXRlcy4gIFRoaXMgaXMgYWJvdXQgYSByYWNlIGNvbmRpdGlvbiB3aGVyZQ0K
PiA+IHdlIGdldCBhIGxhcmdlciBudW1iZXIgb2YgY29ubmVjdG9ycyB0aGFuIHdoYXQgaXMgYWN0
dWFsbHkgYXZhaWxhYmxlDQo+ID4gbGF0ZXIuDQo+IA0KPiBZb3UgZGlkbid0IHdyaXRlIHRoYXQg
aW4gYSBjb21tZW50IGluIGNvZGUgbm9yIGluIGNvbW1pdCBtZXNzYWdlLA0KPiBsb29rcyBsaWtl
IGl0IGNvdWxkIGhlbHAgbGF0ZXIgb24gd2hlbiB0aGlzIGhhcHBlbi4NCg0KUmlnaHQsIHRoYXQg
aXMgb25lIGtub3duIGNhc2UsIGJ1dCBpdCdzIG5vdCB0aGUgb25seSB0aW1lIGl0IGNvdWxkDQpo
YXBwZW4sIGFjdHVhbGx5LiAgVGhhdCdzIHdoeSB0aGVyZSdzIG5vIG1lbnRpb24gaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLg0KVGhlIGNvbm5lY3RvciBtYXkgaGF2ZSBkaXNhcHBlYXJlZCAoZGlzY29u
bmVjdGVkIHBoeXNpY2FsbHksIGZvcg0KZXhhbXBsZSksIHNvIHRoZSBkcm1Nb2RlR2V0Q29ubmVj
dG9yKCkgbWF5IHJldHVybiBOVUxMIGF0IGFueSB0aW1lLiANCldoYXQgSSBkaWQgd2FzIGNoZWNr
IGFsbCBjYWxsZXJzIG9mIGRybU1vZGVHZXRDb25uZWN0b3IoKSB0byBzZWUgaWYNCnRoZXkgd2Vy
ZSBjaGVja2luZyBmb3IgTlVMTCBvciBzYWZlIGluIHNvbWUgb3RoZXIgd2F5LiAgVGhpcyBpcyB3
aGF0IEkNCnRyaWVkIHRvIGNvbnZleSBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCg0KPiA+IEkg
dGhpbmsgdGhlIHRlc3Qgc2hvdWxkIGZhaWwgaW4gdGhpcyBjYXNlLCBiZWNhdXNlIHRoZW4gd2Ug
d2lsbCBsb29rIGF0DQo+ID4gd2hhdCBpcyBnb2luZyBvbiBhbmQgdHJ5IHRvIGZpZ3VyZSBvdXQg
d2hhdCdzIGNhdXNpbmcgaXQuDQo+ID4gDQo+ID4gSSBoYWQgaWd0X3dhcm4oKSwgdGhlbiB5b3Ug
dG9sZCBtZSB0byBjaGFuZ2UgdG8gaWd0X2RlYnVnKCksIHRoZW4geW91DQo+ID4gdG9sZCBtZSB0
byBjaGFuZ2UgaXQgYmFjayB0byBpZ3Rfd2FybigpIGFuZCBub3cgeW91J3JlIGFza2luZyBtZSB0
bw0KPiA+IGNoYW5nZSBpdCB0byBpZ3RfZGVidWcsICphZ2Fpbio/IQ0KPiA+IA0KPiANCj4gTmV2
ZXJtaW5kLCBsZXQgaXQgYmUgd2Fybi4NCg0KT2theS4NCg0KDQo+ID4gPiBhbmQgbWFrZSBjaGVj
a3MgaW4gZmV3IG90aGVyIHBsYWNlcywgbGlrZToNCj4gPiA+IAkJCWlmIChkYXRhLT5jb25uZWN0
b3JzW2ldKSB7DQo+ID4gPiAgICAgICAgICAgICAgICAgICAgIC8vIGhlcmUgd2UgY2FuIHNhZmVs
eSB1c2UvZnJlZSBjb25uZWN0b3Igb3IgZWRpZA0KPiA+ID4gICAgICAgICAgICAgfQ0KPiA+ID4g
b3INCj4gPiA+IAkJCWlmICghZGF0YS0+Y29ubmVjdG9yc1tpXSkNCj4gPiA+ICAgICAgICAgICAg
ICAgICBjb250aW51ZTsNCj4gPiANCj4gPiBJIGRvbid0IGdldCBpdC4gIENhbiB5b3UgZXhwbGFp
biBpbiBtb3JlIGRldGFpbHM/DQo+ID4gDQo+IA0KPiBJIGRpZCBhIGNoZWNrIGxvY2FsbHkgYW5k
IGl0IHNlZW1zIE5VTExzIHRoZXJlIGFyZSBub3QgYSBwcm9ibGVtLA0KPiBzbyB5b3VyIGNoYW5n
ZSBzZWVtcyBvaywNCj4gDQo+IFJldmlld2VkLWJ5OiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtv
bmllY3pueUBsaW51eC5pbnRlbC5jb20+DQoNClRoYW5rcyBmb3IgdGhlIHJldmlld3MsIEthbWls
IQ0KDQotLQ0KQ2hlZXJzLA0KTHVjYS4NCg==
