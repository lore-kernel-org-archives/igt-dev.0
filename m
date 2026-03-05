Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5071EFCE5F
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 04:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6997A10EB05;
	Thu,  5 Mar 2026 04:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHj6cOWQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9554810EB05
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 04:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772686392; x=1804222392;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sxVft2gw8g/oz+h1VhAmf/I2JPHWzi0PTvwOcNfQ+7Y=;
 b=KHj6cOWQW962SGMoypkFgSoQx0ltaIHODVusThbSmO07Mmjb3k0Xp5Au
 i62fV0P3jByoHY9wkpXeuGZVM5/ALz8h0WXXjLs8lZF+9jn0QZ9Dbvn1E
 CLc9dQQzK7Vsvk3RiMWdGBEE6VCD5SvRvP1evIdrDPVaYXLNm3d+lsYRW
 laXqfhq/9Q/XbDoxYH71y5l8qpPzV22e1bpHaoMAeJUhurGjjEvuuinmb
 z4T48DUHekGdeZK9KXGRud/1hrdi7mUsrgnsbaVZAaJ9SlmGX95Jmuzc6
 OPTa1tRlALIV3d241x5SNS+tdd6+yDNNHd01/lxGrwRQh22z5dj9lb0M6 Q==;
X-CSE-ConnectionGUID: BVodfAkRSsiot4SnsFhZ5Q==
X-CSE-MsgGUID: gruN/L28SqeJJs/ye2FD0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="96377538"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="96377538"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:53:12 -0800
X-CSE-ConnectionGUID: Iz/QIVuRRmCkEi41k+jEMw==
X-CSE-MsgGUID: lRKlENuGTmKqGipS2MhEPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="215840117"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 20:53:11 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 20:53:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 20:53:10 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 20:53:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng7arjNcseFkm9xp0YzWriLAZ3Cgxeya4MVZMEAR78bm2pzMb2hFoLHj/VVjit8rutdnUHKnFjNlVZiYzyrCWC78ZikrFOmBv71yUXga5i60bSCkBNzTO3LyycNrZbpHeirjC4RCreYwJvNkj5SS5/4OTMkLsj3r8eqddNPp1IL3PZvzlMUwqcBSNM3c+q19ox94BsKHBEyr6rN/si3dauk2rvMQJ6jNgLk/DByHQIyopJKlsGvgP1P6M7+T1vYBt+3Nb3OiInz0JsVZ4j4gHhNisPFlZLySMabuSY2RaTgOv2VI5hqu5oe1BmMa0yT/xQ3iBtoXMLYBYeSZny+MoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C2/c6iU+qoUUdbuHmh7soOr6NEBPrFHYWuE4peeBCgk=;
 b=JzZLqeSR8N7ZMzGId7RFXPa4na7h7cV0dbD3d6YpbPWn2DzM2mKX4blocIyIruhjmfXbeb7mYCh2+1R3zxTVi99yCoOzuEjaTLH2gPfycU49AnyyU03NwEhBCzAizlJDBOyDrasSuj06Rbtp0VHD4WGVhrPGPtDTPj9htnkOY5UHskBIg6PUBr+T8oa6GAYUFOHeQCc5yEqur8JsI/8nN5lCalYcAMWGP+AOB7Vyso0nDarA82qU1MYm5l6PJMRP9JOdXB96VXJDdx+BwGO8if74FWvximBuKUUNoCiVk/8I9n/4PbE6EE3qPa5cjOERLZfatea3OL8m9zmBq62KhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Thu, 5 Mar
 2026 04:53:06 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%4]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 04:53:06 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Goyal, Nakshtra"
 <nakshtra.goyal@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
CC: "Miszczak, Adam" <adam.miszczak@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
 exec_threads array
Thread-Topic: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
 exec_threads array
Thread-Index: AQHcqtd8QwokhGmKl0+T4M2bw7gJzLWceMaAgALpPXA=
Date: Thu, 5 Mar 2026 04:53:06 +0000
Message-ID: <CH3PR11MB8434912AA40FD4304E3A85518D7DA@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260303063154.489637-1-nakshtra.goyal@intel.com>
 <CH3PR11MB84341FDB31AAD20A4BDC4D5D8D7FA@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB84341FDB31AAD20A4BDC4D5D8D7FA@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB5231:EE_
