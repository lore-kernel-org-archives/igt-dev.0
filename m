Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E815D339AC
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1A5C10E267;
	Fri,  5 Dec 2025 18:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fF+ym/RA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7A1E10E267
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Dec 2025 18:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764958411; x=1796494411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=adyZ1zpXsJUeCnToJUKOruzo3bvDygnGEQfCso28+5U=;
 b=fF+ym/RABjmPHJunfRg8TGQvvZDVYCtBz/3GsuaqT8ZtUWGv9dtXmojx
 rEpzp9LnNaGrUw9RkUUHaZMdpH3+hPmHmjM3y/TcE4xMXIwRTcqFW5fSv
 wg7VxZfE1+XASxebf/j3SEnBZPbojp0jHVZ1w/8tFoGD3dvj35cp1Y2sq
 MBB4SIq+JnP0WS4TGICLw0uc98wqllfvRMfLDZwD2Xs6QXQvC07rV5XFV
 FdNWJ8NPjSDJ3sjRFfMLk4HnhMwK8XyYhkJJmA9AExzJQVJRcQa5LtJXn
 JWszR5vsXq0b2jLxuBoEgZGb4zRY2TqtnkU4HuYveoQ7aTAFKWMOxJ5Pu g==;
X-CSE-ConnectionGUID: njslIJ5wQwS+pSFofBO2MA==
X-CSE-MsgGUID: WS0Tg8UpT9el6LfjctX7Og==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="77319368"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="77319368"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:13:30 -0800
X-CSE-ConnectionGUID: 6xQxULtbSBazlbAzQw98ZQ==
X-CSE-MsgGUID: o9RNBdMqSFOAQYSGlV+iXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="218696785"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:13:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:13:29 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:13:29 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:13:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNAVWm1Q8PszXvJMViFUdoXuVJRfqiqPdc12dazMLrbIAPpgpWftUO/3DZ4QYNhI2vOzZZuLkFCSaTxeynD6bHQVOAtEtxRzHEwmwIrcbx6lzeWJ/mqnlo8iLBa63e4cUvr/vumO0/uKwdYdbdpviE19fDVXMrzyRR97Fre9U5/LuwDAZt3F2eFnx6GD1vzpCRz7GrM4oQ/3UulVyehTZeNwQi/KVrVb6DcjyTnOG0V/EzOB3FmUvjSBh9T8M74iaoWZYJ+sR6WpwhwwKAxN6WiwGH4G5ZwhXq0GO6UqZaGTQGwV15vn+i+HdjLFtHevGbDkS2SC+5CAAPDJMKfVGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adyZ1zpXsJUeCnToJUKOruzo3bvDygnGEQfCso28+5U=;
 b=ttX3yPN0gwlZJSQrE26RjI1fcxP+zOgG1DiusGn3fkyfJaDEENs/PW+eR0hucFsHilCw+njCPR7k470AHWpeLyOdCeQS4FxWLKfZO0u3BbFGmccTShrSFbuJJEJwZkYePLp8DasP/LxGrZFPL1apRfsjiCA2M5wl+OGkK3rVCRRavF3p8RWZtAZhZLh4Bbm7Tvj7tFkysejioQD+e1TvOzjDwuTvWGCVeAt+kJBxHDP3gdxDSbL13zvrdlMeeBAJTwQrZot0OimptKBOSCU46+ZNsOGnklXG/ekfWMz1hFIJrnBEsYrfR61zs31titQt6IaIUHYKo0sjZ9TvPIPBQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.12; Fri, 5 Dec 2025 18:13:26 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 18:13:26 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ch, Sai
 Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Topic: [PATCH v2 12/19] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Index: AQHcWpr/am1+v01wQk24qso2BepcNbUSDHKAgAApAICAATsJgA==
Date: Fri, 5 Dec 2025 18:13:26 +0000
Message-ID: <850bb08bb638a1cb325add59800ac68e7e930a38.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-33-niranjana.vishwanathapura@intel.com>
 <b3859a79cb9f643b1978d05aee064fc936384c79.camel@intel.com>
 <aTIYfxGicqGty9rA@nvishwa1-desk>
