Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDC6D2D8FD
	for <igt-dev@archiver.kernel.org>; Tue, 27 Jan 2026 11:04:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE4B310E53A;
	Tue, 27 Jan 2026 11:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abGYmPwr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47EA910E54F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jan 2026 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769511888; x=1801047888;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o2Tr78i7qoLp5O11G5UUWNdyphBG3q7Nyu2YGfXVuEU=;
 b=abGYmPwrOsar34ZqL+SNUrsG+CHW8rapQb5nVTno+ohGsHUzZ0KcMiJi
 M+6FQ48lp7glGDON4sN0wMu35u3PNXe229tiZFpTPNj6J3PQ48HYWky83
 qQ4p4WlAlg1qKVowb6GWEr7fovQC+1f+5tUQCH0M38nARMZOTYuIAJnso
 lhQPIjCrpEwRFOIr7e0TRm4/J1+g7tmMsyO5UBbxkIDGCuBu7z3gopZ67
 ksl8tGFC/BcsS29k37Mdqi0aMDYVlKzKoUIszvKijbO2P7Ac988nmEzWI
 skMWqBlh/gA096s5IVoEOFyfebwYEHcusJ+9r7BuPbmdBWMG0C1/hh/DG w==;
X-CSE-ConnectionGUID: nemmIpjuTF+lcVO7FoXjmQ==
X-CSE-MsgGUID: lg7rp6F2SJSEXstCFqR6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="96168852"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="96168852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:04:48 -0800
X-CSE-ConnectionGUID: xflJemCLQYmkhlNf6JACwQ==
X-CSE-MsgGUID: 3fPOSPU9SJWPhe3J9q3vjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; d="scan'208";a="207740791"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2026 03:04:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:04:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 27 Jan 2026 03:04:46 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 27 Jan 2026 03:04:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6yYQ9/3WHlpAndVciAnfWq+1pXwblDQEjVs+vDP1ODTi8Qo1+0G6URfwSlkyogfK8afp84SAtCWWNEAe6owzmaQzyjIbsr6cu2+0LhSnJZjzCWTdaBi3wt9Yxe0BD5Qz2QUWn4qakRvHSGlEC1BGSdARXgDL/NA1qAT2peUPnIV95WBXXTTmarQ4dyVi8P1mcuK9HaNyNTu+T+M/rGvwLqYlm3yAdKUemHWNgPJjn7wCv+t8ygdJ8xM9jVquLxADQ9w0KGJ1wGD1R7dPjPMHgJ3Xl1S5gtI7mYDlCSY7a312g4wM19r8naCs+yS9aTdelYPLaJatE0gndx0RwLbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2B/cUkz8AuBD7VHZyWMSTKx4qdRXSAvCx6zv2IHDumU=;
 b=xEUSDmEtSjrDAVjJTuQVlelXeTMfPPN2PbwXFcePTi7ucC6LYPYV+59Or0Pb7VYz0Eo4e2wzIqFXHMVE6zgzhenaBEHmy4p/KnhzMiTxhpchudQXlsQO4Wqm0d+n6xa6yMkiPbH4DcQXVclaUqe2thXLBSrxCQYLFRVWTibiXlgrJeX0+Rmvhl/jAyTF8EYM32qgiAomiGjV0LZQgP0L7dtmjtd8t3BHesJL72z+mXNOsFTxqiIqOYgwrcW/PHxMlipJHMb/hzN6HgyZT72LuGXtTHyX5/jRZambqj0n3aLjvnlTwaC+xQ4ZiqXyLUvz225dQ0IXduwABOjeRJ+gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB6230.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Tue, 27 Jan
 2026 11:04:44 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9542.015; Tue, 27 Jan 2026
 11:04:44 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Thasleem, Mohammed"
 <mohammed.thasleem@intel.com>, "Nautiyal, Ankit K"
 <ankit.k.nautiyal@intel.com>, "Konieczny, Kamil" <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v9 10/11] tools/intel_hdcp: Add interactive control
 with playback
Thread-Topic: [PATCH i-g-t v9 10/11] tools/intel_hdcp: Add interactive control
 with playback