x-ms-office365-filtering-correlation-id: c9b99ed3-7322-4dfd-88f9-08de7a73176f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: zKYgZs3WEpYY4u8sTkYbjQJ+XyykNCWr9+cq1s9e4FMtq3J5L2ZFwJ0OhvivV/6mzC3uIp/MkRZlC6nnI6/JRvBD6Vz9j3zpGdzri08CI2B/b4J2C/JMucG6pZ6R7phXud6PE+UOO+8HZGSayRJ2ZKY6SEtCTStDaxJtDNRNm13gM/ZxHallpsf7jY9pYHkZy25GmXOIKyqJylwhhiMhaQufOf7W4UoFGysu3vV9zJWEl5kWmmef0Uj2xM8N0QiYWWI3+c9t20Rq9pQ8fN7D1uUPW5SaixjVY7mlOPehBvWVDJtaqxUOH1OjYopESq+grrYktzVPA9FtvlEME2g9be1ru6LM+wbgA3obuWVH9SEv0eTfTh/XdwXFCgOrA++fvhDl4/l3EnyKlDT7FWsLWvteoqNn3jgxBqLq+3fdAIlnQczZo01hA8GULmiz2l/PE0tEM0ckDQJ5vNRlq2PTksr+9ILdtRxpqVloJjaasyGbZh++oaby9lV2l8prEOf5n6IpJcoFRYA5fUb5BpslEtE/RXKkcf/HCIdtvYOYX8DfCOEOxoHWtl6a4skdPtSNAuPdycu8NS9qrswDeRJ+nt0YA+Ybi1OBOkmDov0oyBPvTs+wKAVXxVWD27JHP8rF/tyLrZPuqlQETgZ4+9RLN+IIFkvs0I1PafBIw3kTYTSrBORpNL4asjaxqZfWRGQHE3TjPLuVtr+1d1XnOA8v00y0qre82RpfeUtiebEySTohIGevMHH9YfUukMMhEL3enOXZ5WsIc0afNFziE4KQZqAo6hmJq8f32/JG9cpCngA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I3O7gwE6AHBj84V+THeaKVgE3eB5cjg76cj81yTWeEs3rJK7oXBx/Pgfzp1E?=
 =?us-ascii?Q?fVxR9XXo75Yy2Ox5UbTeDm8mPuuFA35iovrKJKX4S2oEoVAY/4KJgwaMAzXE?=
 =?us-ascii?Q?FhJegvNvQmj0jNKaRc+Hcfrvu7tqB4Xc67gyuB4LGXQGUv/4+FAkLCBwFyty?=
 =?us-ascii?Q?FjcHcRek/akCS8bwgytkY8ShHTBV+FdiOR1LColItY9yUZ92fMASepgRWQD5?=
 =?us-ascii?Q?MQWohHtoo3coL5Pb3ZcJh7s49zKwCwfE+sDsfKYteQtEqjh5qN5RTYBHa+0R?=
 =?us-ascii?Q?WBJahAygN923pC+YpxpKGlHiqB1UC6AgSdWhqPz+4cUKBK6dAiO0di7mMjc/?=
 =?us-ascii?Q?GSYYv9vtFzuWIPXdxTiDHMH7YkkKWH3uzZySLEliWXgmXVfovnCEiGn6pMbs?=
 =?us-ascii?Q?Uj8V/GWGdFhgpMB3cADqR3yeYbyWpUg31Us7vkaG3JtLgJgX9jqctxK8gI16?=
 =?us-ascii?Q?WOHLE2hD2XhmNCtHD7yZXoqlzca+Tfkn8tQwR2IQbigWSzuHD/W987EdXJL1?=
 =?us-ascii?Q?mTYbw5saJNmH+S4OGMqIX/B2nJ5u0V7MqrQ63Ub3IhnFEeuLaKXDSe82GXw5?=
 =?us-ascii?Q?Z2aBXmdJfZxDTzLhZxF2oyd/4WQl//K7/d648VQgy66N+ykFEmRhDMAV0/iX?=
 =?us-ascii?Q?i2haHzX9n3bSrSdcseElzkyE3jYkSBvGxsTcajUHqxXP/6ZYFAV0nVS6xhPb?=
 =?us-ascii?Q?VfhX31fig40e/0PekxLpf6U4qGROyZvyHjLmSUY5bYfXwibBMahjG4pJYp1W?=
 =?us-ascii?Q?xKNYn2ZKu25e+CSz9UZOkp3djM1wNjF2h9dpb2KsjsgIFzMgSuntXyIM/yuP?=
 =?us-ascii?Q?1nftr5nZjmdvjjSGOetc8XImeY0RUHz2OId9Sz/gZeGIro/ReVGEN/4VgF0a?=
 =?us-ascii?Q?zwBd3aipN2GcA6TLBf53oJ/bm55UyzqZPQN/64QO/+l3MzAlGac+U4R49Brd?=
 =?us-ascii?Q?ZmKZvGo1oKpBpCT9M3Mg6NUPLgkojEO70KB5C4hZSOImnzgxiLIm0DfojKR4?=
 =?us-ascii?Q?SWHwxsLEpRUpbweKfkoChPCU3lqtl0+PcEvkRaW9Iryjr9Kcz9JW3RWM9nVZ?=
 =?us-ascii?Q?UNh+O3qmLorRFxZknf7ZIgyYKerv5mXMw4tly1UFp/ZEqmiyk3V+kgLIp8wD?=
 =?us-ascii?Q?o8PtQu9wgRuAKtmFdUYcSpxzJBalwy9ZRWSNoNWWA6YqcdKI3cZCDU9U9GJp?=
 =?us-ascii?Q?wLgjQMIvMSg2xoLNPooa71/Ua62tLHIT6BsIUC0vpQs/TVVuY7sLNDJpvbPU?=
 =?us-ascii?Q?dQtmv52WkwSKuwOqLDT6pL56Q3McyMklgffMr5AgnpqzOUn6tVxihPOiyaC3?=
 =?us-ascii?Q?uHalpdHdseYnMezEu74sRcWTnIPoGuv6JLPIeo1PbV35LPSsuxKQODIG+3rR?=
 =?us-ascii?Q?H8YO7HcHR1Oo/Nr9wnsJ9Dq/44qU3RrfLmzpu3mNfkebmObwjGeCfhotkuhm?=
 =?us-ascii?Q?kq2WCUr9C3mBbcRh+sUDRgG80YhZ4XP4qR0TWyZff+Oo7yZNkdPooYnq5Xv7?=
 =?us-ascii?Q?4B0vWGDpOyNNFhFDJKMVMKan/qEaUEN6G2/bzzp4qrQ+Jo+TisIAt9tRfMl1?=
 =?us-ascii?Q?hy8sf5TFa6rWeJlSMsQ1DmucBnZVb1zeN7w39q4QFcpQrfjbbPTUlm3iPYuJ?=
 =?us-ascii?Q?EL8PUDT7pCqxaBsMX/DJFCvzNY/byLk+HTqrnMrvB8gxyYjx7p4DaK6NAQCP?=
 =?us-ascii?Q?vXijk7AmX6+I6ArIyQy4wE7RqAj2Oq9thYJmmDC5W1U/AUd1hVVr5LUMKizU?=
 =?us-ascii?Q?/gb8519LLsmMndjWfj/+uz/uMHf1/NkSFYwiPVO4vWdlkpDxZ6fDPLcGljrB?=
