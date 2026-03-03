Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BEF2EDEBE0
	for <igt-dev@archiver.kernel.org>; Tue,  3 Mar 2026 18:30:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E185410E084;
	Tue,  3 Mar 2026 18:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iwnDojI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D2110E084
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2026 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772562621; x=1804098621;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=p255H8pGW6KKf0fO1eB3onYB5jMgaNRc+tC89DHPlwg=;
 b=iwnDojI4KaFUNdskeFy7GCd4fS5EwOpUeauMGBtxA2CEC0a6UhJ3LUEZ
 89V4dAWRIiMDAV41kGH6A625Z+hzk1XbG0G8IXtEnwMi1XOB/t+z1xPA7
 Vw6lq2MF/EOXHpPvmrPyU0lorOiAL7O6nyhg5Zyki9lccOfQ6ZPX1xwbr
 Qz0nO1L+TZ6pjOclLcHQau75LEHvxW903QCMJlMy+YjObEduuvLXKgu/J
 LI/Ebw+0lNhmQ6uZ3zhJVyjYTBBm/hBQzMPAO1esCBRAum87ePNjkDGr4
 s6yGMl0T8jHjs86vZHdti5o17j7TPi6y2K4HHQuErez3LJ/IeBA3WVA7s w==;
X-CSE-ConnectionGUID: 65AAiWUBTgOHxnZxsIdOow==
X-CSE-MsgGUID: fOftiRChTKOmIBV6z0lH1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84247705"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; d="scan'208,217";a="84247705"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:30:12 -0800
X-CSE-ConnectionGUID: B3KUfqX9TeecGy/uJ0GjSA==
X-CSE-MsgGUID: 9clkoUc1RFi2+FHx9BWqiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
 d="scan'208,217";a="255978933"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2026 10:30:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:30:09 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 3 Mar 2026 10:30:09 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 3 Mar 2026 10:30:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GA8Iwu1Mpfa7+J5AsoN+q9V2CmwBshYhbW3noqSUhkkUKeo3OlK/HqvhPm/ZdzMUwSgMtbA03fUQnIwVMmeMpuR4mGBRFYynOoWqQcoMw4DAzbo1B2aqbPeu9+TszqUcFWbsHQbCY6oceLPyN0OpH3XMID9CYZnlICRD9UqeMVpYArvffMOyl4GeI3m5QXHadMN0PzpnlAoK95tTuwsM3EkGEftamlimGOGt1W1Bx5haivHgSdAE1vpl5G1EbbUGJfAQENWPZfRaF8zdYQysLOhYWiguCye87GnQlC0qwhOe/r1MIsLEjoNTBW5n41A76xMsqTssr25q4V0O/X8Z/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7UNpWaGUk75+8gKbn51Rm0NjSQWGeKalGyMjYHJ/CSM=;
 b=Y+gtS0wzqBc6d8hMCxEpPZ6vOcKdsjlvNnM+prJpLEhvrBpz3bmjMvcB5ij+eSILu3jPgwfDS2zNKBThY3ajJp/yUgEuQnJEoz9UCUIlObjK+CNFBvnN9vUf/lJhVGoaRfuXG0FeZopzNp0Lj+yEKU7Fg7wmREqZiyi2INW5isOfu+Uw8rpJNNALf0WVTs1tjyS0g9JQxvTyIksdTtZ9TohlzD1PDqQZhm38l+Eba9gYve36uyOsMo/GUx2xaU/CjGPHs0dvPlLkgoQ0KGpYdNM9CXxgRlsZjSkudPw2so3DFkrzFjigm4rZ7J2PBr+Y4eo7PJYF/c4tLoe8f5sRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 18:30:06 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 18:30:06 +0000
From: "Sharma, Nishit" <nishit.sharma@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and loop
 size if provided
Thread-Topic: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and
 loop size if provided