Thread-Index: AQHcj3Hl9qWoe6f5o0CZQfd1X1+PfrVl2ntA
Date: Tue, 27 Jan 2026 11:04:44 +0000
Message-ID: <DM3PPF208195D8DE975F0835F9D61974D43E390A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260127094257.572736-1-santhosh.reddy.guddati@intel.com>
 <20260127094257.572736-11-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20260127094257.572736-11-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB6230:EE_
x-ms-office365-filtering-correlation-id: ea560b08-a541-4750-bfda-08de5d93e0af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?RwWIJ9lQNl1mJ5+urF2H50I1y0CmQvqX7gqGNVHC/NOjS7eit1n0JwT3WwMB?=
 =?us-ascii?Q?c4FqQje/g/T3LNSwFpjW6zUhHsGNhbJmOULlx2MaExhPyRMeR04jq//JsbPn?=
 =?us-ascii?Q?vspp6GOeXSa0bzyGHX/GcbxN2FlWCBSP8ECK0njwb1LyCXu8oW4M6C7gI0jk?=
 =?us-ascii?Q?//5fKKRZTX/6GGAmxuI3qR8oG9CzfStsCzKOYqkFLYaQQo5+gmo3l7AhhpjU?=
 =?us-ascii?Q?IdQiSjCBYLISQ+2v/w6p0NKrz0U4dvn9To3HAcmTzvvmowtBcRnKlbC5Ipn8?=
 =?us-ascii?Q?7CoIKJhh04NBn/sSABNX7iWaL2UrNLmYgeizH4/rOOfDLbQrij0Xkol4yahJ?=
 =?us-ascii?Q?oYe2Y2FpD2/7YETBieQ1B2htZjsQiH02s4LprUXEJotjrwYP/yeAprHXARbz?=
 =?us-ascii?Q?827o0FBFmg03qhX1U/rHNfYdOaYwwCcUmsazoYdLOUtl8T5qwsKKq73x0IkH?=
 =?us-ascii?Q?B9Thq5v1CZGVmSBEr3leYTqFLd9H/jAOLFtgqZweb3W52YJi69qYQz6I59Yl?=
 =?us-ascii?Q?JMHPpWq+ImY87RVypgIxRi9TerpnxC86ygtISXsdR00299HIZ0J0hDImRG4d?=
 =?us-ascii?Q?d4wuUcIc3ObAtZDcoloof1T+WGLXmH7H1QP8uchyYyW2YOBWwITI70lggQ+V?=
 =?us-ascii?Q?QqNA3c8KTOS2TmtkMAftoxZKljOzdSmPbrrrMk41vT6DU/JmFTNT1AwL7Cif?=
 =?us-ascii?Q?X1KGxfGEPdeCpwcI9QGQ5kDUx7h0tjxZPSs6gNftquOuTfg07ERiUPSS1Taa?=
 =?us-ascii?Q?G+37NaeB20veJ59hP54/qg3fD1ErgksBYmsi00zvDTxUGZHByU2jZ21eiucI?=
 =?us-ascii?Q?3dhHv4H5IZBUUdtYlSDOFqlUubZScCz08N0YzRJ3BShtN5hJrSzTWdwC5s6F?=
 =?us-ascii?Q?RWqY473kTqPe+LtPbz8RPY/AY43SicQN+vzGQGtW1e0P8AMOMZAyzoOAAVjt?=
 =?us-ascii?Q?CoEswGc0k6EPA/cW9RBqkBstksisLpGyv6ihwYYfjSamKssBj6TaTvDB7CTZ?=
 =?us-ascii?Q?tJXco/rKmAN4J8t3KMGSRvin0Kxbq6NMFplSeJ5mZtusiszqKbFcDok+3mKI?=
 =?us-ascii?Q?TKYLquRnq9+dLNvETJ6F6oRtLIF+3vK5nE7eQXzj7pJgSDw+dMqBc19jUAif?=
 =?us-ascii?Q?4/0i4qIvF5NHH6s9I34B443RHbtJrHVnaCLpCYHAECvlkrL/GaQa4rdinXo1?=
 =?us-ascii?Q?b1LsaDm0NNlPEFxjvdVc5CVM31WgampeAgfEssVv8rx4fwXtFk+cxSqrvWAB?=
 =?us-ascii?Q?ySHDnpyV7YiItI16yje8Qhk2Ddi2KSLEBjKI2UeP3mwFIvliUTf+ZZVsSZru?=
 =?us-ascii?Q?9zd287PWIAiBb+NAZZ5eInjrc3a3Jza4gj4BQJZ4BciW4ibBABR2HUyTk5Cn?=
 =?us-ascii?Q?bs2LxjCcDdTvw7fFWQRERec3EGXRE8eT46q9GKmYvH7B/wFm0HSm5O8B1Jdi?=
 =?us-ascii?Q?NTKzGWLzTSkh8egYE6wFncfbhvxUVZBupgqWuNDnitXyn3FyCPm/NPSL1aWh?=
 =?us-ascii?Q?v5q+MTlmEQdEqCIZnW1z9Iyic/ObDC/aktJntWRJubgiW1v/s3+SzTgVO8Pd?=
 =?us-ascii?Q?vVhyBKgVjM3E6vFCnL5kA87NqnlseRpNY9HuRaQ+dhv5blmYSTcQbZitSvaw?=
 =?us-ascii?Q?+dqSPRQKOdpJaTXdQFoGExs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yX830mJELXKs0PJYvw7WZwnbfpcDlh9gWM3+YXweeofwrTxy8wOR9mucOU2F?=
 =?us-ascii?Q?JwyAL0EvjjOH9i3hqnrp7xQkIgvF/Pj5ViXzuNjRp5+oArGa75lPcUEj0QB4?=
 =?us-ascii?Q?ZYsEjozNuQQ7oWB47ONgWMnjn2ip7gqNsPObB+QvVc1mMSjmelBpoIbMkQhv?=
 =?us-ascii?Q?6asPOYl+MUGOeCitW24YopSb7ZYwPA1J0Z5zrKwUI9ddUhpAh26eXBosbyGx?=
 =?us-ascii?Q?8wUtrgflnq15przRF1G7AGIB/GmeLlxh391kwRUc9a2GRhwxgnxX5d0ClLYs?=
 =?us-ascii?Q?uMgHZOW0cLJg8DoUuOfbpZUE0PCfQASSAM/BnSs5D6r7c1ySHbRlIOsNZAQ0?=
 =?us-ascii?Q?pUUgogeBYplHMsear+CXfFtKsyca3UXvD3HIf99TJr/8hlVGJ0lwc68ZqoGT?=
 =?us-ascii?Q?ctKc5fmpGrk6gB2/LIdAdazXEVYVjHQFT/Tk5SEWXwK3I3Dq/5GDDjPm5XNC?=
 =?us-ascii?Q?1jHCRPfMa/eaNXnnlv9xnHUAQz3ZaQyUZfTu38ZdcZxjuIoWrH1lqcWBEMNr?=
 =?us-ascii?Q?CY9Dl2hGFC38j4JgrP3A8GHfF5kjyxMaeF4t9N7w3sjrDtlS0qaOs+EKyi7W?=
 =?us-ascii?Q?bhh0NL53A0QZpGX5oitqs9NKN8pGqdOnIOdLfNMrKdZfpf2zF/0R2ZS7+sz8?=
 =?us-ascii?Q?I0y4BVVFCPGSoa8CpQfXKxSPWCn1rdUH12Nv4x7w/4VxXYjt9329FFfpTHcg?=
 =?us-ascii?Q?XDSc3DBCYrLgfKnJwb8DDDZJ8igBeG669CNUcW/e+XZ782+jWzQMkaq6FDG2?=
 =?us-ascii?Q?mJSgj5648B282wWsdW4W4PMXbvYUhGHoATsP3rXoDj7AHnLGydaB+wwgcAue?=
 =?us-ascii?Q?V/jyhzWgejekqYY/BQbALWAejWgf6WKtixMYCjaXSlBzYjQN+fLh2eGSQBKI?=
 =?us-ascii?Q?ioe08vR8xn6hZsKOHA8XzQXLRic/Bq0WEBW47hsSOi8L/LI5/If/0PxTF582?=
 =?us-ascii?Q?YZrSX64NYw+45uB1Mb4rxyUMuQmpVREnvlvBc+W7FhRtyAIwB7BcGKbFq1MN?=
 =?us-ascii?Q?0NGmEhqTXgCKLDfH2NzQULZyDPpP28y/Q9v9taTf6bFpgvjL0mnh3mmA5e74?=
 =?us-ascii?Q?ngKMERP51O3nD54oZr1qhOTItewgi1hZUJGY0h41Mr0hS2rnvhfPGnHnBtkc?=
 =?us-ascii?Q?qWXVCLKxvIIWimTt8hmEYLMQ1woiSfjQ6jtWwyxiKfi6B9QuyEgZOhZRwfZi?=
 =?us-ascii?Q?mnbLAPKuxklh5ft3jxG+hw4okyh5ju3mM9Ty55WHTSKbaegr/TwAqdH2VX4U?=
 =?us-ascii?Q?K1WYj22xoalzJlubSFfwnN+WFp8w+XAIrAAJfsi77VDubeKcPR/72KsFdYny?=
 =?us-ascii?Q?wfEHdxnbOVZRVsajCW1zK08s5LPjrMh9P8+/ybpWZ/1ukrR7m1d+fOMXfR8s?=
 =?us-ascii?Q?JxKDZxu9I2bNYOOibHnjnk9f559Fhwv6MazEsZZqUtjuagjrMN8wXOrKbnEf?=
 =?us-ascii?Q?B1Nyb2+5Fd5c30i6gD4zZ6is7b0ExoCd8gJwOTciqXW48MzhAHYOoxShXcyE?=
 =?us-ascii?Q?LFBXHfEJcPCYhDnViRyrnV2HVzmearYxqOu34VkbdAndr76TYNoWnEUDBXiR?=
 =?us-ascii?Q?9knKUUPx7aLXRlky74saeaCrlKQGx3yUCfD2xA0qZOMB2AFvGsWUsJsHHcS/?=
 =?us-ascii?Q?nZUbM8qiWxdFyhF17CyYhvgefXgMQNwJUsVXB7zEcAXIe/T4u0X6pYIl5Rae?=
 =?us-ascii?Q?2hPb/eH/hvtbLPaF+HS2CAMRlscrpv0KgmVrOWGGRSrARe7B0sJclkfSuSQA?=
 =?us-ascii?Q?NL2jrh+okA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea560b08-a541-4750-bfda-08de5d93e0af
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 11:04:44.3760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sn0mT0mELHCIv2a9ri0dvCKUcyQXTyUmc4Ib6N4VxOvoVwuiM/I/pPOWwWNNNOa3M8GYS47dp2pz+1hjl3ITwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6230
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