In-Reply-To: <aTIYfxGicqGty9rA@nvishwa1-desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CY8PR11MB7847:EE_
x-ms-office365-filtering-correlation-id: e590d1d8-3136-4540-0856-08de3429fc87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dzlrYVFCNEFHRDZ4NWpsU1BCNjdoanhtQUE4ZkJKOVQwWTJiZzl1Z0lTY3NM?=
 =?utf-8?B?OVVkaUQwQ1lqK0Q2Vnh2eTl0THkwY3FENWJpRGxkd2RweGdzc1orWTAwWnh3?=
 =?utf-8?B?Q2tiaFNRVlJWckpGWnRVZDZyV04ycW5oVTlNTHRNbmo1SzY1V0xUZU52bElV?=
 =?utf-8?B?ZHFZc3Z2UnRuYUs3dk9icUtXMmhkblBiOGQzeDJHT3E1N0tjU2pSMHpQVEpD?=
 =?utf-8?B?dzRjNUZiRkN4bHYyMWFTNUpzQlZScllZUG9yMnZJN3l3WGlUb0N0VXloMUg5?=
 =?utf-8?B?eit1MjNWYUY3aXZwRlUxWENhU2k2TTFEb2tEYWVSTnNSNi94eERYRm94WGxT?=
 =?utf-8?B?a1ZrYUsxZ3pQMXdnNGlmL3RxTVBXY3FqelkybzNET3kwcmNXeEp0L2tVU1Bj?=
 =?utf-8?B?Nm82cUVzcGNRcHo2Q2hURkZXSHdrdGJKR1FsRlNWbW96S1RIVWxzdXUxQ0xq?=
 =?utf-8?B?KytmbVYycTZWa1h5eUlQclo4VnVHd0pVVlc1OVdKem14eE9lN0tibyt0MDNy?=
 =?utf-8?B?bmg3Q3p0QkZKWDJVaUpMQUpQRDB5WmpMeURzV1pCU2t5ZjQ0YkZvVlBqQlJV?=
 =?utf-8?B?U1Y0VEJ3TWNCUzByQ0xQcGxzM1ArclRGclduekdOYkZaV0dyWWxJdTVlVVVN?=
 =?utf-8?B?SHdzUGt2cGx3MGd0N2lXYzZHUTRwTEJmSWV5WVM2QjRIV3ZkeGNEckdtYzJZ?=
 =?utf-8?B?MjZOb1FJaGtWUXN1aks5bTV2ZE9pU0JOeGlVNFUyNld6WXQzWDdwSFBEbjQx?=
 =?utf-8?B?SjNDczBRNTVpdjZGRlAvZGlxbC84aFRtM2RUb2pka2VyM3h3STFCdms4WGxP?=
 =?utf-8?B?Y1k5N0FONldydjU5THNJSHQxN0d0MXljYUo2My9neGFZamNTaW9XNFIwVlFB?=
 =?utf-8?B?OTFBWXZZRjIyWmNiN05hU2huUUZ2TXRRVmxydzBmTU1pRVBZSG0rS1RWTHlW?=
 =?utf-8?B?YkkzMDZlSWQ0eFFOcDRKTGxvZWN1c0dFdlJDazNBbjdJZWZJSWFEMnVjdVNV?=
 =?utf-8?B?WkZGVDA0S2dQbmNXY1NjcUkwWnVjL3ZoWUM5MU9BaHF4dm16WFNQODdVUEFj?=
 =?utf-8?B?TmJwSWFoeTMzencrWjh0bHVrMVpHR2thRVZKRFVvcGpnYWhzS0ZucE82UTRK?=
 =?utf-8?B?djByQVI2UjRYMEtvSEw3UWp2cXZId2U1bUNVcDRCOVRNaVR4WGFsZUk4Um82?=
 =?utf-8?B?Z3IyMFpKWGM1VnVEVDAza2hUMXFUbi83TVBLTjgrNjR4RDBIaDFGWFdMcDRP?=
 =?utf-8?B?UWVrMjhaRzZaTDYxeHk3b1N2dVVQN0x1MlNGVHJkbXhRZU5yRDIvWXBDdVM4?=
 =?utf-8?B?SVlPVndBMjBUZzNjeFNxTXQvN01wdjUvN3ZZWElqTzRyY3BTS1B4ZGdyeS9L?=
 =?utf-8?B?c0J0dnkzclVtaUhNdVlsZ2h1TVVWVktVbDd4Uk40VE1QRUh3UHBiVUE4RWFt?=
 =?utf-8?B?Snk4U3RXaHVadFk5RWNUSlRRWnNHb0d6TGx4cUtwZUEyZUFWdTBrU3RTS09z?=
 =?utf-8?B?Vm9SYTNNOVRTR3hHNHUyL0dCME5FZGFHSDRVeVduY0ZUYlEyb3lQM29KVUUz?=
 =?utf-8?B?SHN2YUo3K091WHRNQTAxT3VrblpaOTc1dkQ0SThXZkEvQUFCQnRNalJOVUJ4?=
 =?utf-8?B?aFpnQTNMSmkvWkxpWUdLblRGN0xqbFUrSmR5TjNVemNXVDFyV0JPaDRjcXRt?=
 =?utf-8?B?QXgwd0pVQW96eXpFY3oxZDAwcUhCc3lrM3ZZMUlEeUpFS1Yxd3UxdERoQVlU?=
 =?utf-8?B?R08zL1JiN2Z0QnhQaFN6U3E5N2JDK3hCSjdmbWlwWDNYNFV5NW55TGFZSkx4?=
 =?utf-8?B?ZlBXOCsyL3M4MFMwVHE4aStINldvSmFvRzFoWFd3NDcrRGtHSUlSODNpc3Nn?=
 =?utf-8?B?dXNrTW9QQUgrY1BYSllOKzNxRnpKM2Q5K0tPQU84cUFpTEU1aGZNZlVBb3Zr?=
 =?utf-8?B?cDlHYlNnamM5TmYvTUNPRkJKQWJVSGtDN3hSeXl5UUVkeWt4a1RwaW1HajJB?=
 =?utf-8?B?TUROYU05ZXFoem5Pa3A2RDBkeDB2dThOanlNVVg2QlorZk04UDRuUFozczFJ?=
 =?utf-8?Q?0p389Q?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXBQU1k5SHZTQmg0WC8xbTlldHRlb0NteGdGRFJScWo5Z0pnMmtCSVV5SS82?=
 =?utf-8?B?Wi9UcXhvTWlVcnNYZEQyNzd1YUxPZnp1dEJ3dUU4amZXdFJhNlBMRklFekM4?=
 =?utf-8?B?eHZwb01oYzlXckxNdWtFRWpCVnNXZ1NwSng0MVo0Y2lVT3BBc2w1S3VRNmJz?=
 =?utf-8?B?aEF4WW54UVNqTnplNGptRTgyMWpOVHZ2b1pZVVZyZlVaUU83Y0ljOHdwek40?=
 =?utf-8?B?ZlBSb2hYN2dtR0U3R2RaYk9TWkQ3MEpGUHpWaHB6Mk9ZdGNHM0tKSXdqRFpV?=
 =?utf-8?B?eUJueFc1RC9LeHRyd2w3M1pOSXRXREk3T3FKUWVZQTRpVjlkZitRZWk5cDE0?=
 =?utf-8?B?aC9qblM1NzFpVkliTlhNMGFhZ2VXWWRjOXpyMnlOQ284L3dhZURTWHQzSVZY?=
 =?utf-8?B?Q3pxWmNsY1Voa3BwVHBBaEhIajhkQWpod2V1cmdIRER0V1lSLzcvYmNQSUFR?=
 =?utf-8?B?Y3pkUUNYL09mZVVQbUNxcDM1eGJyWVZvdkNZM2NmLy90cHVXM1BHTUtBMEIw?=
 =?utf-8?B?WWpqV1c4NEZPVlJYTTBWcXBOWDl0WFdJdDBBdXNtV29MZEgwMWdLN3Q3OUlR?=
 =?utf-8?B?QjQzQ1BJQVJUVmNPMjd5bXB4VGI3Z1FnUEI3QW5jUlZJSGlxUjdwelYyZDNR?=
 =?utf-8?B?bGMwMjQwUE92QlNwdzl6bnVhVThhYU4vYTRsTm5heVNHcEhCU2x5UTVqNm9X?=
 =?utf-8?B?cThFdmgxcVh6UFFiQS8vRGVzNkRvSlY3cG52QVFDS2NRdXovK1hnZld4SW8v?=
 =?utf-8?B?OHpNTUxVOGVxeGZBWHo0bldtWHhjalhkYjRYQ1JTZGJORFpkQWFCM05uVzJI?=
 =?utf-8?B?QmVRUWlUZ0VtVDd3Q3kxNFVkREdoT28rWHI5MEkxMzI1MXZYL0NhWlg4VkJR?=
 =?utf-8?B?eExQaU5oUHd4aFdFemVLb0N1Y2NBV1V2S25lcFlOSnRJWjNJS3p5bTVGU080?=
 =?utf-8?B?SURxVjA4OHhrNW1oU0xFUDluSDhTMVFxWHhPalM3Z214Mm9Sc0JBT24wUVpM?=
 =?utf-8?B?UVdzdE5qbDgyVHBZMStpMElEbXhyaDJyb2FnajBFbjhxVmxiNkJuNU1wWU1E?=
 =?utf-8?B?alJxU2NwYnFzazlRanFXWk1yamNKS1JPcTFnTkhwV1VhZ1dHenUrYW1IaW1z?=
 =?utf-8?B?cG5GM2E3cHRMQlJLN3JVTzE4amhIdkR2UnE4RGp4c09lUy9kUFprd3ArMC9y?=
 =?utf-8?B?L1pIVzE3dmdEZ2Fad20yV1lPdjZPU2g1U1B5RVN4QnIxR1FqQVhzYXZaTUxr?=
 =?utf-8?B?MW54ajR1VDFsMGxZY3ZnOW4vKzdOcm1oVzBWRjlBdmVldGhNOC90KzdCdFIz?=
 =?utf-8?B?RU1wemc3WDBXK2xheEJIT3N2RFBzazVCMTVMemRvYUZwU1JTV0FLdC9zb1JC?=
 =?utf-8?B?UUtPdGprcG4wUDZYVW9nV0lZNCtnYmxPdHptcFBzeUNHM3UvY1FKNUV4cXk0?=
 =?utf-8?B?V09qRWlncVZQeWJwUmVoRFJJem56TGVHbndjeExKU29kNmU1T3owSlNTSThJ?=
 =?utf-8?B?SVl1THVqTURIcm9HL3JSNlJaYlJ0c1RjZzRkUFNFZzQ0b2taYkxVNytlWEZF?=
 =?utf-8?B?RUxaOGFjT2RkOXNSVXA5NHFrdE5WeS95TVdTUERyL2g0cmpWY0tqdTVlZ1dq?=
 =?utf-8?B?YUxlbXo1ancydllOZEw0SU1UYWJVRHFtamlnY0crTXZHSm5VVWRxeXBTYTJ6?=
 =?utf-8?B?WXpJaFhEdis3dVBMZjlibEIwUHVvU1dHV0VaanBDWHRUbUNsSm5lTjAzOXNW?=
 =?utf-8?B?dHJTcXhFTnNEdHdrZjM2dHdaZlUxVmtvaUlMNmtzRW10aGhvajNESkg1ZmhZ?=
 =?utf-8?B?SWlXSUdyaFROUEtZR2hIZWdpQUpYdWxQdHpTNGhOUU1MREZwVnBNRHo5R2dh?=
 =?utf-8?B?bUg5bk1uRGsrR0gxWVJhTU1POUF1cjNOQ2ZXZGNsVmtxOEZQZ3NUcXh3UGI0?=
 =?utf-8?B?UDREVFRReVFIRVM1ejluaDg4WCs1cUIvRFh5V3luWVRIeG8rdVJTQmtEd3pz?=
 =?utf-8?B?T3lqMy9IV2kyanowV2ZLV0xHY3ptbkNUeEpwcFhVR3RCOVUzUGozVWM2SkJT?=
 =?utf-8?B?VTduRFpGVlN6TjB4cmVISm9CdzVpY0lwODc4RlZwSFZGcG9XcmJ6QkpNMUJz?=
 =?utf-8?B?cU9xQmlHc3ZLa3JaNmlUUEFWQkJmUHZqb1hDRHZDRHgyU0Ntb1NiUS85RTN4?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94C8199C5FCB284B905CE50FCBD83CDA@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e590d1d8-3136-4540-0856-08de3429fc87
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 18:13:26.7516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sacqp37JOu11fQrTYVgTOvf3sXgCY7ZFBOEPlWSjTaJVkXAOyLl/OWfnSZ8DZZcLZ1EJqdkXtPepZkYjsOeqIjCTnXzGsUi11jMz51m9rWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

