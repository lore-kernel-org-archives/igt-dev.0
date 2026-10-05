Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32047CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 06:16:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACED910E0FB;
	Mon,  5 Oct 2026 06:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tjaml+W5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7F10E0FB
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Oct 2026 06:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791180936; x=1822716936;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=61kAzAyXjThqs29G9hOT5EtYqVinWk4L/6iXns5PS2A=;
 b=Tjaml+W5//VBiYKz2lOFa62IIY7XWfSy675mN0x6fGhuf2GfyNQuutsv
 0zqK+e70lWo4MBk/eHJfxB2lBBJspbAqwN+yOh+T3oul6gxooaYvnu/B7
 PUmBDb2OzQL9gt957Yk832Lw1WiHAdiFgubizpkmrcLUgL93LMWZ7jem6
 PLcb/4So55Tr3dPj/RMgD+ANbALu7YabY2lpjDn664bDAQw6ygDMo+1Pg
 Z7fial566uAhdmbwP88ogWekbTDCahGYgNScUfk8ZPlFx42dIcjRvrwVi
 4TEzrSd/hHeITg8KjEikH9t2a+91d/yxIs3PSZ8cvGNa1mst8SfLt+68G A==;
X-CSE-ConnectionGUID: CC+j5JgqSpatDaCsgTgoow==
X-CSE-MsgGUID: uRtT1URBRxGHKxuwpVJn2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="109332223"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="109332223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:15:36 -0700
X-CSE-ConnectionGUID: 9tWfkvCGThWF+3fIN8dQkA==
X-CSE-MsgGUID: IyqUwvgySWqVAVF+yyhXHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208";a="280011632"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2026 23:15:37 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:15:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sun, 4 Oct 2026 23:15:35 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sun, 4 Oct 2026 23:15:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZcBbXYopEbJY6LGJWsOobPTJXDTdC9Okwd0Vu3zJKEw6y0u4QYP1SngRwiVn7EzBRoWFf8HeHa0kjF7w+222L0DxK2HL1n2r8OCfJUY/KugiAPBClQKqoJ/3fsq32FLNQIORtPgO/P6OUcQLOap4WOztwIYrQE6f+Y6ziJcINFLXZg78Wxov9biKOy1OW/1z/weJReIV0GmYesxFJU9kuTUER0D/ajOKbH0NPFzSwYHzaeHA3Wrcu2NIT2Vsg4byiHA/m/HfUbkGTiD94wqHNF87MCup9NfpsLkF8P/059bbWmdcUF7zpsOrdEh9w+qZ7BblBMRo0JCWNoQFJvrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mu3SLVtNoav3M0vSFjw2GXv7j18VmbsNyjVYcNCkbxk=;
 b=SPuQKeBIb/RbZovZ2WfiafQheEFDN8Halm6DlG7l7JTHI3f7Id6v/UzKDgRmwhuFxiweRSGHybZ3ycKkijIevfHIEeVqej6b7kxnD2vcxY9ufXpfrnFUwc09sabcN3/pxgkTxmACCACMQT5lom6GjokAtoY28d29IjQzV470Lz+dgoTdoglff7X3OymnXtCGcCPHS32T6C0xqkKtr4tvUh8dUcinhwuFzN6BNWszTcNY7lP/jHywmtr5w+Yx+F2aMavTAxaoHVGkl8o2yqsyxbutE2yYFk/327fg2D60gxcc3rsi9AW6/VaIAYV0iWoQsP7nyjz0oid7ZaL0rlSkkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Mon, 5 Oct
 2026 06:15:27 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%6]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 06:15:27 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Thomas, Sobin" <sobin.thomas@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Brost, Matthew" <matthew.brost@intel.com>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
Subject: RE: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
Thread-Topic: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak tests
Thread-Index: AQHdSoIzlEmtFkpAfEaF63j0hTW3ErboTAMggAZAH+A=
Date: Mon, 5 Oct 2026 06:15:27 +0000
Message-ID: <CH3PR11MB8434CED037E1924FCEA558EA8D962@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-3-sobin.thomas@intel.com>
 <CH3PR11MB8434BAF67C445F8398131BB28D8A2@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB8434BAF67C445F8398131BB28D8A2@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|SJ1PR11MB6276:EE_