Thread-Index: AQHcqxRKmEPmGPznW0OmR0hYvDnbyrWc6NAAgAAZA4CAAB8Hyg==
Date: Tue, 3 Mar 2026 18:30:06 +0000
Message-ID: <MW4PR11MB71517AAC82F5B65854175C2CE47FA@MW4PR11MB7151.namprd11.prod.outlook.com>
References: <20260303134706.41948-7-zbigniew.kempczynski@intel.com>
 <20260303134706.41948-10-zbigniew.kempczynski@intel.com>
 <f2f35e2a-37ed-44e8-a412-ea621c264876@intel.com>
 <20260303163715.txuyiva3dj4qorf7@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260303163715.txuyiva3dj4qorf7@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7151:EE_|LV8PR11MB8680:EE_
x-ms-office365-filtering-correlation-id: 71e51f53-1a29-4914-6e15-08de7952e4cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700021|8096899003|7053199007; 
x-microsoft-antispam-message-info: HN9+hxcwnOYUjpE9IzmG7eXc8ay/ELUrPv7G3aShKhJxlguYFf6zkK/z6T5iyyXU0fbNLquc3CUkN+oeD3Ay7IQb3+ltPWEfxknLm3OTpaGUT6Y8+J1QrApbRazhJd7NbvyLfMVxjrBvgAEmQwvitio0I0CDgEL1Uv6OLGkhumn1FXkcb7K+rHxFnBiWBSouL+8hQ+ev303CKA/f34fdRLgs5aCxMsHsq9i/eOmV4wxOqpP1x/Tej57VvrCQiezTi8GJaLkkGj6SIirLDPivrs5wxeF144YTrmeIZZr08ySzxX6j5JXX3qgE3OvN7BzUGgR9JDXqgZOov65SGnzUPoRQ9BqlmZPICiggEvn89mnDY2EUKGNq/rTtbmhHaWwvFsVq+seQwj+nm2kIv8AGyyhxv3ggs/hLeC71MDb9kEE3xYK0wlSTnld2giD1IOzlhpCeLKN6pke6n1XKjIty8puW9Q5opTt5byVEjrPryZ9vFJ0kAWecw/FCIM1UA7PoZ409mPtzBX17SmDN+LsxfXlZ8VMSDMt1nnpoYCAMvktq7PtEdRuF4EGLYNFzys19jS3yIUGepRaZGuG2PL0FiLbbzGLESdGkGGm+hhzKs1nmWUFFtZZyjVpx16XK+eDLp0l4njXU8iAWz+Eej6qcWuMYCFXq6kf0QABHkS8q1OYNDxMaYS8nWs9ieSI+OfGn2nFrsEKqkIoTZqJIEfVxSjod/LdV8EJuSpc9PV7J1ytZfkdlSvFizggRS3EVkKdQF4jePVqa4qRE8Wno4AJBjl7D7NuEJkLQgv7QNNtslUw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021)(8096899003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?LC3gCVaOZh5+Ak/fOLuZtll7cVTXQkSVN3miBVdG/B1VVR2lv1yRVxzKGG?=
 =?iso-8859-2?Q?uBurA4hwGG7TtiWDxc7Fc53ZE6WzTdeV9zmEj249dehBB61V//+yYZZyrP?=
 =?iso-8859-2?Q?8+OJ1LPFr8B6R/jvjHGIZ4sfwH9Texf2WdnAZGdbqAV+pay16IuFv6Fo/A?=
 =?iso-8859-2?Q?VRXHycGnKqu0gqq7uTZlhsUxayi59g/8MmMLMVKJbaOxs5vmcng44xr0FV?=
 =?iso-8859-2?Q?6T9KrIcIPPmugXckCQo0kzwqMZMJfJXjgw7MOaznn/s7Lmk79/X2ZYhUrp?=
 =?iso-8859-2?Q?j8gGN2zybbqo+4f4Cov2dbtCv1mAQCsiGI8TFcEFpuCN/ZEH161i1ceWuD?=
 =?iso-8859-2?Q?eTAQz4ogAOi/goa/y6WPbGZz0tfzP0PtBievYUC1jRUritSZ2T+NO8in6y?=
 =?iso-8859-2?Q?QpQ+7muAnviv56SVcx3J333c8AKlh1v2f+a+6289KXi6h/rL6OShd9xh/v?=
 =?iso-8859-2?Q?aeMgpfjAMIRkveQNDRcrsqgEARADn3hYJmkXDBjEH/gSApUj3XsIgF3j70?=
 =?iso-8859-2?Q?VmaxiqYAUrZ/1SVvws4embkSXFUEGisjSx92Z09BVdl2wOkvn+9y+vx21d?=
 =?iso-8859-2?Q?Xo629rwgCa8fYHoX3PwsN3uW1hUZPIoOlJtTDETI31v8qdVcM7rgnEf7R5?=
 =?iso-8859-2?Q?+BLRTraxegBub0VJTktMQYBNWgUsH7M1mxChgJesQBzGzdNMHKgDgaojwB?=
 =?iso-8859-2?Q?1ZEbrrYPXbDWTJ1ecbhPOeesoT1JFFs4QPmR2+TRVft0rOm/itH6PZLhKF?=
 =?iso-8859-2?Q?rXu84hEPisQbdBjLtmzmOtQHcOowpNF2or2zAh4nGJBhnOYl1sU8ouYjuR?=
 =?iso-8859-2?Q?U1cG+1g9yvZqVasrl0Co1zVAVqBPz/9oKaXeya21WAwiupfCj2i9yx12jU?=
 =?iso-8859-2?Q?4KQ31rNo3ieE7ClJtfJUjhXZmVRBNH+wwx8sRk+6td05dU8rlML+44JIh6?=
 =?iso-8859-2?Q?UUIoWhdWl8CC3aZiej3biscXEZRtbKhT45LMWwSzZzN1SODMb0d9qRz1lX?=
 =?iso-8859-2?Q?GYBYWkbs2M9xGK1yxsyPdfoiaHdimjm24bfm9xYxQG0SOzGN6izZFVnbfq?=
 =?iso-8859-2?Q?1qOXz64d62TzUejJ2+iZt/TkEwnoyg9+7u8+TloTUoR0BHJNl/IlNLRtPY?=
 =?iso-8859-2?Q?fPlLZcEGChwJ3PTxYHnWewwKVvYsXgHJpbat0rAHI8nhjl8Smh6i5mKW3T?=
 =?iso-8859-2?Q?MkB257iNt6RRpaqouYiYWAtORcFpKZxiv/MvQdcJftbqditTYrXcCVw5VL?=
 =?iso-8859-2?Q?2sfV1+TQ3zyvFx1g70ZsNyAH4AOk7AllGygTskOIQi/h3K/vfODqbF7NDz?=
 =?iso-8859-2?Q?0pz8ohmdQYL9PQ7DpUBglK/B7w+XmM3gTjcT4wSE0D9OWCq7ip2cOrZEOQ?=
 =?iso-8859-2?Q?Wl6/qVsfSgKmytr97dsazonkTXCW8BRzgjPC+hrivN7cyNe2A3rsnzWxXr?=
 =?iso-8859-2?Q?jxIh2xoVOHK5+fEndnhkFY7JBrOOfbFoLjKIT/hQ5AjWa4yvrNenvAB9ra?=
 =?iso-8859-2?Q?t/fOho2ABGl0cW+8jOEF2Zs+0UbPYFMeh3M7fw44SLbz1l6tOyzodoIWO1?=
 =?iso-8859-2?Q?muI0u1YDKBcszwsn0baVNsl8MXI3h0bXKAMz+8Y4u6nSjSMgn9FnHA/tjp?=
 =?iso-8859-2?Q?lC0tUhfSt3dnr16HFjNnOfzceiXz7iSsI4ZTZvFW1yhGGEI/EWi2jZXCQV?=
 =?iso-8859-2?Q?qWfqkSWmbEcbt9ibP+YKrkfCZoAhIcbpwHm3xz3Hw4hNzj3rxlRNzD8qzW?=
 =?iso-8859-2?Q?ToK8WloGZrwgWulv3KLVWaz4dURkzygVNR2Kp8PT1+7F/paqclM8S3LF2Y?=
 =?iso-8859-2?Q?T836YlTZomOc1lRx5kfjVptgRgFMIgY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR11MB71517AAC82F5B65854175C2CE47FAMW4PR11MB7151namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uugfJWSwnq47Ks8PPb8azHO8iX3wI9+GaKJOVOH/lLvVdQbQMievxiICThxWDvgHifJWxLBgp8Rz7bTkxJe9ZZJeIBuOswEdrsJaNCso04/o97K058qJ/D5qCLhLknlayoi6iWypVOBKukTUQs9xaosFkc/QAvteW3ZfegtFm9TmxeGa4sRnNCycg/lfVjVE8qNc+znqcs2NBHWFXJgwaCSsFD9Tfb/5Sblt5LIdHoHclGglztKd4bOML+7c+AjmTQUkGCaz4IcRCfe5srytkt9NjzC7QB2DnQt2qWiqteYBvpga23S5+cAUQEIXW990ruRa8KF7ZpdrXIEFsGOpnw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e51f53-1a29-4914-6e15-08de7952e4cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2026 18:30:06.5513 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w52hta/A3n/00nSqsTxKa71ZdQAqW8aak9dxPkPZwYnwHiSoJTWbAh42P61alcScdKJXqBjB1zAC7U82G75slg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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

--_000_MW4PR11MB71517AAC82F5B65854175C2CE47FAMW4PR11MB7151namp_
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

Hi Kamil,

The patch is related to lib changes so singke patch is fine. Depends upon Z=
bigniew if he wants to take description or let it as it is.

Regards
Nishit

________________________________
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Sent: Tuesday, March 3, 2026 10:07 PM
To: Sharma, Nishit <nishit.sharma@intel.com>
Cc: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>; igt-dev@lists.f=
reedesktop.org <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user offsets and l=
oop size if provided

Hi Nishit,
On 2026-03-03 at 20:37:44 +0530, Sharma, Nishit wrote:
>
> On 3/3/2026 7:17 PM, Zbigniew Kempczy=F1ski wrote:
> > If user passes its own input/output or number of iterations start
> > to use it instead of hardcoded ones. This pattern was already used
> > in other pipelines and only Xe3p missed this.
> Small Nitpick: Description
>
> lib/intel_compute: Improve Xe3p pipeline flexibility by allowing
> user-provided input/output buffers and iteration count

lib/intel_compute: Improve Xe3p pipeline flexibility by allowing user-provi=
ded input/output buffers and iteration count

This subject is too long, it should be short, up to 65 chars, sometimes
it could be more. What you proposed above is 119 chars.

Hmm, it could be two patches, one for addresses, another for loop
count, no strong opinion here. I prefer it in one piece but if you
wish it separated, it could be.

Regards,
Kamil

>
> This updates Xe3P compute pipeline to use user-supplied input and output
> buffer addresses as well as user-defined iterations/loop count
>
> when provided. Previously, pipeline used hardcoded buffer addresses and
> iteration counts and ignored user overrides. With this change
>
> Xe3P correctly used user-supplied buffers and counts.
>
> Otherwise LGTM
>
> Acked-by: Nishit Sharma <nishit.sharma@intel.com>
>
> > Signed-off-by: Zbigniew Kempczy=F1ski <zbigniew.kempczynski@intel.com>
> > Cc: Nishit Sharma <nishit.sharma@intel.com>
> > ---
> >   lib/intel_compute.c | 6 ++++--
> >   1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> > index 1165bdafd9..bfe0a75a7c 100644
> > --- a/lib/intel_compute.c
> > +++ b/lib/intel_compute.c
> > @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const unsig=
ned char *kernel,
> >      struct inline_data idata =3D {};
> >      struct bo_execenv execenv;
> >      float *input_data, *output_data;
> > +   uint64_t bind_input_addr =3D (user && user->input_addr) ? user->inp=
ut_addr : ADDR_INPUT;
> > +   uint64_t bind_output_addr =3D (user && user->output_addr) ? user->o=
utput_addr : ADDR_OUTPUT;
> >      uint64_t indirect_addr =3D ADDR_GENERAL_STATE_BASE + OFFSET_INDIRE=
CT_DATA_START;
> >      int entries =3D ARRAY_SIZE(bo_dict);
> >      int64_t timeout_one_ns =3D 1;
> > @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const unsig=
ned char *kernel,
> >      memcpy(bo_dict[0].data, kernel, size);
> >      memset(bo_dict[1].data, 0, 4096);
> > -   xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> > +   xe3p_create_indirect_data(bo_dict[1].data, bind_input_addr, bind_ou=
tput_addr,
> >                                execenv.loop_count);
> >      idata.xe3p.indirect_addr_lo =3D indirect_addr;
> >      idata.xe3p.indirect_addr_hi =3D indirect_addr >> 32;
> > @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const unsig=
ned char *kernel,
> >      }
> >      if (!user || (user && !user->skip_results_check))
> > -           bo_check_square(input_data, output_data, execenv.array_size=
);
> > +           bo_check_square(input_data, output_data, execenv.loop_count=
);
> >      bo_execenv_unbind(&execenv, bo_dict, entries);
> >      bo_execenv_destroy(&execenv);