x-ms-exchange-antispam-messagedata-1: Mk7Bx4cfEV5/SA/yHeUHmi5NCj4SVAHecgA=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9b99ed3-7322-4dfd-88f9-08de7a73176f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 04:53:06.5943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t7NK9AhFWiCSmBNewCienphtiiaSSz1X5D1Aoh0mzqO0IQPZPJ80p0KKOPBxyiwypLwpIj9sz/ehVutjWIlWQ0EziwYF9ZQ7nRI4RwceHWE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
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
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Dandamudi, Priyanka
> Sent: 03 March 2026 02:08 PM
> To: Goyal, Nakshtra <nakshtra.goyal@intel.com>; igt-
> dev@lists.freedesktop.org
> Cc: Miszczak, Adam <adam.miszczak@intel.com>; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: RE: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
> exec_threads array
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > nakshtra.goyal@intel.com
> > Sent: 03 March 2026 12:02 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Miszczak, Adam <adam.miszczak@intel.com>; Brost, Matthew
> > <matthew.brost@intel.com>
> > Subject: [PATCH i-g-t] tests/intel/xe_exec_threads: Initializing
> > exec_threads array
> >
> > From: Nakshtra Goyal <nakshtra.goyal@intel.com>
> >
> > Initialising exec_threads array to zero as threads-many-queues test
> > fails on initial check to non_zero condition , it takes garbage
> > value(non-zero) on first iteration , which call synobj_wait on a
> > synobj that was never signalled.
> >
> > Signed-off-by: Nakshtra Goyal <nakshtra.goyal@intel.com>
> > ---
> >  tests/intel/xe_exec_threads.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/intel/xe_exec_threads.c
> > b/tests/intel/xe_exec_threads.c index 27d5a8928..f082a0eda 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -502,7 +502,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t
> > addr, uint64_t userptr,
> >  		.num_syncs =3D 2,
> >  		.syncs =3D to_user_pointer(sync),
> >  	};
> > -	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
> > +	uint32_t exec_queues[MAX_N_EXEC_QUEUES] =3D {};
> Your approach is correct, but the below approach is also correct.
LGTM,
Reviewed-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>                         if (!(flags & MANY_QUEUES))
>                                 exec_queues[i] =3D xe_exec_queue_create(f=
d, vm, eci, 0);
> 		else
> 		    exec_queues[i] =3D 0;
> one more question is across all the test cases, why can't we initialise t=
o zero
> in the beginning for these arrays, so that these kind of bugs can be solv=
ed?
> >  	uint32_t bind_exec_queues[MAX_N_EXEC_QUEUES];
> >  	uint32_t syncobjs[MAX_N_EXEC_QUEUES];
> >  	size_t bo_size;
> > --
> > 2.34.1

