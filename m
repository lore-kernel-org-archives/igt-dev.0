Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D90D31A0F
	for <igt-dev@archiver.kernel.org>; Wed, 14 Jan 2026 06:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB69310E31A;
	Wed, 14 Jan 2026 06:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EtlM99YE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12D210E1C0
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jan 2026 06:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768372439; x=1799908439;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k2v0C0NwMxwJTuO6bnEGzWBSsXxeO3xIXrOXKxLIQhk=;
 b=EtlM99YEfFXSYc56f81YV1UE9dxF7XHTruFA51YkoH95G4o1n2idSITp
 3CEU5Z7OarQUtC1Zrv1Op1KWINQz+buH1Z6+hFWIqVhgOXrjm3e8huABZ
 k3FyD1Oau3ZMMfLkamKyDJEo9Y7e1Z5bh5QTe9575evtvoXutlxtnCWf3
 ukMKkjGARYYkqZgesNjK9ppuAS09MblGUO1kAhIV4c2Z4uJpYpDL/Pn1N
 MCG6v3A6u9uQRAVVvXpXKnxuHl8ttQJn5/LhmOFKOfo9jA0kDEy3Zz+JU
 MSxqLiYuJk6gEQEofAQLb69y8XYjTef2/TJihXIe41HskXz/rpa59kcpZ g==;
