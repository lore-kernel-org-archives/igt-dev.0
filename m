Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBDC02182
	for <igt-dev@archiver.kernel.org>; Thu, 23 Jan 2025 13:59:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF81F10E816;
	Thu, 23 Jan 2025 13:59:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBVQK7cF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2090C10E00B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2025 13:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737640792; x=1769176792;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DJrIoAXJMY7qHTCE/Y03q8yiNayT/CKJ94yztiDojv4=;
 b=ZBVQK7cF1EJVpMNevCx927wvzWcNxF3ZjSeLrTXH/NIec4nDh96DpF6T
 Tge0HT7Nbya87hhr7S0vgFnbV44tpe0cZBRrlRCgBLLEhvzbjPdloaU6l
 /N6uK3Njit6FyaqQER9a2H81841sI3yBIUS8Nxmr2uCFTQhAhjyEyO+zB
 9JnB3j8fFxseIKbSThTaKvXycBO9hGEnTRm0SO5Bi8YxefBaRXfpQ+H8D
 BD3qBGThpimjkHRBcbMGpIhO3ccLmej6fiYrmZl0bqIuwTl2qvMwxUFjK
 H1SOv9S+HlmqoyfvYBBjvD0XdakvHumNtAX6RL/3sDADPLrvtLFmpikXZ Q==;
X-CSE-ConnectionGUID: qgUB7EkQTiKGydAVzf1KkQ==
X-CSE-MsgGUID: p4HbnygLQG6YbqOAwadEuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="49551412"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="49551412"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 05:59:28 -0800
X-CSE-ConnectionGUID: wC58FC4tQbGril6uf5to6w==
X-CSE-MsgGUID: 8mASF9aXRg2IbmK2TGu3Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="112461518"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jan 2025 05:59:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 23 Jan 2025 05:59:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 23 Jan 2025 05:59:20 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 23 Jan 2025 05:59:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qE6JmbeNw/+86jEteCmW5aihBKgWWcVWOr0BdDQku9zhWsRbRUNfdx0hw582GY5Esq8hVURydg3/LrIXx6zUocWpjWZkwpSkM4aisKCTKpmmAhEEY3Icebxo+BOxXH5+kNTx+ewYKEhbzh8rHmHmbLs1Rg+gGJV8sD2WBm31Ab+5hfZXOItKk350r4QW0Fwj4sVJNa5FgMAajNh3Bqdz6V6qu3X71OKSap3JBHCk4JqAJIL4zp7ZMy6+OLsYnB8V/2V8qDjOzell2O7y7FUUkrX91/YrfI+hSAzIHV6vNZmRZSaknebetGhWp9ruM7klrbsbfbdC8Hm11iUBC+cU1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJrIoAXJMY7qHTCE/Y03q8yiNayT/CKJ94yztiDojv4=;
 b=lH6VXdK0QpliP/w784119ULESoXgN5n+Gw6hN+x0GPhNeBNxOQfgH8jOdCGZLXgtE0tJ3xWKbP0sZzDjrNu7DQx2geB+yj9ecY2mPln1VZypau9zGpPtdvtdEcdwEjvwRPs7S0KKhK+aWRRr06lwltQjnpOErxMe4jax/aEa01UuoKr7ix7SahVohem9YF0im7NGN+yn5wXvaOE3TuX6bOY/qZhAcTdL1TB7MH/VawwPKWCYjBqlu30bxY0lyTGkE/f09O5t1KvnaSY3uNgp61RQVJh9GExDygW0qAxc9rzldTLVDfQ1FWN05UzBOGrKqK0JjvQ4fNCCL0tV/RW08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by DS0PR11MB7903.namprd11.prod.outlook.com (2603:10b6:8:f7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.19; Thu, 23 Jan
 2025 13:59:18 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::8f29:c6c9:9eb2:6392%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 13:59:18 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: "Chauhan, Aditya" <aditya.chauhan@intel.com>, "Gandi, Ramadevi"
 <ramadevi.gandi@intel.com>, "Tahvanainen, Jari" <jari.tahvanainen@intel.com>, 
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 i-g-t] tests/intel/xe_compute: Add test documentation
 to reflect proper category
Thread-Topic: [PATCH v2 i-g-t] tests/intel/xe_compute: Add test documentation
 to reflect proper category
