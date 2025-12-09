Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB0C4D3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 15:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 767F610E1DC;
	Tue,  9 Dec 2025 15:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BJLzPNGy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 730E010E1DC
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 15:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765292887; x=1796828887;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OkJQM81/lW/jC++ueI3lLAoHXcSKw33C51a/k9onUUA=;
 b=BJLzPNGyIIB3dwIHfkxbSx39SC9U2nUEdB4/mwLLe7qOcHHkDP9I8p5f
 dVwQ8tSwwlqZKVcuMorzkCxzi+N/9fIzGc+bMP/pPVlG0bkhJxgv3gZnA
 Y6O9qgsWRuUtrH9gGy78PNI20BK66HeJQCemQ6vPRZOVJEWl54zyOY0ce
 ahpEodVnWcU7Y7omB6QFYjTrA0hG5DsmtSbdHOy+q3NAVr6O2vaF1joWz
 VlDSPMXICX0vaVxdAGuxR3nwdC2Hac8jc//CSxQGOlOjdyBHLk8xDXWqc
 zGM4GacX7iBB7sdJRtbXzJVFocsGFJdEcfg0bwvYA3pISvvwVmiOrVzhb g==;
X-CSE-ConnectionGUID: O4Krvq6/TCWNSqeC59qOSg==
X-CSE-MsgGUID: 5j589OEaROaACMiYe5Og5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="77865722"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="77865722"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:08:07 -0800
X-CSE-ConnectionGUID: ukBxL8RAT92LDrxzjCQlAA==
X-CSE-MsgGUID: sbsapn0HQH2yyXVmsUNFLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; d="scan'208";a="196538570"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 07:08:07 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:08:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 07:08:06 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 07:08:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WTxGgQpa2IrYtVKarTHy9bN6Xk6wngT3U46xHXgMCycqpzBNwuxSwKK1Z62oFbIsU2K2sRKpn26BS7mqI9XXB4w4aXFOCADLpY/aYvZE+vqGPyiufDpt+jB+GplI75TaxRhwPBvpMp7LDFUR02DfcxvIqfiTJdnT1sKJubAIZX0S/4dbx8dlH/tm0YssfGSgAfHkntexErPoUPI63J/fOLj+TDd06Y/ia0wONnRJI2+tqpV7zv+SeS4sk2Y4bc5kn97gfxgcFfTDYgmvoYtVeGM7Q+ROL8Cp97u9IfiFPVdvN2yaY4F+CwtrgyQQsOo8W9SlKAbF1XVwrPg9tHa8sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujqe365Gvl3aXR/q3eWK7HSPRJexIhx+APMVtZ3jHnQ=;
 b=J+BpmLRY6edhDu6D4Psv68o17MTcP76IY+Oazr+6MrJbMGFT+Uu1jDf5/o4UFsJmL74xSO2Go3QuzlyQI3TnP/WQJ9mdw5z2tszi7D9b1gNdmtZVOLKnxxxELhHJUntzbJmcgvpant3ffp+7TMJQLFQVoc29N8aFV7ggs8SJTnKrcrEnM3NjBLKohvFtFsr4pYw/uGZgg1ImaVqeIJUPtR99A5dRjvi7x2NUPq3Gn9AL79jV7dHfgMQeETVe8yVg69J7egJjE03JyznpmdaAdXf9lw8yEr1Gvd6NZQI9GGFo8v9wXaEkwIXmg3jSuw0rDw3XPdInBShJB3tG3Eqdiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by IA1PR11MB7342.namprd11.prod.outlook.com (2603:10b6:208:425::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:07:55 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%5]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 15:07:55 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH v3 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Topic: [PATCH v3 17/18] tests/intel/xe_exec_multi_queue: Sanity test
 KEEP_ACTIVE flag