T24gVGh1LCAyMDI1LTEyLTA0IGF0IDE1OjI1IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IE9uIFRodSwgRGVjIDA0LCAyMDI1IGF0IDEyOjU5OjA5UE0gLTA4MDAsIFN1
bW1lcnMsIFN0dWFydCB3cm90ZToKPiA+IE9uIFRodSwgMjAyNS0xMS0yMCBhdCAxOTo1NyAtMDgw
MCwgTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYSB3cm90ZToKPiA+ID4gRnJvbTogTmFrc2h0cmEg
R295YWwgPG5ha3NodHJhLmdveWFsQGludGVsLmNvbT4KPiA+ID4gCj4gPiA+IFRlc3QgbXVsdGlx
IGZ1bmN0aW9uYWxpdHkgd2l0aCBmYXVsdCBtb2RlLiBBZGRpbmcgYSBmbGFnIGNoZWNrCj4gPiA+
IGZvcgo+ID4gPiB4ZV92bV9jcmVhdGUgZm9yIGZhdWx0IG1vZGUgdGVzdCBjYXNlcy4KPiA+ID4g
Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5ha3NodHJhIEdveWFsIDxuYWtzaHRyYS5nb3lhbEBpbnRl
bC5jb20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IE5pcmFuamFuYSBWaXNod2FuYXRoYXB1cmEKPiA+
ID4gPG5pcmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4g
wqB0ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMgfCAyMSArKysrKysrKysrKysrKysr
KysrKy0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlv
bigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlf
cXVldWUuYwo+ID4gPiBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ID4gPiBp
bmRleCBhYTg2ZjhhMzguLmRhODExN2Q1NyAxMDA2NDQKPiA+ID4gLS0tIGEvdGVzdHMvaW50ZWwv
eGVfZXhlY19tdWx0aV9xdWV1ZS5jCj4gPiA+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVs
dGlfcXVldWUuYwo+ID4gPiBAQCAtMzEsNiArMzEsNyBAQAo+ID4gPiDCoCNkZWZpbmUgUFJFRU1Q
VF9NT0RFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgMykKPiA+ID4gwqAjZGVmaW5lIERZ
Tl9QUklPUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDQpCj4gPiA+IMKgI2RlZmlu
ZSBJTlZBTElEQVRFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDUpCj4gPiA+ICsj
ZGVmaW5lIEZBVUxUX01PREXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgNikKPiA+
ID4gwqAKPiA+ID4gwqAjZGVmaW5lIE1BWF9JTlNUQU5DRSA5Cj4gPiA+IMKgCj4gPiA+IEBAIC0y
NDQsNyArMjQ1LDEyIEBAIHRlc3RfcHJlZW1wdF9tb2RlKGludCBmZCwgc3RydWN0Cj4gPiA+IGRy
bV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFuY2UgKmVjaSwgaW50IG51bV9wbGFjCj4gPiA+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hF
KTsKPiA+ID4gwqAKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGlndF9hc3NlcnQobl9leGVjX3F1ZXVl
cyA8PSBNQVhfTl9FWEVDX1FVRVVFUyk7Cj4gPiA+IC3CoMKgwqDCoMKgwqDCoHZtID0geGVfdm1f
Y3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJfTU9ERSwgMCk7Cj4gPiA+ICvCoMKg
wqDCoMKgwqDCoGlmIChmbGFncyAmIEZBVUxUX01PREUpCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwKPiA+ID4gRFJNX1hFX1ZNX0NSRUFU
RV9GTEFHX0xSX01PREUgfAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoAo+ID4gPiBEUk1fWEVfVk1fQ1JFQVRFX0ZM
QUdfRkFVTFRfTU9ERSwKPiA+IAo+ID4gRG9lcyBpdCBtYWtlIHNlbnNlIHRvIHRlc3Qgb25seSBm
YXVsdCBtb2RlIChzZXBhcmF0ZWx5IGZyb20gb25seSBMUgo+ID4gYW5kCj4gPiBMUitGQVVMVCkg
aWYgd2UgZXZlbnR1YWxseSBwbGFuIHRvIGRyb3AgdGhlIExSIG1vZGUgc3VwcG9ydD8gV2UKPiA+
IGhhdmUKPiA+IHRoaXMgY2FzZSBjb3ZlcmVkIGluIG90aGVyIHRlc3RzIGFzIHdlbGwuCj4gPiAK
PiAKPiBGQVVMVCBtb2RlIGlzIG9ubHkgc3VwcG9ydGVkIGFsb25nIHdpdGggTFIgbW9kZS4gU28s
IEZBVUxUIG9ubHkgbW9kZQo+IGlzCj4gc3VwcG9ydGVkLiBMUiBvbmx5IG1vZGUgaXMgc3VwcG9y
dGVkLCBidXQgS0VFUF9BQ1RJVkUgZmxhZyBpcyBub3QKPiBzdXBwb3J0ZWQKPiBpbiB0aGF0IG1v
ZGUuIFNvLCBJIHRoaW5rIHdlIGFyZSBnb29kIGhlcmUuCgpNYWtlcyBzZW5zZSwgdGhhbmtzLgoK
UmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+
IAo+IE5pcmFuamFuYQo+IAo+ID4gVGhhbmtzLAo+ID4gU3R1YXJ0Cj4gPiAKPiA+ID4gMCk7Cj4g
PiA+ICvCoMKgwqDCoMKgwqDCoGVsc2UKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLAo+ID4gPiBEUk1fWEVfVk1fQ1JFQVRFX0ZMQUdfTFJf
TU9ERSwKPiA+ID4gMCk7Cj4gPiA+ICsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoGJvX3NpemUgPSB4
ZV9iYl9zaXplKGZkLCBzaXplb2YoKmRhdGEpICogbl9leGVjcyk7Cj4gPiA+IMKgCj4gPiA+IMKg
wqDCoMKgwqDCoMKgwqBpZiAoZmxhZ3MgJiBVU0VSUFRSKSB7Cj4gPiA+IEBAIC01ODMsNiArNTg5
LDEyIEBAIHRlc3RfbGVnYWN5X21vZGUoaW50IGZkLCBzdHJ1Y3QKPiA+ID4gZHJtX3hlX2VuZ2lu
ZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQgbnVtX3BsYWNlCj4gPiA+IMKgICogQHByZWVtcHQt
bW9kZS1wcmlvcml0eTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBw
cmVlbXB0LW1vZGUKPiA+ID4gcHJpb3JpdHkKPiA+ID4gwqAgKiBAcHJlZW1wdC1tb2RlLWNsb3Nl
LWZkOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9k
ZQo+ID4gPiBjbG9zZSBmZAo+ID4gPiB3aXRob3V0IGRlc3Ryb3lpbmcgZXhlYyBxdWV1ZXMKPiA+
ID4gwqAgKiBAcHJlZW1wdC1tb2RlLWR5bi1wcmlvcml0eTrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlCj4gPiA+IGR5bmFtaWMKPiA+ID4gcHJpb3JpdHkKPiA+
ID4gKyAqIEBwcmVlbXB0LW1vZGUtZmF1bHQtYmFzaWM6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlLQo+ID4gPiBmYXVsdC0KPiA+ID4gbW9kZSBiYXNpYwo+
ID4gPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyOsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtCj4gPiA+IG1vZGUtCj4gPiA+IGZh
dWx0LW1vZGUgdXNlcnB0cgo+ID4gPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyLWlu
dmFsaWRhdGU6wqDCoMKgwqDCoHByZWVtcHQtbW9kZS0KPiA+ID4gZmF1bHQtCj4gPiA+IG1vZGUg
dXNlcnB0ciBpbnZhbGlkYXRlCj4gPiA+ICsgKiBAcHJlZW1wdC1tb2RlLWZhdWx0LXByaW9yaXR5
OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZS0KPiA+ID4gZmF1bHQt
Cj4gPiA+IG1vZGUgcHJpb3JpdHkKPiA+ID4gKyAqIEBwcmVlbXB0LW1vZGUtZmF1bHQtY2xvc2Ut
ZmQ6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlLQo+ID4gPiBmYXVs
dC0KPiA+ID4gbW9kZSBjbG9zZSBmZAo+ID4gPiArICogQHByZWVtcHQtbW9kZS1mYXVsdC1keW4t
cHJpb3JpdHk6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZS0KPiA+ID4gZmF1bHQt
Cj4gPiA+IG1vZGUgZHluYW1pYyBwcmlvcml0eQo+ID4gPiDCoCAqLwo+ID4gPiDCoHN0YXRpYyB2
b2lkCj4gPiA+IMKgdGVzdF9leGVjKGludCBmZCwgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwgaW50Cj4gPiA+IG51bV9wbGFjZW1lbnQsCj4gPiA+IEBAIC02MzcsNiAr
NjQ5LDEzIEBAIGlndF9tYWluCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eyAicHJlZW1wdC1tb2RlLXByaW9yaXR5IiwgUFJFRU1QVF9NT0RFIHwKPiA+ID4gUFJJT1JJVFkg
fSwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUt
Y2xvc2UtZmQiLCBQUkVFTVBUX01PREUgfAo+ID4gPiBDTE9TRV9GRCB9LAo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1keW4tcHJpb3JpdHkiLCBQ
UkVFTVBUX01PREUgfAo+ID4gPiBEWU5fUFJJT1JJVFkgfSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1mYXVsdC1iYXNpYyIsIFBSRUVNUFRfTU9E
RSB8Cj4gPiA+IEZBVUxUX01PREUgfSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHsgInByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyIiwgUFJFRU1QVF9NT0RFIHwKPiA+ID4g
RkFVTFRfTU9ERSB8IFVTRVJQVFIgfSwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoHsgInByZWVtcHQtbW9kZS1mYXVsdC11c2VycHRyLWludmFsaWRhdGUiLAo+ID4gPiBQUkVF
TVBUX01PREUgfCBGQVVMVF9NT0RFIHwKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBVU0VSUFRSIHwgSU5WQUxJREFURSB9LAo+ID4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAicHJlZW1wdC1tb2RlLWZhdWx0LXByaW9yaXR5Iiwg
UFJFRU1QVF9NT0RFIHwKPiA+ID4gRkFVTFRfTU9ERSB8IFBSSU9SSVRZIH0sCj4gPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQtY2xvc2UtZmQi
LCBQUkVFTVBUX01PREUgfAo+ID4gPiBGQVVMVF9NT0RFIHwgQ0xPU0VfRkQgfSwKPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1mYXVsdC1keW4tcHJp
b3JpdHkiLCBQUkVFTVBUX01PREUKPiA+ID4gfAo+ID4gPiBGQVVMVF9NT0RFIHwgRFlOX1BSSU9S
SVRZIH0sCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyBOVUxMIH0sCj4g
PiA+IMKgwqDCoMKgwqDCoMKgwqB9Owo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaW50IGZkLCBndCwg
Y2xhc3M7Cj4gPiAKCg==