Thread-Index: AQHbbZo3tZtxZtBBF0C/JH2H+tEJD7MkYq9Q
Date: Thu, 23 Jan 2025 13:59:18 +0000
Message-ID: <IA1PR11MB6097CA4C2F6AE94667977A2D86E02@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20250123132438.37754-1-aditya.chauhan@intel.com>
In-Reply-To: <20250123132438.37754-1-aditya.chauhan@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|DS0PR11MB7903:EE_
x-ms-office365-filtering-correlation-id: 6c9235e1-4116-442b-ec71-08dd3bb62130
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?THBoU2ZNSnF2MUZ4K2dyTHFlVlpsK012aGhHV3hxUnJqdjhodFZzNG9ZNE1t?=
 =?utf-8?B?aW9sMSs3blRWcWErZmRjb2lMYVd2VEZta0tCYWxSY0drNGU2RFN5SHI1THJw?=
 =?utf-8?B?RklkZ2crRTJpcEpGNXI3RjMxZlMzbjh3MGtNaDlkMEpMZEJOelZKRFFHWU1h?=
 =?utf-8?B?THptU2I5Ry9hYXVycEZyL09hbTFVdjZwR2FWOVZmOHc0QzBmMHhzY05qa3JN?=
 =?utf-8?B?TVRCUDYrd0hQTFRZRVF6MnZTSjVpazJYZ3JyM0dHbUMvZlM4ZDR2OXpKOWRM?=
 =?utf-8?B?bHNBUWJpTkdveS9MOEFKRmJqTlpRTmg2K0piTGtFTEhsVkNCNW1CcGFpNkxk?=
 =?utf-8?B?VTJ4c1NQS0ZlN3pLS0ZCdVJSTXY0SWFFeHRmbHRlOXZTYkZrb1FPeXBFTVR1?=
 =?utf-8?B?UmNkU2duZDFJcEYvd0dNMDVDWVA0T3phbVVscjBEUUc4aDN1VFhhTWVaaXdl?=
 =?utf-8?B?RlM5L2xqZ2VpTFI2ZjdpUWVqMW5oZXhtbWJTSjVtZVVTaE9Da3hhODk2ZjFJ?=
 =?utf-8?B?R0hZZUlQa3U5b3hSakFHaitUcnFFTEZMVHFrdi81cEJKcTJwUXRoMU1rN005?=
 =?utf-8?B?ZUM4VTNHT1E0QU1VMmxPaERIUEx6US9uanNvektEanhUeVRBdnBkM3BRQUxO?=
 =?utf-8?B?eHNDZTRlbWxvZ0pzZTR5SkNTM1k0NURsNU42RGtFOFZVMEtORTNkV0IzaW5h?=
 =?utf-8?B?SHdtY1NIcS9saUJMdldTUWJaL1IwN1RNWEVWbFJ4VkVMMnJ5SkVZZkZaZUlK?=
 =?utf-8?B?L2lwVlhIQ3l0d1pBSlpsRVBuQXQ0TlFpUVZWZUc2RStiRzRnekpYZGRYMysr?=
 =?utf-8?B?NmhncWdWNlBpQjNNSEYwZks3cnU2QlR0OTVkV2M4aXczZkViZ2NTY0ptZnBN?=
 =?utf-8?B?OUt3dEU3UkpTNk1Vb24xaEN5ZTdMaWVDRmRzcmg2bVorZTJmWnB2RTJsT3gx?=
 =?utf-8?B?cVpaazZ2SzhsTGVSRzNOTXJUcWVWL0g5SDl1bW9xcFB0ejNJYTNzejQvS0lD?=
 =?utf-8?B?MGs4Y1l3enovUGg5bElLcVIxM005WWdTUmtTOEtmNGVwWWVEeFlZN0pqZTAw?=
 =?utf-8?B?ckFMblllVFlYSGdWTGxPaGFCRlFEK1NScXZvbDhSNXo5UlFHbFFuRUdoWHkz?=
 =?utf-8?B?YStkQnFxZmZCVGgzZ1g4eXIyN01KbWpMRWRLcmhROWVONmdWY0piU3E4dHJF?=
 =?utf-8?B?d3ZXd3FUWUtzV1hKUDdScmN5ZWxSZFZoL0h0Q21td3lQcTVud2RsQS9Wc3gr?=
 =?utf-8?B?OTROV0xaNEg0cG9ybTZiSFNtZXVlYWd0T1BxYzBPSUJpKy9aSFJRK3FHVGVU?=
 =?utf-8?B?Z0VnOFNaNUJYZ1pDYjdseVpOTWgyYjRoNXBRbWpJYWxhVGdFS25PdC9QS2hK?=
 =?utf-8?B?UE02SHlOTXA4ZDNBNW1rRDJ2c0FyalpXTFZMdDdjVmJ3TnhQekVFWGczN0VH?=
 =?utf-8?B?dUZ2T05YQ3JCLy90QnppanFub25ZUytNc2FMQStkNUoyZjJtVkhKN25KOUVw?=
 =?utf-8?B?ZHVENTlTRkZKUUtIU2xkZTdER3NUTlRUb0tuY3gxQld6MGhMcDlxRkZqdXo0?=
 =?utf-8?B?ZjBNWTB3YjE4Vk1McmdPTFVCY1ZYSGxYaHh4Y3lSekJIZG1nSy9oSWdiZVBa?=
 =?utf-8?B?VVpKVnh5UW8yeit0WGdOMmV6NkU5elM1Wk1GVDRVWEk4QzRLemtaQXlPTFFN?=
 =?utf-8?B?U3EvTk9EbGUzNnhjbHIra3V3VkhRMi9FcHJ3VVJ5VXpKT1NXcVpIMExoZ1hk?=
 =?utf-8?B?NzFNeTNRTDQ5NTUrOUJmUnhXOG1KbmpJZVg5eEx2VThSZ0dQV3lHbXlONEpW?=
 =?utf-8?B?aDRkVjJuREpYR01lWjBOM2ZBWDU1cFR1TVVIbU5qZmo5MVdXV2pIVE01Z2Qx?=
 =?utf-8?B?RXczUzRRNkJjNC9uM1RJU2JCYXdSdjcrcE03MDhhMWtMczRnZWo0a2RoaHpS?=
 =?utf-8?Q?khbOfUbkdLiqYNLepowVILDWtg/0G60F?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tlhvd0lUSzRIWkFub0JGTFAzME5URE1EN2VHUk4rZEgyMDU1V0RqcnFmNUNZ?=
 =?utf-8?B?QkF4eG4rVXZVUlZQd092NWtKZW50SnllY0dYVUpyelBscjRMVThVVWc0WG40?=
 =?utf-8?B?djdOU1NUVjVXT1M1VTBrSkI4WTI5YU5TYXhBODZzQmQ0KzRWazRxRkFYSnZu?=
 =?utf-8?B?Q240OWxLTzF6aEZkZy9lOUtuMVBKcjBVVG5nWnI4RHFibklvdzZjaXZheklD?=
 =?utf-8?B?SW5WRzM1WmsyZUh5M1IzYUhob0ZCWjVVL21sbjhUMDVKbHNOMENNTWFlNUxT?=
 =?utf-8?B?MXN0aTVRQmhUVE1QR0RkUXkzYnhHNHFkbnlsWmpvNTg4dFdYRnBQVHlhM3k3?=
 =?utf-8?B?WUYySmZqbmFyYUpJN3BWci8zRnIrbDFFNVJ0YURDUU43WU9ZQkMzK2ZaN3hE?=
 =?utf-8?B?MDdOYjdhNmsvUnY0QURvTDJOYnpqb2hUZVFhTXVrVE5jSUF0dTJ4VU5rQ0hC?=
 =?utf-8?B?RUdhS0xSTUFxeU9YY3lhUjh1ZWd6WDljVlVnMit3RHhsUkdYTTVzYWhlMkxq?=
 =?utf-8?B?MG1PeDJIOEZkMFNZNmNGdld0dEcxQ2l5Y0VkQzFhUDdzRC9DbkUyMmhUNVFI?=
 =?utf-8?B?L3VHSXBueVpOMHI2NnhscEgxK1lGRDRRQjhUbEtXM2lYeXJ3emp4aVlZSlM1?=
 =?utf-8?B?bXF4aTdZY0Z0aFVhNjJjK2ljSVBBK2MvZTdIaGlyb3U2cnEyVDRyc3E4THdt?=
 =?utf-8?B?TnJIMGF3M1FQS01wZnRyMEpJSS93ZmZleXdXSzBnTHFGOGhyYkUrMzFtYVR4?=
 =?utf-8?B?ZXFrZUNkR0ZWMmVCSDBnd2Y0dVdoUWE0Nkxoa2NaKzhXdlJSdTZGcjZ1SE1L?=
 =?utf-8?B?RE8ycXFxODFlWWh6eVk4STBoWHNrZmJaWEZlMForQTZEQjVBMm9ZbkhmdWc2?=
 =?utf-8?B?cjBFRkJuV2lPM0NMNWhxemdhNTRVbmlPVXFDYmdZeFhLeEYxNWR4OFJSYTA5?=
 =?utf-8?B?WEJjb1dwd0t2Y01NOU1YdG9ZTnpYcEVtaTUyaVBFZ0V1OU5zeGdhSjBjSTV3?=
 =?utf-8?B?VW1QdUNTK3FiT1RJcGhFUmN6OS9MWXFhK1Q0R1lwZzRnYXlycU1HMzMwWVpk?=
 =?utf-8?B?VDQvRkZ5cFhuQVpiaHJ1bGxVZlQ0TTk5MnZROWFGQkszTUxKaS85OEFnZXhE?=
 =?utf-8?B?UStXYzhGbW5pcW5uVno1djBCMFhpZXdNMnNscWcrTnpZV0tUQWVQaWcwVHJQ?=
 =?utf-8?B?SGdUSTVkeVE1aVZIVUlLcUpxZjlwb3gzY1ErcXNYSjNWRlFNSDMvczUvQ0RF?=
 =?utf-8?B?dDdFbGM1Z09Bb0ZWM2FQRWFlSDlZVXQzWTArY01pZXRLOXhmMktpeXhENmhq?=
 =?utf-8?B?ZlBuL1cyTHF6QVhGVzJRODJIZ2l1K0hER1MraVZ3V3hJQXg0WVlIL1g4bFV0?=
 =?utf-8?B?RVA4V1FSVnowUWtTUk5LaEFmQWt4K2N3Q1BFN1M2aHJta3VkVUdmQlFWWFpF?=
 =?utf-8?B?VmI4YVBQTTh2Ynp1L24xWHcya1VIeS9WQXBQSjZ1U3Fjd3YrZ3JEQ2pJOGFF?=
 =?utf-8?B?K3g0Q01FVWpYTlkvWENzdXZCT2VoaDk4YjVxR2V0Z2FGR1hFc1ptMlFVemdX?=
 =?utf-8?B?eGxhbm5vMStjS09XcjJoZG1VVHp4b09WY2tyM0V0Zmwyekc5eFhXaDgxeXVV?=
 =?utf-8?B?TUI5NTFzU3dGZXJiait1d0FvcklacFd5MUVna2xHTE5Wc0RUb09LV2t6WDQ4?=
 =?utf-8?B?aTg1OUJwVUFBZ0Ridkk3OWprb3BJYU4vS0o0QkhZT3VSaTJGcHBFM29PSkFT?=
 =?utf-8?B?eExkOTJrUHovb0txTkN5MExTUmF6WWxscG9FdHNwZ3dqL081cFdpV2ZxL3dq?=
 =?utf-8?B?cnU0N2JGK0JSWjZzKzBEL0d3cXF2Z3VISUt2eWxrZ2FBRjd0L3RrNnc2SkJv?=
 =?utf-8?B?ejFDeGpLdEVkVW9lQUgvdzEyNFg0b1p6RS9xeGRRL05pK3VJWUVGZTNtKzB6?=
 =?utf-8?B?ZXkvS1VHaSt4T1hNdXV6dk9SSUNZOWhUK1hQUnlsdSswUVNKejdHYWxKUS9t?=
 =?utf-8?B?S3N2c2tkOGI4MWN6Z0RUOXVEMllZTlV6NURhaEI5SjQzQ1NBRTNSYUh6emdl?=
 =?utf-8?B?SStTcXBKdE90by9BbkZyVnpBcWVabXEyQ3F2TmEwY0p5REZjSFdVMU4waFZa?=
 =?utf-8?B?QjhoRVdBU0RhYjhkNnltRWVPcGdhMVBsY2llN3ZGRkRSQ2NGMDRHNWdyQ0NO?=
 =?utf-8?B?bWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9235e1-4116-442b-ec71-08dd3bb62130
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2025 13:59:18.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E6ItBuB278C2sOxHS0k5lurs2VaSokWipGD5CdwABELkQs2dg+E3V+LBRcu0nPd5tGChlaSYb7dJ4QLTtlHNx0UjeipgC4tDQfU2Uf9Xl/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7903
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