Thread-Index: AQHcaLsRVqUxGPzgsUuHfnn7IGg2T7UZaWKA
Date: Tue, 9 Dec 2025 15:07:55 +0000
Message-ID: <BL3PR11MB574785E94F9124D35589A542D0A3A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-37-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-37-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|IA1PR11MB7342:EE_
x-ms-office365-filtering-correlation-id: bb83f4d2-c33b-44e8-a5bb-08de3734bb3f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?MSxe8vff0qaYohVnMtBs7AHbJDLOc9LTtznQhQY4m7xEOPb/gPUT23F+s0Ys?=
 =?us-ascii?Q?+loX0C6n1j3Z0bwcW7lFuYjyTqXRoCNdjSPlaxtcXNmt6nPvUsJxFKE5W/w1?=
 =?us-ascii?Q?oieWCLz3Ni8We/5i311ANkFGVKaK/buD8ozpn97trW0b6InJX7i8RyQjsDMD?=
 =?us-ascii?Q?lZ1WI5yp9F8ezoYfUjXHR8oG4QwqEuNqf1MaPtOcZei02odeFiUnRWIGbxpC?=
 =?us-ascii?Q?ASx6g4ecFRSnKXQkzt5qsM/oX6SHp525xNXQT4lhpKR78avvE8WNvTEKKEXA?=
 =?us-ascii?Q?fQfrjGmMkh+JSHRJihZenH4NFVtcmRi4h0R4ulLU1XPr2HLC2szSNLWWxr0d?=
 =?us-ascii?Q?b70j4HeZEM/VXRbGZDCzgHIp3rnULckVwk4KWo6nu5Z3jKUbWwQ6Gt+/cV5L?=
 =?us-ascii?Q?J+GTnwI6GzHUc4xzEWvcm4xtLQT9gzpgWKr0yllYomeWJ+XaksBGR2WCYNei?=
 =?us-ascii?Q?maulpg145isUYZCZksybwxwJQGvV0Nkr7ZNYvE87YaUAMsEQnoKs8HKabQy8?=
 =?us-ascii?Q?Nraqg/5SjtjQ8hYfV+epV6lhxFgaZhQPGeyVs43YaWGLSLPCJv12RInsvFLw?=
 =?us-ascii?Q?vOrCv7rBdNiJZlgK7XA5aCQlDT16kU21Nj9nxaLLmyUV/dZcyGHIM7WfeFKy?=
 =?us-ascii?Q?zX+LudeDiEI53DlHIRdW5MIBb5zoFQ91f5fYBrD0jNMhUBLQEhVPf7ZfGj9q?=
 =?us-ascii?Q?MyeVSoapsSevb8tCZ6CVrcawE3W5HmrWckBxGQ3Odq4jzPK+D5KWCmnenl8d?=
 =?us-ascii?Q?niu//ZpzcCjBEwxGLfWZErt1fN1NLIuLIOqtX/UzqzkEMspb/Lyd5Nsxw49i?=
 =?us-ascii?Q?plFS72+MmRVhwWLIPUkLoNl0idv0hRdZDBYFCZ5iaLLf9qTrdngznzku7g7a?=
 =?us-ascii?Q?yUOXvbafmmkL8RYfn4jSMvwzFw53QEIayJlRf9EdUaDhvHgKmKRGFPXF0z9m?=
 =?us-ascii?Q?jrwqCIs4yKC8lFHki2oLWUpKEZQF9id/wf8Z7Xacjm/GHaO4OCV0DJNr2kz3?=
 =?us-ascii?Q?l9ITaXrtapWbYHLnjCG3i3zfHxwfL1pLtwpwQwHVoC881nWiTkRnHuLksskO?=
 =?us-ascii?Q?6AXGNwB9W/ZZ+PGdqwoGDRzeeVtpCe6eF/+dJjWcFtMe4X8BCoZEa/Hg9g1G?=
 =?us-ascii?Q?Thwca0f+Za2LAOqmK61NKeDZ5jSbPZ85oR+QhOv4lQ+zE7ThfsxbTnr5qw+p?=
 =?us-ascii?Q?kAXTawQ0IMEh1TpPqgjI1qti2LzrfAEPKxAgrC+zGcICm7/AQZ3USR8RtEzn?=
 =?us-ascii?Q?mVx5BESp8Ra1iEzd4XjtMdkXv/XrFlqTnfFT3bha9ERuJ3eDLzi8K1oQrVQJ?=
 =?us-ascii?Q?mK7q/sn8L8cnrUDw/3NJyq2hNP5Ml8zBMfoXzy0GVW1ehyXLE3ORdSl0Rzgb?=
 =?us-ascii?Q?LIyodtImFMXLS9EPsCjNI3yvdmzH1xUyTbxk03D+J5YsiFNWAEAqDxDRLFxn?=
 =?us-ascii?Q?iJXGGzkKK4wrOVqbo7KK2efpmf1M4DXczh+AJawxPsLB1JmRr4OpebHkhINE?=
 =?us-ascii?Q?MgeCj7xcwZorQPJoLudvUVICuHj+kxSuCiWK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6JEOwPQrRfSXKZjY5OuHGYoM9/zVPas9EOUCSM+nEZWoh8QYPEBTOsr1zYe8?=
 =?us-ascii?Q?jYAp3ig6+g2szFaFVmomvfZSSgzXme93z0C5qbCasKpj8sK1m1CROKI7NQJv?=
 =?us-ascii?Q?UjO0Y0nJAM37Zwt/gx2dzV2VAuPGqRGsfWgRexKU9XeJNnXanuJ2OnEfb1II?=
 =?us-ascii?Q?71HNOn+G0Tzlr1JSZiRLWtudA68w1uZ836ZzY3AsnRAjxu5De0xTFktymDQb?=
 =?us-ascii?Q?TZaI81wsxheMfcqxtnKRSOrZadbpgTaTh0gADxtApaRnKZCcW6SEvA4Lu4gA?=
 =?us-ascii?Q?jFe4ijZMe23TwT5dk4miHjLdmD+n6hOiML4/MPtMwZbVexVcI3HZm5PZpiMG?=
 =?us-ascii?Q?fnd/SzoVtOhbQ6V7Lp2BhgTa3rJmDe9C0XgzVM2wDoobxAN1N6UkRJQVriOO?=
 =?us-ascii?Q?Kp41oANPSdmhnJ+wXY4M8zWdqqnSqm0bDTxhiM4AK30dwIL3lwTZlfn33aFB?=
 =?us-ascii?Q?GLtq4+IbMIgqnKu+iw7Ssk2fpnCefC6r/3TP+tKhlgvaYTmBsUYrsW3aYvmT?=
 =?us-ascii?Q?Ugr+L8z8S288+xnPenJ2SJnRWIkHhTPAtvRhU9eTq0U8Fa52n0SSR8Gtu4yY?=
 =?us-ascii?Q?kxN1HYo1weqsw7470/UHbMdd4oaGGf2WU92uW4E1g2DB8G+roOW0eNPDetrq?=
 =?us-ascii?Q?4AGUFnXZwhAnxHHCKTsXXucXU4eO1NBwVP9k0kqCjlc34SwsCALwwPnxBrfN?=
 =?us-ascii?Q?sP78LG6msLI5B0TTDEDS0snS9COzuj5twJqykrZS4PmdWxm/OkftYsVKMKMK?=
 =?us-ascii?Q?eE6LfS6VeKGN54mxx41KQUPLb1YRBiWNzWo1tiiS1dtfi+iiLiuNt8M/VAhx?=
 =?us-ascii?Q?Bbz8IuUvdEKjWXYc9uFJ1RSY/ekNgWQ1BCHwuNrHjhKnnOJEqwaft7uyFg6/?=
 =?us-ascii?Q?QeCW7icZjqsMXvd7oWHqvCp7iYNPpqlSEUBaTO/PQOVWpE1h9YCRMzraPAgY?=
 =?us-ascii?Q?1OpF0iAa8phr+j4YrlaJKKuLDdw/mMPIv8bghM39IGQfrcTt2BmkRmXu61pw?=
 =?us-ascii?Q?F5kbbR1d44iMw2ITkdj4xZsbg/r/DddOXRqnu/WETwDmUSzMux5psgEdM8Hw?=
 =?us-ascii?Q?eYGxJMVk6JUsPtS7OCTzUVOWSqMcr8jIBw5/29kSybiWF7jDoCaviOBucZAW?=
 =?us-ascii?Q?ZkCIRdPyDW+RtD8GjaicSDju5dpGlRurPl202EUD7STx+p28t06xV0tWaZFA?=
 =?us-ascii?Q?PF9mdkIzcGutitbQHcudwm6i3tyWi1Zn89k9VEeA8dZIatvIBZt6IslO/+hy?=
 =?us-ascii?Q?h2slrcvKJqREvqC6rO3ZY2+8iqbEiiznLaMn14StP5e6rCj296BibJec20lZ?=
 =?us-ascii?Q?jP72z/oIdie7i6htBvb8NFH85PX8o9gDpxMXwj95fFsafy8WVS16EnBX0vU6?=
 =?us-ascii?Q?zYT2FKbhWThsokgcUpwmBKr4xp99+u6YAg0Rv7lqEYhBI/shYvhxSae8aGD5?=
 =?us-ascii?Q?g9gKLYETUSXoetGk66fxbB9xQTSKN9LZzcOyrpIJmS6mQ400ANF5ChMDYB1F?=
 =?us-ascii?Q?zaEcDHv7AZj5kXFLpoMpuEUhhPYgaSK9PTC+FLtcHbodcf19bFhtlNId1eon?=
 =?us-ascii?Q?6MDlwsgYuS7LTlV+4EktFpb4MCHFd4Sk7HufsyUI?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb83f4d2-c33b-44e8-a5bb-08de3734bb3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 15:07:55.2265 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LfdSz28iuit8BnMWANzXt1gvTt6sCtQBrcblS7jZCekuDXfKh4novc3nc+INMjEQsj5ME5rUAGnVwbzDljgewayekdWDT5rBMAc0tLSunhA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7342
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