X-CSE-ConnectionGUID: 8N1+MWU5SMu24TU2rlZkSw==
X-CSE-MsgGUID: GB/3I3NhT82FwkWVeOnXjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87079925"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="87079925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:33:59 -0800
X-CSE-ConnectionGUID: cNB+uK2RTuOL16ABuDfi7w==
X-CSE-MsgGUID: HNr0xxOvQXODGmFjaapa8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; d="scan'208";a="242130621"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 22:33:59 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:33:57 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 22:33:57 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.28)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 22:33:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AED9vsP1esjjRSmrJqg1Pjiu0VgpDzXOh/C9X5Dy/hv4JgsJ2f/xCFJ0xgVKlf8a3FUR217ykkES9DUd3k6E+cJpfVb/766qhrsAtZfGdSic8gxxHtBFwFL/JrIhKxpn4bD9yYlsC8aeGptVU6Sp6vqTBqp8bc3yBMQ9ph93KQTxUJ9//Aow9Aw5T1y/QmzLOnfitoH2mQmHiQhWlYBJyF6qjrBEbZFuUiIW8vogyf5azhuMg7QlnbAweuYPvtGuNGsAgWilXfN3cGeMRqSTW0HUzh+pg2HYr1U4vdv7QGfKOqBApWSz59LTspM1Izh8Ph/0VL9TWqEjoa7GHGpzQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jChpQgZIcgQ2/avvf2kz7QcGrTZ91zIoo1FBPAjDkaA=;
 b=BTo2w/p/414HfTkimiNeCz2xD6r3E0T1sYKz99mUO5q1YwQaV3OAKT1olmaB5U1pwVailoz+DmpjKFZcQghpc6jNhGdy1qZhh9ummmAn+X8VlONvcll0G1nNt4ezMHVZtg97YNVt3ieUnBZ70Yw3YDhAIMB9gL+HlPQwBVby+FQ39lG3A/t/6vc65qNCaUxUl9OIJaSmhSu89Ji0LaEMLOGVFu+KwazQGRL8ak4Bph4BtSPT5NaqXbq1LbvPQF0o7EBYizUNP4shZi5RfAdZP3JAUIGHH7GXc83r3aNS8kIb9IrW5C7P3IV26BfPxcmH3QzeUdCfY51CKtnI0aT6BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by IA1PR11MB7199.namprd11.prod.outlook.com (2603:10b6:208:418::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 06:33:56 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9520.003; Wed, 14 Jan 2026
 06:33:55 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Thread-Topic: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi queue
 basic test
Thread-Index: AQHccN93wqK3wdUZ606JRa53yLnLfrU8U4UAgAB2QgCAFJOVsA==
Date: Wed, 14 Jan 2026 06:33:55 +0000
Message-ID: <CH3PR11MB8434E5C3B42960B08AF9997D8D8FA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20251219120154.695287-1-priyanka.dandamudi@intel.com>
 <20251219120154.695287-7-priyanka.dandamudi@intel.com>
 <aVWShAsoxGrXXtom@nvishwa1-desk> <aVX1uHLfhZ7SQVb7@nvishwa1-desk>
In-Reply-To: <aVX1uHLfhZ7SQVb7@nvishwa1-desk>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|IA1PR11MB7199:EE_
x-ms-office365-filtering-correlation-id: 94dd1f8e-a2a9-4026-fbad-08de5336e477
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?7WnFP6UAeK7I+SIGHS7C9lxRBwJ4UPR/AdWex95tB9V0/l7Q8QuCGkhtGR67?=
 =?us-ascii?Q?1irlP14pL9vN/9fPLdzYtTN+u8C/Zi2OmCgkILmm4uZWcPZp0XzZmHDsD5ue?=
 =?us-ascii?Q?r7uWn9vg8Olvqbo9LFB0Ll4RvNTBfp2j9esGeJuwFcqEIPtnZH0B6oGpWgxN?=
 =?us-ascii?Q?GXq7OVpYEfqqu+t2Gr8oseIT3MEItQQbdpkWGju3z+djRvV5bpYviM6Q16Ye?=
 =?us-ascii?Q?AiQREaRRqKfpnfxWQYUCM0FYJ/spi1DBq2B+AFR32W+LHx8rD8Rc6f7MGFL+?=
 =?us-ascii?Q?JSi2ISAyfBUfqb+Q31xBaKOPV2mL1jOLAUiFK9kAg4XrcKorbslWDo4oGkwA?=
 =?us-ascii?Q?/ZbwhQodj4J4WQ+QR56LZgwsV+pJV7o1W5LZNoBjIolirfSxbToAZpwURKtP?=
 =?us-ascii?Q?TuqAZi2HFD99PVYf+KW/ODgbrK6zQDLoUFXgLxNmGE+1lZdAyxicnicC6q83?=
 =?us-ascii?Q?YV2jC90Cfy/uzZnAaLRQymirUob3b+TeA7Pj4JCAtN4Urm5JGhrEcMjWlSpJ?=
 =?us-ascii?Q?bEauzBZXnjr3c+bBGHkHKRG8vDn7rteO9XRvmn/X3mnzECFIA/aWkKZ/1gFm?=
 =?us-ascii?Q?wrNZkFENsOPPSXWhFdLeUBrp/eeC0YXlNdhynb8ne/9qROGanjtUy93hY83W?=
 =?us-ascii?Q?paERRan3CX+ZtYlqWlsDDE/rGJioOSn1x+A+mMmbNz2kheGSTFDGPxjs72V1?=
 =?us-ascii?Q?q2lzTECMe3KUccXnJidQNa0JPnijetNLttKEKHgyk5ZNOT7CdKWJA+LD/pEo?=
 =?us-ascii?Q?rYbS+C6YeyUk5R4BUKxuOkEOpmE4coFZOjoaqSuAsz0gB/s+yerTbATKIK5q?=
 =?us-ascii?Q?2fk5QqgeiGf1wSWJNzRJHI8CTSVXTp8RGDJx3qWMkHjc2YSsJE5/prgkJAc/?=
 =?us-ascii?Q?DUL7aQ84INUx21GJGYZe8GUFU5qq1KMqeHLf4FXybHVQ3ywDuSkYmwL5Cpun?=
 =?us-ascii?Q?477bB9x2fWhUvViV7cMH7z/DWDHuIwxH0rbRCBiuXsWX6Mltt+K5dpIx5xJT?=
 =?us-ascii?Q?n+zkM5x9X2PvlGNmDpxUiIq7Rxy0UhgoZM4oDZtotrlGZOweJCTletFkl2ZE?=
 =?us-ascii?Q?H0cJgeTo9LS9NUFzDPUEC8X3fhg1ukJhuPM2Ga71rIrnifyUXvyp+wiCT6B/?=
 =?us-ascii?Q?f4/uZKnQfQOwEHtzme1Ee+Vs5x+yUmOHy06l4V++U895h+9TQQ/5oO62Rf0y?=
 =?us-ascii?Q?oIJO+6d0NrDt/RUOuiWoaPTyZKu/T0NFUgicc5FgXyq298oeCRb6QJvYTZoG?=
 =?us-ascii?Q?xFuFDw1R4O8YnLLrDeRcaeNrCyHoVDfOBnLOZyIHaWq0LcLylonO1mD54Y7K?=
 =?us-ascii?Q?kIJifoR1dag/rYsOh70gDMMvQ38qVwx2MtUn/M263MVCohAcoEb2RUVpsqvu?=
 =?us-ascii?Q?6TzC7m2LK80e9SBKy9fg1OYrlxW5HamIpbEK8EOIqyj8KtSc/J14E5zq9Vd/?=
 =?us-ascii?Q?/T/Se993FXVyyZPwVT5b3G0aHOADI++vzGHA7Bsitj0hiGFu+HRHEUaL5N2W?=
 =?us-ascii?Q?8Ec6V5uV5orSSJkoK/LCHRIGWWEAPFyKbuiA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?A/HVSJSWXrFseuKZDKGoUSlNvrs3qmycL4655y8Oa+0TNmLDh58AA/Rgdtof?=
 =?us-ascii?Q?zfWI/+3sbcLCx09QMkTey7EFIwgTTni104RjoTCHAIwkFkDFiakWc3uHDVK2?=
 =?us-ascii?Q?V1TGw7Pj3FcC2PjigvPylEftFiaB/zszpkhcidH/eFNQRGy3SmBK5lByLMUg?=
 =?us-ascii?Q?6oIrpbNARka/qh8sXbgFDS2ABBTr0I3RnpwDtd1UiMWThP1cix7U/eKXkHGm?=
 =?us-ascii?Q?QtJZIed9ub15i02ZI9eqzFWwwk7Ne/w1sZZcuosi5zHUhhDRS8I8u3QIwRQ1?=
 =?us-ascii?Q?PdhhHeqHvUy/A00/vdmh8TsKBzkx8rKcgsQxPDlQ33xNk9GWm1umoGgrOT5t?=
 =?us-ascii?Q?y/l/YjjEsZgvb9XMC2cmK0lgj8sM/liP2ieqGIt6hMwk2zvF+09uNkHu2Hxj?=
 =?us-ascii?Q?iXIIdtWws3fovsDfWSybnIG64nk2x4Jg3n6bl2gHDrDdFKAtJv5csHZaa/+/?=
 =?us-ascii?Q?XxZYnJ4HDQp79DDScu6lFFX/nEtGwb2GY6WPpnvTHjEC0n33QV19byCRXWhC?=
 =?us-ascii?Q?n3B6k8YOT1qn5pshq87K3UZgVgFc6QRxm3BhZs1mbgM/ieTPX8j/G1tDcxNU?=
 =?us-ascii?Q?u/88z5pPemc7pvkT6BKfdrrZKR4fTju1jwC1HzL4aUIW66DQrJiKOhZLX48/?=
 =?us-ascii?Q?/qtsvR6/d48MMonKmMQ/lJQtmB/PbQH6rtD/shK034C3GcEAsgFSduZ26RzO?=
 =?us-ascii?Q?ljqgk3r4RP0KfTOA7ZRYcr7Wg3Pjs8V3AfCUC3qAYVsGMGJuJZaUAiK8LOH6?=
 =?us-ascii?Q?jD+1GnKs1N+u01F+PaFbekfTD6GzbMIEtEY2Ob3YeXr/IF7mZRF6C+5AvqkJ?=
 =?us-ascii?Q?8Dvz59z3B89K9r9QzdfgcJFPserjT8XzHuteFXzdHXGo9CCMnnHQoVpWyspg?=
 =?us-ascii?Q?Fc+NYk9MftcpGdPOZTi6czy5rhFepV4FmQhSBIwVnsTikINU0MP6C4ng9cSj?=
 =?us-ascii?Q?RCv3yy8VvyNLm8A5b+YWgPjRQjE2rcL/wgl52HoA13xj6SQNqkHmjLQeX7WP?=
 =?us-ascii?Q?sLXOSnj/EtenyqctPUFrgjuecXrcmq26Vn/78Wz8MjnCevX3FoG1gVmhLh5y?=
 =?us-ascii?Q?j9PQ70wyhKFdSrLj0r8vJKcvsw9IN/ZHn1dtVyY+Lz+KKs6yPUwIFHLyUwmY?=
 =?us-ascii?Q?YjUyJF1e0ME6jArwlL8wK0gtYDcWsUTJMseVWFtxyhuyg+gsNNGUBDtEkYpN?=
 =?us-ascii?Q?CjEQmNrRIn22bC9TKopJcwK2VGI2fnRQ21RIVkIPwcLR3eXOlncc98lvyOrF?=
 =?us-ascii?Q?E8qcfnp4c9lE40wqp0yQTmg8Y06wmXQ4VahPAgRLb5f8WvPktJCn78L4l35m?=
 =?us-ascii?Q?OpDmTACvM/byBJ8YyleBoj0oLSsYdQAJzEJS5GLWW1q34xVnczjt0J4uLD9S?=
 =?us-ascii?Q?+DT/dJkfYT5QT3HstV3wSD7RveLGnsrCkEK0XJAFlXKv1UmhEMC01PJaCRAx?=
 =?us-ascii?Q?JpyN2TyeJVNoOK8b/LBIYRgXoqRGhJq9UQt+3XexxqaZ8p8rXN+Gm8GIZYpj?=
 =?us-ascii?Q?HLbTOi8VyBv/Nk/IMDRn/sc+UJ4asV3VqppOcyVnd1ULXRlemcBMCLvKhW7B?=
 =?us-ascii?Q?4iDpre64+9gIwR7NFYfwUFR7EsPlYsKKoPuKuOsmz8aut4UrvwqE/ltormyX?=
 =?us-ascii?Q?nau68qaGeGbZIDNFpZa2mIQkdOxj5olMb3mvT0WIl+VKYHuba8d+qo9rN5mb?=
 =?us-ascii?Q?6uZqcKk5J9zFIh5UBsVKuR1DfE0+laEfavh5FO6rzEQsyJzgBUUrnYF9a+y0?=
 =?us-ascii?Q?mNuwsni8LzLzmQghOKfhAVy3jLDiL9w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dd1f8e-a2a9-4026-fbad-08de5336e477
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 06:33:55.9267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ciL3kIqH9EeuM05AcfmGOSzzUvy9lf1FuVWtwKAQoCUMEm4TQFautYvMoAaqd8RDF9xeyE6iXdlhRj53TES88hfnlTJQ2nhZE5OXnjAP0Io=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7199
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: 01 January 2026 09:49 AM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 6/7] tests/intel/xe_exec_threads: Add multi que=
ue
> basic test
>=20
> On Wed, Dec 31, 2025 at 01:15:48PM -0800, Niranjana Vishwanathapura
> wrote:
> >On Fri, Dec 19, 2025 at 05:31:53PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >>From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >>
> >>Check multi queue functionality in parallel execution scenario.
> >>Changed naming for multi queue and assign exec_queue create
> >>
> >>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> >Same here, remove email ids that are no longer valid.
Will remove emailids.
> >
> >>---
> >>tests/intel/xe_exec_threads.c | 39 +++++++++++++++++++++++++++++++---
> -
> >>1 file changed, 35 insertions(+), 4 deletions(-)
> >>
> >>diff --git a/tests/intel/xe_exec_threads.c
> >>b/tests/intel/xe_exec_threads.c index e8d56a3ef..4bf1cd1b1 100644
> >>--- a/tests/intel/xe_exec_threads.c
> >>+++ b/tests/intel/xe_exec_threads.c
> >>@@ -41,6 +41,7 @@
> >>#define REBIND_ERROR	(0x1 << 12)
> >>#define BIND_EXEC_QUEUE	(0x1 << 13)
> >>#define MANY_QUEUES	(0x1 << 14)
> >>+#define MULTI_QUEUE		(0x1 << 15)
> >>
> >>pthread_barrier_t barrier;
> >>
> >>@@ -540,8 +541,22 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t
> >>addr, uint64_t userptr,
> >>
> >>	memset(sync_all, 0, sizeof(sync_all));
> >>	for (i =3D 0; i < n_exec_queues; i++) {
> >>-		if (!(flags & MANY_QUEUES))
> >>-			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> 0);
> >>+		if (flags & MULTI_QUEUE) {
> >>+			struct drm_xe_ext_set_property multi_queue =3D {
> >>+				.base.next_extension =3D 0,
> >>+				.base.name =3D
> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> >>+				.property =3D
> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
> >>+			};
> >>+
> >>+			uint64_t ext =3D to_user_pointer(&multi_queue);
> >>+
> >>+			multi_queue.value =3D i ? exec_queues[0] :
> DRM_XE_MULTI_GROUP_CREATE;
> >>+			exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci,
> ext);
> >>+		} else {
> >>+			if (!(flags & MANY_QUEUES))
> >>+				exec_queues[i] =3D xe_exec_queue_create(fd,
> vm, eci, 0);
> >>+		}
> >>+
> >>		if (flags & BIND_EXEC_QUEUE)
> >>			bind_exec_queues[i] =3D
> xe_bind_exec_queue_create(fd, vm,
> >>									0);
> >>@@ -979,6 +994,8 @@ static void *thread(void *data)
> >> *	balancer mixed fd userptr invalidate
> >> * @bal-mixed-fd-userptr-invalidate-race:
> >> *	balancer mixed fd userptr invalidate race
> >>+ * @multi-queue-shared-vm-basic:
> >>+ *	multi-queue shared vm basic test
> >
> >I don't see MultiQ mega feature being added here as done in patch #1.
> >Looks like it is not consistently added. It probably makes sense to
> >remove it from individual patches and add a separate patch for all the
> >multi-queue tests.
> >
>=20
> Or update is consistently for all the new tests added in this series (in =
their
> respective patches) and add another patch to update it for multi-queue te=
sts
> already upstreamed.
>=20
> Niranjana
>=20
> >Niranjana
> >
> >> */
> >>
> >>static void threads(int fd, int flags) @@ -996,8 +1013,11 @@ static
> >>void threads(int fd, int flags)
> >>	int n_threads =3D 0;
> >>	int gt;
> >>
> >>-	xe_for_each_engine(fd, hwe)
> >>+	xe_for_each_engine(fd, hwe) {
> >>+		if ((flags & MULTI_QUEUE) &&
> !xe_engine_class_supports_multi_queue(hwe->engine_class))
> >>+			continue;
> >>		++n_engines;
> >>+	}
> >>
> >>	if (flags & BALANCER) {
> >>		xe_for_each_gt(fd, gt)
> >>@@ -1023,6 +1043,8 @@ static void threads(int fd, int flags)
> >>	}
> >>
> >>	xe_for_each_engine(fd, hwe) {
> >>+		if ((flags & MULTI_QUEUE) &&
> !xe_engine_class_supports_multi_queue(hwe->engine_class))
> >>+			continue;
> >>		threads_data[i].mutex =3D &mutex;
> >>		threads_data[i].cond =3D &cond;
> >>#define ADDRESS_SHIFT	39
> >>@@ -1277,6 +1299,7 @@ int igt_main()
> >>			FD | USERPTR | INVALIDATE },
> >>		{ "bal-mixed-fd-userptr-invalidate-race", BALANCER |
> >>			MIXED_MODE | FD | USERPTR | INVALIDATE | RACE
> },
> >>+		{ "multi-queue-shared-vm-basic", MULTI_QUEUE |
> SHARED_VM },
> >
> >What about other tests? Why not add multi-queue variants of those?
> >
> >Niranjana
> >
> >>		{ NULL },
> >>	};
> >>	int fd;
> >>@@ -1285,8 +1308,16 @@ int igt_main()
> >>		fd =3D drm_open_driver(DRIVER_XE);
> >>
> >>	for (const struct section *s =3D sections; s->name; s++) {
> >>-		igt_subtest_f("threads-%s", s->name)
> >>+		igt_subtest_f("threads-%s", s->name) {
> >>+			if (s->flags & MULTI_QUEUE) {
> >>+
> 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> IP_VER(35, 0)),
> >>+						"multi_queue is supported on
> graphics version 35 and above");
> >>+				/* Balancer can't be set with multi-queue at
> the same time */
> >>+				igt_assert(!(s->flags & BALANCER));
> >>+			}
> >>+
> >>			threads(fd, s->flags);
> >>+		}
> >>	}
> >>
> >>	igt_fixture()
> >>--
> >>2.43.0
> >>