TEdUTSDwn5iKDQoNClJldmlld2VkLWJ5OiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5h
LnBpZWNpZWxza2FAaW50ZWwuY29tPg0KDQpLYXNpYQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KRnJvbTogQ2hhdWhhbiwgQWRpdHlhIDxhZGl0eWEuY2hhdWhhbkBpbnRlbC5jb20+IA0K
U2VudDogVGh1cnNkYXksIEphbnVhcnkgMjMsIDIwMjUgMjoyNSBQTQ0KVG86IEdhbmRpLCBSYW1h
ZGV2aSA8cmFtYWRldmkuZ2FuZGlAaW50ZWwuY29tPjsgUGllY2llbHNrYSwgS2F0YXJ6eW5hIDxr
YXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+OyBUYWh2YW5haW5lbiwgSmFyaSA8amFyaS50
YWh2YW5haW5lbkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KU3Vi
amVjdDogW1BBVENIIHYyIGktZy10XSB0ZXN0cy9pbnRlbC94ZV9jb21wdXRlOiBBZGQgdGVzdCBk
b2N1bWVudGF0aW9uIHRvIHJlZmxlY3QgcHJvcGVyIGNhdGVnb3J5DQoNCkZyb206ICJDaGF1aGFu
LCBBZGl0eWEiIDxhZGl0eWEuY2hhdWhhbkBpbnRlbC5jb20+DQoNCkFkZCBzdWJjYXRlZ29yeSB0
byB0aGUgdGVzdCBkZXNjcmlwdGlvbiBzbyB0aGF0IHRoZSB0ZXN0cyBmYWxsIHVuZGVyIHRoZSBy
aWdodCBjYXRlZ29yeS9mZWF0dXJlDQoNCnYxOiBBZGQgTWVnYS1mZWF0dXJlIGZvciB0aGUgc3Vi
dGVzdHMgKEthc2lhKQ0KDQpTaWduZWQtb2ZmLWJ5OiBDaGF1aGFuLCBBZGl0eWEgPGFkaXR5YS5j
aGF1aGFuQGludGVsLmNvbT4NCkNjOiBLYXRhcnp5bmEgUGllY2llbHNrYSA8a2F0YXJ6eW5hLnBp
ZWNpZWxza2FAaW50ZWwuY29tPg0KQ2M6IEphcmkgVGFodmFuYWluZW4gPGphcmkudGFodmFuYWlu
ZW5AaW50ZWwuY29tPg0KLS0tDQogdGVzdHMvaW50ZWwveGVfY29tcHV0ZS5jICAgICAgICAgfCAy
ICsrDQogdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMgfCAyICstDQogMiBmaWxlcyBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAtLWdpdCBhL3Rl
c3RzL2ludGVsL3hlX2NvbXB1dGUuYyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUuYyBpbmRleCBl
YmFhNWU3NTAuLjYyYmViMjRkYyAxMDA2NDQNCi0tLSBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGUu
Yw0KKysrIGIvdGVzdHMvaW50ZWwveGVfY29tcHV0ZS5jDQpAQCAtMTYzLDEwICsxNjMsMTIgQEAg
dGVzdF9jb21wdXRlX2tlcm5lbF93aXRoX2Njc19tb2RlKGludCBudW1fZ3QpDQogDQogLyoqDQog
ICogU1VCVEVTVDogY29tcHV0ZS1zcXVhcmUNCisgKiBTdWItY2F0ZWdvcnk6IENvbXB1dGUgc3F1
YXJlIHRlc3RzDQogICogR1BVIHJlcXVpcmVtZW50OiBUR0wsIFBWQywgTE5MDQogICogRGVzY3Jp
cHRpb246DQogICoJUnVuIGFuIG9wZW5DTCBLZXJuZWwgdGhhdCByZXR1cm5zIG91dHB1dFtpXSA9
IGlucHV0W2ldICogaW5wdXRbaV0sDQogICoJZm9yIGFuIGlucHV0IGRhdGFzZXQuLg0KKyAqIE1l
Z2EgZmVhdHVyZTogV01UUA0KICAqIEZ1bmN0aW9uYWxpdHk6IE9wZW5DTCBrZXJuZWwNCiAgKi8N
CiBzdGF0aWMgdm9pZA0KZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGVfcHJlZW1w
dC5jIGIvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMNCmluZGV4IDljNzYxNDFmNC4u
N2NlNWM1OTVhIDEwMDY0NA0KLS0tIGEvdGVzdHMvaW50ZWwveGVfY29tcHV0ZV9wcmVlbXB0LmMN
CisrKyBiL3Rlc3RzL2ludGVsL3hlX2NvbXB1dGVfcHJlZW1wdC5jDQpAQCAtNiw3ICs2LDcgQEAN
CiAvKioNCiAgKiBURVNUOiBDaGVjayBjb21wdXRlLXJlbGF0ZWQgcHJlZW1wdGlvbiBmdW5jdGlv
bmFsaXR5DQogICogQ2F0ZWdvcnk6IENvcmUNCi0gKiBNZWdhIGZlYXR1cmU6IENvbXB1dGUNCisg
KiBNZWdhIGZlYXR1cmU6IFdNVFANCiAgKiBTdWItY2F0ZWdvcnk6IENvbXB1dGUgdGVzdHMNCiAg
KiBGdW5jdGlvbmFsaXR5OiBPcGVuQ0wga2VybmVsDQogICogVGVzdCBjYXRlZ29yeTogZnVuY3Rp
b25hbGl0eSB0ZXN0DQotLQ0KMi4zNC4xDQoNCg==