> Subject: [PATCH i-g-t v9 10/11] tools/intel_hdcp: Add interactive control=
 with
> playback
>=20
> Replace static handling with an interactive loop for HDCP control.
> Add video playback thread, dynamic menu updates.
>=20
> v2: Remove comments where self explanatory(Suraj)
>=20

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 174 ++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 149 insertions(+), 25 deletions(-)
>=20
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c index 4bcee675c..bb4=
361d74
> 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -36,6 +36,7 @@ typedef struct data {
>  	pthread_t video_tid;
>  	int selected_connector;
>  	bool video_running;
> +	time_t video_start_time;
>  } data_t;
>=20
>  static igt_output_t *get_hdcp_output(data_t *data, uint32_t connector_id=
,
> bool *is_valid) @@ -74,6 +75,58 @@ static const char * const menu_lines[]=
 =3D {
>  	"q. Quit"
>  };
>=20
> +static void draw_menu_text(cairo_t *cr, data_t *data) {
> +	cairo_text_extents_t ext;
> +	double x_center, total_height, y_start, y;
> +	int num_lines =3D ARRAY_SIZE(menu_lines);
> +
> +	cairo_select_font_face(cr, "Helvetica", CAIRO_FONT_SLANT_NORMAL,
> CAIRO_FONT_WEIGHT_BOLD);
> +	cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +
> +	x_center =3D data->width / 2.0;
> +	total_height =3D 0;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		total_height +=3D ext.height;
> +	}
> +
> +	y_start =3D (data->height - total_height) / 2.0;
> +	y =3D y_start;
> +	for (int i =3D 0; i < num_lines; i++) {
> +		cairo_set_font_size(cr, 52);
> +		cairo_text_extents(cr, menu_lines[i], &ext);
> +		cairo_move_to(cr, x_center - ext.width / 2, y);
> +		cairo_show_text(cr, menu_lines[i]);
> +		y +=3D ext.height + 10;
> +	}
> +}
> +
> +static void draw_menu(data_t *data, const char *status) {
> +	cairo_t *cr =3D igt_get_cairo_ctx(data->fd, &data->fb);
> +
> +	/* Background color and text color based on HDCP status */
> +	if (strcmp(status, "INIT") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.051, 0.278, 0.631);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	} else if (strcmp(status, "Enabled") =3D=3D 0) {
> +		cairo_set_source_rgb(cr, 0.0, 1.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
> +	} else {
> +		cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);
> +		cairo_paint(cr);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> +	}
> +
> +	draw_menu_text(cr, data);
> +
> +	cairo_destroy(cr);
> +}
> +
>  static void set_hdcp_prop(data_t *data, int property, int type, int
> connector_id)  {
>  	igt_output_t *output;
> @@ -230,14 +283,6 @@ static void get_hdcp_info(data_t *data)
>  	drmModeFreeResources(res);
>  }
>=20
> -static void print_usage(void)
> -{
> -	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
> -	fprintf(stderr, "Options:\n");
> -	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> -	fprintf(stderr, "-h,	--help		Display this help message\n");
> -}
> -
>  static void print_menu(void)
>  {
>  	printf("\n");
> @@ -469,18 +514,32 @@ static void *video_player_thread(void *arg)
>  		cairo_set_source_rgb(cr, bg_r, bg_g, bg_b);
>  		cairo_paint(cr);
>=20
> +		draw_menu_text(cr, data);
> +
> +		current_time =3D time(NULL);
> +		elapsed =3D current_time - data->video_start_time;
> +		minutes =3D elapsed / 60;
> +		seconds =3D elapsed % 60;
> +		snprintf(timer_str, sizeof(timer_str), "%02d:%02d", minutes,
> +seconds);
> +
>  		cairo_select_font_face(cr, "Helvetica",
> CAIRO_FONT_SLANT_NORMAL,
>  				       CAIRO_FONT_WEIGHT_BOLD);
> +		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
>  		font_size =3D data->height / 12.0;
> -		cairo_set_font_size(cr, font_size);
> +		cairo_set_font_size(cr, font_size / 2.0);
> +		cairo_text_extents(cr, timer_str, &ext);
> +		cairo_move_to(cr, data->width - ext.width - 20, data->height -
> 20);
> +		cairo_show_text(cr, timer_str);
>=20
> +		/* Draw HDCP status above timer */
> +		cairo_set_font_size(cr, font_size);
>  		cairo_text_extents(cr, hdcp_str, &ext);
> -		x =3D (data->width - ext.width) / 2.0 - ext.x_bearing;
> -		y =3D (data->height - ext.height) / 2.0 - ext.y_bearing;
> +		x =3D data->width - ext.width - 20;
> +		y =3D data->height - ext.height - 60;
>=20
> -		cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
> -		cairo_move_to(cr, x, y + ext.height);
> +		cairo_move_to(cr, x, y);
>  		cairo_show_text(cr, hdcp_str);
> +
>  		cairo_destroy(cr);
>=20
>  		primary =3D igt_output_get_plane_type(data->output,
> DRM_PLANE_TYPE_PRIMARY); @@ -519,6 +578,16 @@ static void
> stop_video_player(data_t *data)
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
> +static void enable_hdcp_type(data_t *data, enum hdcp_type type) {
> +		set_hdcp_prop(data, CP_DESIRED, type, data-
> >selected_connector);
> +		pthread_mutex_lock(&data->lock);
> +		data->hdcp_type =3D type;
> +		data->video_start_time =3D time(NULL);
> +		pthread_mutex_unlock(&data->lock);
> +		start_video_player(data);
> +}
> +
>  static void test_init(data_t *data)
>  {
>  	drmModeModeInfo *mode;
> @@ -548,39 +617,94 @@ static void test_init(data_t *data)
>=20
>  		break;
>  	}
> +
> +	pthread_mutex_init(&data->lock, NULL);
> +	data->user_cmd =3D 0;
> +	data->hdcp_type =3D 0;
> +	data->running =3D true;
> +	data->video_running =3D false;
> +
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);  }
>=20
>  static void cleanup(data_t *data)
>  {
> +	stop_video_player(data);
>  	igt_remove_fb(data->fd, &data->fb);
>  	igt_display_fini(&data->display);
>  	close(data->fd);
> +	pthread_mutex_destroy(&data->lock);
>  }
>=20
>  int main(int argc, char **argv)
>  {
>  	data_t data;
> -	int option;
> -	static const char optstr[] =3D "hi";
> -	struct option long_opts[] =3D {
> -		{"help",	no_argument,	NULL, 'h'},
> -		{"info",	no_argument,	NULL, 'i'},
> -		{NULL,		0,		NULL,  0 }
> -	};
> +	pthread_t tid;
> +	const char *status =3D NULL;
> +	igt_plane_t *primary;
>=20
> +	data.selected_connector =3D -1;
>  	test_init(&data);
>=20
> -	while ((option =3D getopt_long(argc, argv, optstr, long_opts, NULL)) !=
=3D -1)
> {
> -		switch (option) {
> -		case 'i':
> +	draw_menu(&data, "INIT");
> +	primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, &data.fb);
> +	igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +	pthread_create(&tid, NULL, keypress_thread, &data);
> +
> +	while (data.running) {
> +		int cmd;
> +
> +		pthread_mutex_lock(&data.lock);
> +		cmd =3D data.user_cmd;
> +		data.user_cmd =3D 0;
> +		pthread_mutex_unlock(&data.lock);
> +
> +		if (cmd =3D=3D 0) {
> +			usleep(100 * 1000);
> +			continue;
> +		}
> +
> +		switch (cmd) {
> +		case 1:
>  			get_hdcp_info(&data);
>  			break;
> -		case 'h':
> +		case 2:
> +			enable_hdcp_type(&data, HDCP_TYPE_1_4);
> +			break;
> +		case 3:
> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_0);
> +			break;
> +		case 4:
> +			enable_hdcp_type(&data, HDCP_TYPE_2_2_TYPE_1);
> +			break;
> +		case 5:
> +			stop_video_player(&data);
> +			set_hdcp_prop(&data, CP_UNDESIRED,
> HDCP_TYPE_2_2_TYPE_1,
> +				      data.selected_connector);
> +			data.hdcp_type =3D HDCP_TYPE_NONE;
> +			break;
>  		default:
> -			print_usage();
>  			break;
>  		}
> +
> +		if (cmd =3D=3D 1) {
> +			draw_menu(&data, "INIT");
> +		} else {
> +			status =3D get_hdcp_status(&data,
> data.selected_connector);
> +			draw_menu(&data, status);
> +		}
> +
> +		primary =3D igt_output_get_plane_type(data.output,
> DRM_PLANE_TYPE_PRIMARY);
> +		igt_plane_set_fb(primary, &data.fb);
> +		igt_display_commit2(&data.display, COMMIT_ATOMIC);
> +
> +		usleep(200 * 1000);
>  	}
> +
> +	pthread_cancel(tid);
> +	pthread_join(tid, NULL);
>  	cleanup(&data);
> +	return 0;
>  }
> --
> 2.34.1