x-ms-office365-filtering-correlation-id: 2ba30a86-8bda-4dd7-85e0-08df22a80cda
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|23010399003|366016|38070700021|11063799006|10067099003|56012099006|22082099003|18002099003|4143699003|6133799003;
x-microsoft-antispam-message-info: RITWNxqBuxO7XURcRKbCGr06ul5oS9buEXtZbVPRjiPJTchg7O0yG4KmpIcfPAcqcc5+h+bGBK2Z0TA50HNNhSHTzK0kr1v2yPcB8zC7GXxK1RDxv0Qph10mMNVboWYTGjstKQk7y+b31GohyDoUl0wO/tjqJhktlFlp1unoUMs/e2sd/xJYslrtw/UJR1GCXiEpheUKumlLogov0n65gfUF7jhkEK21VXgUbikjCy/41Ns3WvOn1dVIz19sieG3NU8L2NmwDyZ+JyXwLr6GxFxPEKLR2b/jkM4K3kX5FLbJUeZW6b3PcZY1G7RKJlPAUVca2PusHoPeSD9EuD0YwpAYYtbi8RI/xH4mekkCpZHWMA1s35Lz4rzuZLWeDGsxs+x/QLkw4aH23/on3hcGY/86ycqtyxs9S8gaEMT5hhvnKG9OLlrxKoVokiZDVty8p6ooBntIlwsN4ZxKzDZ1IYM1iYkBCY1pv9TJoCqXVdOiWjNIsvlAhtSLNDw7Bbc2YGXe8/+oS14ykwmopbeIaGT2PzJNvV6v4yCvtUfs1QsGAXeWHA+J8OTnlrLZ9D7au72p400oeFQ6Q0wY56KWIumheI+LmVoeWhWZhZFhDbFwXczmTTmTCW7nrxn8Pn6CBRZUGgIjpfXfX98X14o69Eoi7OpmIl2w8ujuEHGuQKx+ykE5ccVEQqOToopGMyABaMxH5VxSGU4p9uQrZ5TYiORRZ/jZXE22nmtv67Ee59g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(23010399003)(366016)(38070700021)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W7azXtE74gGCkR0C84GhVahAXExLYt9+5CWgV801TwaGjQLQ5IL2X1rX7hYl?=
 =?us-ascii?Q?1TbphrJK0s/tl5dlxVh4WWADyUYEaPlp9SYcMWMRJuSdCKza/yZ00I5J1+jn?=
 =?us-ascii?Q?9eofLR04iO9nSfE7zFA3/wET6Cv1dQrcW3WTJRmvNQTjIlHKLtP1ccFgj6fN?=
 =?us-ascii?Q?rVTMFrFGlczhMaTDS36gjtIl1EsUa1dVnifxFArgg39hz6EYv9S7tp9b78d7?=
 =?us-ascii?Q?8DX4MMLfeHCjLKTGQTZnsiFJQO/H8j5D5JYjDLEIuY617Z/bk7a+QdtzU2Un?=
 =?us-ascii?Q?TZjLQCjFTjjHCALGxNqCSie6whXa++4eI1ZVTjeg0xtBuXcyLgdXl8GWxBHP?=
 =?us-ascii?Q?+HDSKa3AlSwRkv/EXNphrenH/S4ODiecW8uuCwR+F74YgfNMdUQaKISMQyNe?=
 =?us-ascii?Q?0QaURQU0jnCXCaFaow35lT3NPtwf27LeAl3wIsJHRkWgt3PshNzwyocRINUZ?=
 =?us-ascii?Q?iBBF33IQiuF4UM1PcsNjObrw2HufvE9w8YXgVGUPn3KG9bMtsAmWJqiT/4+X?=
 =?us-ascii?Q?pXYNDXwtJee6mBgY1XTJOHZB9CfPSIciEowa6/Z+rgy5S3J2AXEwUve3nkGl?=
 =?us-ascii?Q?xnubxNVAaBbx2qSIrT8nASMKjXgg6subeg758W9J/sboFh4RjZ4pDkrgrzmb?=
 =?us-ascii?Q?fQcuCpfFNf/eULJslqEMZ+ziTTyCX4yTFMdQWLHRnlyhv8H3qwZxh34ejd//?=
 =?us-ascii?Q?++m+XP9oTHl7Y44qHlaeQh7enRsh4ix1xGs2mqNJDYXyAFaqlxydScSBn4zB?=
 =?us-ascii?Q?1VqrhN979smczT04yHWx/YZYT8pF6Lyq3NCbXaGceqR+D8xMWkp4kggzs/rW?=
 =?us-ascii?Q?JSXpBHPPa5zOmhDnnqHJv231Nl9Ml43AJ4U2HH4EqUxVO+3lAbQB5YAtv1aw?=
 =?us-ascii?Q?z+Cym7gQoZaBi8vtIR+AzUdOHEcK3pRXEJYf9BN0EWRMKQoBtU8FWKU4hVnN?=
 =?us-ascii?Q?ynIdwEUD6kTipQBpbcPnt0rwbDiVX6+GXWFWw+CQSkpLbA1wIChZZ5cd21EE?=
 =?us-ascii?Q?DI/u9oeUdTn8hymMlLQNflwbW8yDNAnrsdxDyj49TBOZ/5RRCs60pk+6curm?=
 =?us-ascii?Q?dOCYDT9DEXYcmpyuOXYXLVFv8O1f+hAVggmqaOPUcBOG3T+0dgnF1BGxrWbO?=
 =?us-ascii?Q?tAHyWY0W8Kb6LKic78SvG7/SuSaVvUHK6bNgVgf3NfNr1nnBGdHgEFTftn/K?=
 =?us-ascii?Q?idqAnlOLzCqRa7b+JHEHbTyCz1duBhdoMU5H52eAPjRuDjmNKDfTc7Fa5N0J?=
 =?us-ascii?Q?HLjJT4owXWl7wlkajMwOVg/uMXg62DjhEQadAyFooHt84LpzXI+Su4NhYRsu?=
 =?us-ascii?Q?xH/Wyz939Tinn8FH9rSTgn3u+uPYgMvIPgDuXiqSbFnWErkJHTF5dGCBzkD7?=
 =?us-ascii?Q?FkZ8JqRqgUl+Cjd99xzt2XAyejqL5FNl+6NXUgv8PaYbbcHSdAPxg3yhOQKV?=
 =?us-ascii?Q?nL5Gzflybh8MdenVjV0SpHp/y2lFjheCYNnuxVldyRoPRD0Z4pHFugkRFx4j?=
 =?us-ascii?Q?d54g2/6n9eDdGmM2FxZQfQeFwt6TufZtK4DZ2ejQ4LVCKuX3jHoekVEYK7bR?=
 =?us-ascii?Q?gE0k9JseE1HiJTXly13KeaAHeU4C86xBsapC21bTnxP78m7l/d6GwEIt4/lH?=
 =?us-ascii?Q?V63VLI3hITcJVBmNABGDgKRZfxMLT/Anhs6hyOgdplSTo/CloQrGqJFYi+0G?=
 =?us-ascii?Q?pZm9BxT79J5c6+F5mkrSHvUy1pM6V1BBdROBYdRc+Vwfz6XvrtBbVIBOuxa0?=
 =?us-ascii?Q?hFRELuszhGQy81bdbnIVFxCd0oBeIaK0DSDIzDYuuMWpzd6F1OlWJfkoJPQh?=