--_000_MW4PR11MB71517AAC82F5B65854175C2CE47FAMW4PR11MB7151namp_
Content-Type: text/html; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
2">
</head>
<body>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Hi Kamil,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
The patch is related to lib changes so singke patch is fine. Depends upon Z=
bigniew if he wants to take description or let it as it is.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Regards</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Nishit</div>
<div id=3D"ms-outlook-mobile-body-separator-line" data-applydefaultfontstyl=
es=3D"true" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system=
, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;" dir=3D"ltr">
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt;">
<br>
</div>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt;" id=3D"ms-outlook-mobile-=
signature" dir=3D"ltr">
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;Kamil Konieczny &lt;kamil.konieczny@linux.in=
tel.com&gt;<br>
<b>Sent:</b>&nbsp;Tuesday, March 3, 2026 10:07 PM<br>
<b>To:</b>&nbsp;Sharma, Nishit &lt;nishit.sharma@intel.com&gt;<br>
<b>Cc:</b>&nbsp;Kempczynski, Zbigniew &lt;zbigniew.kempczynski@intel.com&gt=
;; igt-dev@lists.freedesktop.org &lt;igt-dev@lists.freedesktop.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH i-g-t v4 3/5] lib/intel_compute: Use user o=
ffsets and loop size if provided</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">Hi Nishit,<br>
On 2026-03-03 at 20:37:44 +0530, Sharma, Nishit wrote:<br>
&gt;<br>
&gt; On 3/3/2026 7:17 PM, Zbigniew Kempczy=F1ski wrote:<br>
&gt; &gt; If user passes its own input/output or number of iterations start=
<br>
&gt; &gt; to use it instead of hardcoded ones. This pattern was already use=
d<br>
&gt; &gt; in other pipelines and only Xe3p missed this.<br>
&gt; Small Nitpick: Description<br>
&gt;<br>
&gt; lib/intel_compute: Improve Xe3p pipeline flexibility by allowing<br>
&gt; user-provided input/output buffers and iteration count<br>
<br>
lib/intel_compute: Improve Xe3p pipeline flexibility by allowing user-provi=
ded input/output buffers and iteration count<br>
<br>
This subject is too long, it should be short, up to 65 chars, sometimes<br>
it could be more. What you proposed above is 119 chars.<br>
<br>
Hmm, it could be two patches, one for addresses, another for loop<br>
count, no strong opinion here. I prefer it in one piece but if you<br>
wish it separated, it could be.<br>
<br>
Regards,<br>
Kamil<br>
<br>
&gt;<br>
&gt; This updates Xe3P compute pipeline to use user-supplied input and outp=
ut<br>
&gt; buffer addresses as well as user-defined iterations/loop count<br>
&gt;<br>
&gt; when provided. Previously, pipeline used hardcoded buffer addresses an=
d<br>
&gt; iteration counts and ignored user overrides. With this change<br>
&gt;<br>
&gt; Xe3P correctly used user-supplied buffers and counts.<br>
&gt;<br>
&gt; Otherwise LGTM<br>
&gt;<br>
&gt; Acked-by: Nishit Sharma &lt;nishit.sharma@intel.com&gt;<br>
&gt;<br>
&gt; &gt; Signed-off-by: Zbigniew Kempczy=F1ski &lt;zbigniew.kempczynski@in=
tel.com&gt;<br>
&gt; &gt; Cc: Nishit Sharma &lt;nishit.sharma@intel.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp;&nbsp; lib/intel_compute.c | 6 ++++--<br>
&gt; &gt;&nbsp;&nbsp; 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/lib/intel_compute.c b/lib/intel_compute.c<br>
&gt; &gt; index 1165bdafd9..bfe0a75a7c 100644<br>
&gt; &gt; --- a/lib/intel_compute.c<br>
&gt; &gt; +++ b/lib/intel_compute.c<br>
&gt; &gt; @@ -2189,6 +2189,8 @@ static void xe3p_compute_exec(int fd, const=
 unsigned char *kernel,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct inline_data idata =3D {};<br=
>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct bo_execenv execenv;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; float *input_data, *output_data;<br=
>
&gt; &gt; +&nbsp;&nbsp; uint64_t bind_input_addr =3D (user &amp;&amp; user-=
&gt;input_addr) ? user-&gt;input_addr : ADDR_INPUT;<br>
&gt; &gt; +&nbsp;&nbsp; uint64_t bind_output_addr =3D (user &amp;&amp; user=
-&gt;output_addr) ? user-&gt;output_addr : ADDR_OUTPUT;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t indirect_addr =3D ADDR_GEN=
ERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int entries =3D ARRAY_SIZE(bo_dict)=
;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int64_t timeout_one_ns =3D 1;<br>
&gt; &gt; @@ -2205,7 +2207,7 @@ static void xe3p_compute_exec(int fd, const=
 unsigned char *kernel,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memcpy(bo_dict[0].data, kernel, siz=
e);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(bo_dict[1].data, 0, 4096);<b=
r>
&gt; &gt; -&nbsp;&nbsp; xe3p_create_indirect_data(bo_dict[1].data, ADDR_INP=
UT, ADDR_OUTPUT,<br>
&gt; &gt; +&nbsp;&nbsp; xe3p_create_indirect_data(bo_dict[1].data, bind_inp=
ut_addr, bind_output_addr,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; execenv.loop_count);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idata.xe3p.indirect_addr_lo =3D ind=
irect_addr;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; idata.xe3p.indirect_addr_hi =3D ind=
irect_addr &gt;&gt; 32;<br>
&gt; &gt; @@ -2233,7 +2235,7 @@ static void xe3p_compute_exec(int fd, const=
 unsigned char *kernel,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!user || (user &amp;&amp; !user=
-&gt;skip_results_check))<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_=
check_square(input_data, output_data, execenv.array_size);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_=
check_square(input_data, output_data, execenv.loop_count);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_execenv_unbind(&amp;execenv, bo_=
dict, entries);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_execenv_destroy(&amp;execenv);<b=
r>
</div>
</div>
</div>
</body>
</html>

--_000_MW4PR11MB71517AAC82F5B65854175C2CE47FAMW4PR11MB7151namp_--