>-----Original Message-----
>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>Sent: Tuesday, December 9, 2025 8:52 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
><priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com;
>Summers, Stuart <stuart.summers@intel.com>
>Subject: [PATCH v3 17/18] tests/intel/xe_exec_multi_queue: Sanity test
>KEEP_ACTIVE flag
>
>Add DRM_XE_MULTI_GROUP_KEEP_ACTIVE to valid flags list.
>Validate that KEEP_ACTIVE is not supported in preempt mode unless fault
>mode is set.
>
>v3: Remove redundant preempt_mode check (Stuart)
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 31
>+++++++++++++++++++++++++++++--
> 1 file changed, 29 insertions(+), 2 deletions(-)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index cede3abe9..83f784021 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -37,10 +37,12 @@
> #define FAULT_MODE		(0x1 << 6)
> #define SMEM			(0x1 << 7)
> #define WAIT_MODE		(0x1 << 8)
>+#define KEEP_ACTIVE		(0x1 << 9)
>
> #define MAX_INSTANCE 9
>
>-#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE)
>+#define XE_MULTI_GROUP_VALID_FLAGS   (DRM_XE_MULTI_GROUP_CREATE
>|        \
>+				      DRM_XE_MULTI_GROUP_KEEP_ACTIVE)
>
> #define BASE_ADDRESS	0x1a0000
>
>@@ -84,7 +86,8 @@ __test_sanity(int fd, int gt, int class, bool preempt_mo=
de)
> 	if (!n)
> 		return;
>
>-	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>+	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE |
>+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
>
> 	/* Invalid flags */
> 	while (!invalid_flag)
>@@ -119,6 +122,15 @@ __test_sanity(int fd, int gt, int class, bool
>preempt_mode)
> 	multi_queue.base.next_extension =3D to_user_pointer(&multi_queue);
> 	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, eci, ext, &val), -
>EINVAL);
>
>+	/* KEEP_ACTIVE not supported in preempt mode without fault_mode
>*/
>+	if (preempt_mode) {
>+		vm2 =3D xe_vm_create(fd,
>DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>+		multi_queue.value |=3D DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>+		igt_assert_eq(__xe_exec_queue_create(fd, vm2, 1, 1, eci, ext,
>&val), -EINVAL);
>+		multi_queue.value &=3D
>~DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>+		xe_vm_destroy(fd, vm2);
>+	}
>+
> 	/* Setting other queue properties are valid for Q0 */
> 	multi_queue.base.next_extension =3D to_user_pointer(&priority);
> 	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext); @@ -219,6
>+231,21 @@ __test_sanity(int fd, int gt, int class, bool preempt_mode)
> 	igt_waitchildren();
>
> 	xe_vm_destroy(fd, vm);
>+
>+	/* Validate closing FD while keeping group active */
>+	fd =3D drm_open_driver(DRIVER_XE);
>+	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE |
>+			  DRM_XE_VM_CREATE_FLAG_FAULT_MODE : 0, 0);
>+
>+	multi_queue.value =3D DRM_XE_MULTI_GROUP_CREATE |
>DRM_XE_MULTI_GROUP_KEEP_ACTIVE;
>+	multi_queue.base.next_extension =3D 0;
>+	exec_queues[0] =3D xe_exec_queue_create(fd, vm, eci, ext);
>+
>+	multi_queue.value =3D exec_queues[0];
>+	for (i =3D 1; i < MAX_N_EXEC_QUEUES; i++)
>+		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, ext);
>+
>+	drm_close_driver(fd);
Looks good to me.
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> }
>
> /**
>--
>2.43.0