x-ms-exchange-antispam-messagedata-1: QGpEeltbrBb5cQKu4WW5AiP7TxXEpFA9e1Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: KwixDPmoV0tgOhmKKsFOJyxzkNX5xNdRrKy6WnQCRRqDoHXUOtfptpqhFPwpcmzedP0o1fAb1vJQ7JRwDQYd14qOUtJD3BVzcfB+MlNjqjOuGBhns9AlkI4k3vXV92LuqGspFzcupeOajzZsgq+H2RCi6yP9a4a/z4XDiz39H7tp2ESHDMIbxMfhQtnef1Yx5xLrpReH9V6ORZi72lUkPM7hhEZuZ1z5o4+yTOkG//1mmr12yyrtofEvzdEt9bum6wfz4U0s/vmOcb1B5mC/YxqjVUUQ6scKDOLnG8GfQ35+WUzIqFks8LpXeD2BxdsUXjkSdOWlamV4tNLsp6YdVQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba30a86-8bda-4dd7-85e0-08df22a80cda
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 06:15:27.5074 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UMOYKO0CK2+hX1IZuqchZhofDYcf0fHNAZD71CdA7cJsV+2Wyqzho0AI9VEhVywWsv7Az9JlZJN9+DXPDLY/aGpTcKfwFVCBm0ODBUdWJCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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
> From: Dandamudi, Priyanka
> Sent: 01 October 2026 12:20
> To: Thomas, Sobin <sobin.thomas@intel.com>; igt-dev@lists.freedesktop.org=
;
> Brost, Matthew <matthew.brost@intel.com>
> Cc: Sharma, Nishit <nishit.sharma@intel.com>
> Subject: RE: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak te=
sts
>=20
>=20
>=20
> > -----Original Message-----
> > From: Thomas, Sobin <sobin.thomas@intel.com>
> > Sent: 22 September 2026 16:35
> > To: igt-dev@lists.freedesktop.org; Brost, Matthew
> > <matthew.brost@intel.com>
> > Cc: Sharma, Nishit <nishit.sharma@intel.com>; Dandamudi, Priyanka
> > <priyanka.dandamudi@intel.com>
> > Subject: [PATCH i-g-t v5 2/5] tests/intel: Add random-size BO leak
> > tests
> >
> > Add new RANDOM_SIZE subtests exercising randomly sized BO allocation
> > This test excercises allocation, execution, validation and cleanup
> > paths across a wider mix of BO size, helping to detect issues that may
> > only appear with specific size combinations.
> >
> > Add the following subtests:
> > - rand-sizes-10
> > - rand-sizes-100
> > - rand-sizes-100-unaligned
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
> > ---
> >  tests/intel/xe_bo_alloc.c | 126
> > ++++++++++++++++++++++++++++++++++----
> >  1 file changed, 115 insertions(+), 11 deletions(-)
> >
> > diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
> > index
> > 8680fe518..bd5bf5a33 100644
> > --- a/tests/intel/xe_bo_alloc.c
> > +++ b/tests/intel/xe_bo_alloc.c
> > @@ -34,6 +34,20 @@
> >   * SUBTEST: all-sizes-once
> >   * Description: Test all BO allocations sizes in test table
> >   * Test category: functionality test
> > + *
> > + * SUBTEST: rand-sizes-10
> > + * Description: Test 10 random BO allocation sizes in test table
> > + * Test category: functionality test
> > + *
> > + * SUBTEST: rand-sizes-100
> > + * Description: Test 100 random BO allocation sizes in test table
> > + * Test category: functionality test
> > + *
> > + * SUBTEST: rand-sizes-100-unaligned
> > + * Description: Test 100 random BO allocation sizes in test table,
> > + unaligned bind addresses
> > + * Test category: functionality test
> > + *
> > + *
> >   */
> >
> >  #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) @@ -45,7 +59,7 @@
> > static uint64_t *alloc_sizes;
> >  /*
> >   * Data-driven subtest matrix.
> >   *
> > - * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise
> > exactly one
> > + * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise
> > + exactly one
> >   * engine per invocation, so they're wired up as a dynamic child subte=
st
> >   * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
> >   *
> > @@ -59,6 +73,7 @@ static uint64_t *alloc_sizes;
> >   */
> >  enum test_type {
> >  	TYPE_ALL_SIZES,
> > +	TYPE_RANDOM_SIZE,
> >  };
> >
> >  struct test_case {
> > @@ -337,6 +352,15 @@ static void test_map_bos(int fd, struct bo_alloc
> > *bos, int
> > n_bos)
> >  	}
> >  }
> >
> > +static void bo_release(int fd, struct bo_alloc *b) {
> > +	if (b->map)
> > +		munmap(b->map, b->bo_size);
> > +	if (b->bo)
> > +		gem_close(fd, b->bo);
> > +	bo_alloc_release_va(b);
> > +}
> > +
> >  /*
> >   * Build and submit one batch for every 4 KiB page of one BO.
> >   */
> > @@ -414,15 +438,6 @@ static void execute_multi_bos(int fd, uint32_t
> > exec_queue,
> >  		execute_bo(fd, exec_queue, &bos[i]);  }
> >
> > -static void bo_release(int fd, struct bo_alloc *b) -{
> > -	if (b->map)
> > -		munmap(b->map, b->bo_size);
> > -	if (b->bo)
> > -		gem_close(fd, b->bo);
> > -	bo_alloc_release_va(b);
> > -}
> > -
> >  /*
> >   * Runs prepare + bind + execute for n_bos BOs at once (n_bos =3D=3D 1
> >   * reproduces the original single-BO behaviour). If LEAK_BINDING is
> > not @@ -
> > 488,6 +503,88 @@ static struct bo_alloc *test_alloc_size(int fd,
> > uint32_t vm, uint32_t q,
> >  	return NULL;
> >  }
> >
> > +static void validate_bo_leak(int fd, uint32_t vm, struct bo_alloc *bos=
,
> > +			     int n_bos, uint32_t flags)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < n_bos; ++i)
> > +		check_exec_data(bos[i].map, bos[i].bo_size >> SZ_4K_SHIFT);
> > +
> > +	/* Migrate the whole group back into VRAM, recheck */
> > +	if (flags & EVICT) {
> > +		igt_assert_eq(test_bind(fd, vm, bos, n_bos, flags), 0);
EVICT is not required in this commit as its not being set or used anywhere.
> > +
> > +		for (i =3D 0; i < n_bos; ++i)
> > +			check_exec_data(bos[i].map, bos[i].bo_size >>
> > SZ_4K_SHIFT);
> > +
> > +		test_unbind(fd, vm, bos, n_bos);
> > +	}
> > +
> > +	for (i =3D 0; i < n_bos; ++i)
> > +		bo_release(fd, &bos[i]);
> > +}
> > +
> > +static void check_leak_multi_group(int fd, uint32_t vm, struct
> > +bo_group
> > **groups,
> > +				   int count, uint32_t flags)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < count; ++i) {
> > +		if (!groups[i])
> > +			continue;
> > +
> > +		validate_bo_leak(fd, vm, groups[i]->bos, groups[i]->n_bos, flags);
> > +		free(groups[i]);
> > +	}
> > +}
> > +
> > +static void alloc_rand_size_bos(int fd, struct
> > +drm_xe_engine_class_instance
> > *hwe,
> > +				int count, uint64_t vram_per_process,
> > pthread_barrier_t *barrier,
> > +				uint32_t flags)
> > +{
> > +	struct bo_group **leaks =3D NULL;
> > +	uint32_t vm, q, bo_size;
> > +	uint64_t vram_used =3D 0;
> > +	int i, max_batches =3D (count =3D=3D -1) ? MAX_ALLOCATIONS : count;
> > +
> > +	igt_assert(count > 0 || (flags & EVICT && flags & LEAK_BO));
> > +	leaks =3D malloc(sizeof(*leaks) * max_batches);
> > +	igt_assert(leaks);
> > +
> > +	vm =3D xe_vm_create(fd, 0, 0);
> > +	q =3D  xe_exec_queue_create(fd, vm, hwe, 0);
> > +
> > +	for (i =3D 0; i < count || vram_used < vram_per_process; ++i) {
> > +		struct bo_alloc *bo;
> > +
> > +		bo_size =3D alloc_sizes[rand() % N_ALLOC_SIZES];
> > +
> > +		igt_assert(i < max_batches);
> > +		bo =3D test_alloc_size(fd, vm, q, hwe->gt_id, bo_size, flags,
> > +				     BO_BIND_BASE_ADDR);
> > +		if (bo) {
> > +			leaks[i] =3D malloc(sizeof(*leaks[i]));
> > +			igt_assert(leaks[i]);
> > +
> > +			leaks[i]->bos =3D bo;
> > +			leaks[i]->n_bos =3D 1;
> > +
> > +			vram_used +=3D bo->bo_size;
>=20
> Currently, the test only does similar to alloc_all_size but does with ran=
dom size,
> leak is not happening.
> As LEAK_BO flag is not set in any of the three subtests, Code related to =
LEAK case
> is never being executed, it always goes to else case.
> validate_leak_bo will not execute. So, LEAK_BO need to be set.
>=20
> > +		} else {
> > +			leaks[i] =3D NULL;
> > +		}
> > +	}
> > +
> > +	if (barrier)
> > +		pthread_barrier_wait(barrier);
pthread usage is not necessary here, I see its not used anywhere.
> > +	check_leak_multi_group(fd, vm, leaks, i, flags);
> > +
> > +	xe_exec_queue_destroy(fd, q);
> > +	xe_vm_destroy(fd, vm);
> > +	free(leaks);
> > +}
> > +
> >  static void all_sizes_once(int fd, struct drm_xe_engine_class_instance=
 *hwe)  {
> >  	uint32_t vm, q;
> > @@ -544,6 +641,9 @@ static void run_gt_dynamic_subtests(int fd, const
> > struct test_case *t)
> >  			case TYPE_ALL_SIZES:
> >  				all_sizes_once(fd, hwe);
> >  				break;
> > +			case TYPE_RANDOM_SIZE:
> > +				alloc_rand_size_bos(fd, hwe, t->count, 0, NULL,
> > t->flags);
> > +				break;
> >  			default:
> >  				break;
> >
> > @@ -555,7 +655,7 @@ static void run_gt_dynamic_subtests(int fd, const
> > struct test_case *
> >  /*
> >   * Data-driven subtest matrix.
> >   *
> > - * TYPE_ALL_SIZES / TYPE_SINGLE / TYPE_ARRAY_BIND all exercise
> > exactly one
> > + * TYPE_ALL_SIZES / TYPE_RANDOM_SIZE / TYPE_ARRAY_BIND all exercise
> > + exactly one
> >   * engine per invocation, so they're wired up as a dynamic child subte=
st
> >   * per engine below (igt_subtest_with_dynamic_f() + igt_dynamic_f()).
> >   *
> > @@ -570,6 +670,9 @@ static void run_gt_dynamic_subtests(int fd, const
> > struct test_case *t)
> >
> >  static const struct test_case test_matrix[] =3D {
> >  	{ "all-sizes-once", 0, 0, TYPE_ALL_SIZES, false },
> > +	{ "rand-sizes-10", 10, 0, TYPE_RANDOM_SIZE, false },
> > +	{ "rand-sizes-100", 100, 0, TYPE_RANDOM_SIZE, false },
> > +	{ "rand-sizes-100-unaligned", 100, UNALIGNED, TYPE_RANDOM_SIZE,
> > false
> > +},
> >  };
> >
> >  int igt_main()
> > @@ -586,6 +689,7 @@ int igt_main()
> >
> >  		switch (t->type) {
> >  		case TYPE_ALL_SIZES:
> > +		case TYPE_RANDOM_SIZE:
> >  			igt_subtest_with_dynamic_f("%s", t->name)
> >  				run_gt_dynamic_subtests(fd, t);
> >  		}
> > --
> > 2.52.0

