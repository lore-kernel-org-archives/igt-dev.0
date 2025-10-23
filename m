Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0472CCD193
	for <igt-dev@archiver.kernel.org>; Thu, 23 Oct 2025 06:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A73210E093;
	Thu, 23 Oct 2025 06:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DM4M/OVO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D8D10E093
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Oct 2025 06:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761202262; x=1792738262;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XCf371Nv7LUcEOoGRrz3eNRhJHVaq9uWcgFk6A/LbCM=;
 b=DM4M/OVORubCSw6LJTGWOPzxosZ4uq8VjkCxcSq2QcV4UwXf2CGjmdgW
 of8FVfJmiq9aLFqJDzRoYSM/dwdH1KWZC5WV8eX+Htnjd+0qPv2bjEwOI
 iUmmvVIcmqpLO1HZn5mI1MyUbD6CrC18Apl9TS/H7ne49SgWUg5rt9kBx
 PRQQEIG/Aj6ktBabdLaGpcyUzmWWkCSWZ2xNo1qXzTH94l32DdXVHb+zT
 aQ3Wq6CiiH7P8Xd3ETQwEZsEtKYag/Qxp7iOCP7cCQBtvSkfJXOyKXVMv
 EfRLn44/Eq4+8Z/ACshxQ9NRROOASRQmdKfT+oFDXIs2I2GVt7qJyjZ16 Q==;
X-CSE-ConnectionGUID: Sxi6oJ2FTKmu+W54EbZoZg==
X-CSE-MsgGUID: gWvjiWO1Qz64DrhSEITESg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80798370"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="80798370"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:51:02 -0700
X-CSE-ConnectionGUID: Jko3iu4+S2axDWOVHNY8rA==
X-CSE-MsgGUID: /TYA2mGEQaWkHmj0Djrn0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="215006174"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:51:01 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:51:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:51:01 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:51:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iAgUJ1Moz6AxHkL3m+MR5zMP2IzSuqbpHQsRCyYwh7jl/l4t71OOiGFv9DAcsOLb7MZWdCoQyvy02iFUuuIfCIXSVgpXyWKeKcMoMH+GFvmPfjloUeyVoRN2Svx19kOKEAmAD9irZc/vRI1YB+XsTjI7t6ufn5/USg3kxO+FnnLKZLpKHiWC5Mr4xCf+KhE/eSfGNHiC5fDbjSMfgPnMoNFtsrxTSe8G8gv6wVr3Xw8NBAJDWvVEZU3SguavIEB2lDuQfEx6DZlm5R2rHAGuXrZRU7LB1RKiNsP4uN7lukaLwohVWmfHT4p4EbH2PuFAR4KyCx75ABjf0giHY0REBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OtfQuBEgf/keV44mvxjdy0jyyILS58rgwO15cNZRtHo=;
 b=HRgh+ZHfoGNwD9ejLWJc4DqK2qssFrmLBL/4FLWS55oDxaLhPYtvf9aO3i4RmNbBDIwcM6ZMBJjOy/qLxQN9AgQsawuruu4vMexcjMDr+o5Q0Hb6HmlBaqmDXF4f+12BPwgooR1gm/rwLO5kctLdT9mv0WupWgubuO93GF24sCzWmJa6eI+JM+Mz8maSDNWw5P3iGJ+zQFYUukkc16i8YjaaNFAgYoO6c2l4d8mSFsGJHPxXBxCY4GBT/TgtoliQPvozkEOJcqOaUK8UAdc6YwMwgoAjQ/9oHSp5nCON2o2vbRyebDiIN0UXO7fLlLO47bn0zeLltlrgoWhDysvVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.12; Thu, 23 Oct 2025 06:50:59 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:50:58 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: RE: [PATCH i-g-t v6 1/2] lib/intel_allocator: Add SYSVIPC support
 check
Thread-Topic: [PATCH i-g-t v6 1/2] lib/intel_allocator: Add SYSVIPC support
 check
Thread-Index: AQHcPpMn9i0/dxJKv0+0ijr5m2tv7bTMktaAgALBZDA=
Date: Thu, 23 Oct 2025 06:50:58 +0000
Message-ID: <CH0PR11MB5427C3121E2D9414B3E2505E98F0A@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20251016113816.3343875-1-s.sebinraj@intel.com>
 <20251016113816.3343875-2-s.sebinraj@intel.com>
 <ops27gccapwj4yr2xkhc24fvzoibhw4vvakjoyt5ajidw6ywu7@lxltd2tkr3ck>
In-Reply-To: <ops27gccapwj4yr2xkhc24fvzoibhw4vvakjoyt5ajidw6ywu7@lxltd2tkr3ck>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|DM4PR11MB6454:EE_
x-ms-office365-filtering-correlation-id: 87b0d072-d798-4cd9-37ed-08de120085df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Lqdw1/l8S+R8SArmrgfE88YMcM/2AhAoMVQ0jZtnsxsCA9alFNYH3AGo2UGd?=
 =?us-ascii?Q?dj/+oSjgDPbofc084YndzkqhrJW8hjSL1HfGXByQ9JbbSc0rw2bA7DjhXlJK?=
 =?us-ascii?Q?C1Rhfde6xuAP/KUK6ZQCqg5cmXL8EOZ+t+AuCUirkL368lNCsJLLJv/uxohN?=
 =?us-ascii?Q?lrRO0MTUcwSiZO7gPKFPKqwiVw4B6aUzYpCV10ZhAJ8t/gIquFOQsSDExIH8?=
 =?us-ascii?Q?X8v5SCP/+BuhsCB3SqquqANHdkeKxhzT2Rixo29CVVZHMEAOf45X1xIldvA9?=
 =?us-ascii?Q?YZCPGmOoUDixnc7je1aRBxGv2wDAZPuklib6Ubn8rWJVi0KZfEpQvcqbEnKt?=
 =?us-ascii?Q?mOBuzDfSe7iKNUJ/uyWfQgKpPye6ZvM4zQXX4D84ikxYqqVtSiWywYVcPouo?=
 =?us-ascii?Q?uDpVgmlOPo4inuNuZJnFOhfQM64e2vJYi2nFe+eTdbqfAYpvUKrWjaFvq6CC?=
 =?us-ascii?Q?qNkkrJb73sxFtVv2oe6eaVV9oMmwPlnwRF2B+kcbjjU8sVvaJMfCoiIc2zpR?=
 =?us-ascii?Q?MOdZzDEI3XdpS3vTmOc51jjV79ZWTEoSHRTndkgGwrJ8+O+Vi78muh9U0v5p?=
 =?us-ascii?Q?Fi1x9rdmtzLyMOs0YDtKyWrCu/BJBKODpgZccHyS80NyfH/mnAAT3ttOm5IB?=
 =?us-ascii?Q?CJnV/PETrIzRvtCJ3q7GZIEv9ILObIpnMmYLS9jAWT2VY8gd7XlWp3cFBz1J?=
 =?us-ascii?Q?Se6Oj50VACobQ/mKuAJYt9qaWtb2kXTBhfqNkD7Xq5EOPMONCjqj0mRdKSXa?=
 =?us-ascii?Q?q24JCnHFVhYTYvdo46GOih8DevW4wtPwZWauQoJuqi6jh2PBFtEf6V8DRshv?=
 =?us-ascii?Q?bcO4Q8o6S2flDT6cokXxo6x123jeVfOEy/9ZO/TtHqB06OXnvQ+bdW00Ff6A?=
 =?us-ascii?Q?xwZ4u+0RgVszsEqy9atTW70RAkKtIwnnW7lBf001GJnDkhg+s40ooBOzljHn?=
 =?us-ascii?Q?KtKeUiM57vfSg5YoH7Ajf5AWM0eQ7zFZzfv9i+DgQ0GrBp1cJBiTy3seCUn5?=
 =?us-ascii?Q?z7whsGZwiaSklDagRptn4vTYaYPrcGvqvwwphFsAY10n41XEomYwG09uyVEM?=
 =?us-ascii?Q?Ppq/ptj2zAxR4+w6wad78bkYYf3A5DYgt13tc16zPixjEKp0Q9sJH5IwGSJF?=
 =?us-ascii?Q?1vWfR7neCZC3a/dAY+qVIW5P/6hr7e0G1bUfHShjzsslLGh2KCBv9MJm0t6p?=
 =?us-ascii?Q?e41UaWMT+B/+rrq8rNmx+1LszQMnCtA8JAECyi6FvDMC36TQDDRibMbu9TVd?=
 =?us-ascii?Q?EQKiSRzqTd+pcaCNyh2xBaKIUF0fnmffHILpukfsHB01l7ABhR1THe47hnLx?=
 =?us-ascii?Q?klOvasFRRJ+ssEy5R1OKbv8TLsbDuL8tPLKik+ypkfaI2ee0e6I1syRx77ai?=
 =?us-ascii?Q?M3aDUoTBl+XQ5bUFaVgeVexwMsqQTbk6sL2VQbjAZpyNhjXxRicaIPe/BrJ6?=
 =?us-ascii?Q?kF71RANl77feDRjgaCdwY0v16GSmMfxCC7qkAtNlRA1Y+bSCmxtWlSisCiTB?=
 =?us-ascii?Q?hQhLlLJOVIg2Lzh572wVdVLQSj3v4NEvzFlG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QP+3xWFvyeQBVf1LhVWpt/u86P4NyAm41XkdJnoWdJcTx23RbAqLK05M0xZU?=
 =?us-ascii?Q?oa+XKxtMe3WGagFwWoSn/juXDnGm0QLgwTqG/UKIEPUqW2rRuPWzOF40RQRN?=
 =?us-ascii?Q?azBE8t4DNjI/9t/i+JnspJyCbnPZLH4I3ur6mAKUM6ksrQErCprIq+VmScof?=
 =?us-ascii?Q?bwAFVB7axq2xVNDUwbu/RSG2X0NSpnLFx8BYwQxGZWuf8bzSfNWDyzS0G+8W?=
 =?us-ascii?Q?lSPYafW2kWvGXCg0rdbAahfmkWCgB+Qvy6fhvEZQi3GKW13+pfnikBOXwhFC?=
 =?us-ascii?Q?Bsjxii5GIKAk78loTc9mu6AMinMBhNkQBat6OAOgXzOpOFYDe5/EdRv4mB/a?=
 =?us-ascii?Q?6TWw3DE9d6AEsKA1fhFkr92uhWtS6pUsKB2YY8M3HxWFEMp8vFwnR0dzbqZJ?=
 =?us-ascii?Q?0oPGfouQi66o/PYput3VPqlHQ+br6mLIEC9whB9iPihCY4PLVd6H28zrKzwF?=
 =?us-ascii?Q?rUnJCU8Gm0kt5NlC7Azbv00pYGUCX59Rw8ShHiKpvYXxTcuYyGC1ApYYZUW9?=
 =?us-ascii?Q?DGeO5wO8F4oPeFef9Oqr5kh/pv85JZ/dlbZC+YFn/VrmP1mT6d90Wbn9wXCr?=
 =?us-ascii?Q?ng9Sq20Fd5FR59dED53TMllmyfg2ta3yHm9IN5WdZuRrBguBfZO/0vaZYvAo?=
 =?us-ascii?Q?ohCh1FoTgi3Hk7WeGfpdyY9E1WSyoFmF8GgB12EUfZ/9aFBmTfZvUvLjAJnM?=
 =?us-ascii?Q?b2AyrzIx/o9iitnm1+yNoFB+DUxskmBX6+pi5H/CaSq7xTHLw5jAlBwFuWL0?=
 =?us-ascii?Q?wq2zlNzuNgWG+cW8y1toAhds3UkPDCHDd7oT56fcoTvHq8HGiwsPhjrfQXjJ?=
 =?us-ascii?Q?CYS9cBqnUMXY5wA41p5QJMn1M1pyw95G6Ojsv+kSKxVMJsxoNbVxCYDz9mR6?=
 =?us-ascii?Q?vD2DFsH5urRi0jwTRNi9qZqGxlUuK3qAHKnL15AQT7Iy6trjJMbwM7ImWYMe?=
 =?us-ascii?Q?HmPxvgqDVgFpryC/n56lIODB7UyXqiP6Wp1c50t7WomXvcEThrPqHeM1l8/i?=
 =?us-ascii?Q?yiW7SrMW7ct93WzbEj519U2BeezZaEx9xDW8i4S7BapCYs9uL8rKMxdzcz9T?=
 =?us-ascii?Q?y3V7trso7wLFykek1ir67QLBhXGXOq0nVii+kzLWVXgEP21dssE0WBzk2nD3?=
 =?us-ascii?Q?sWftYyq4scWGI44PcnbfBsOGREKU6qkiqONsw/szL1DeovUe2KSkdoChAZiM?=
 =?us-ascii?Q?+rK6ST4UcHdUMWSv0WlhAJvloZ4tp3NC1/nGnLE1Dxx+W4VRcRP/JroIDbtE?=
 =?us-ascii?Q?LSkYJIFgVl52qufbm+8cScvFA8Hb2xPWpWexW5AOFgOkmKv+z8mgt1crypZT?=
 =?us-ascii?Q?NdlG4SoTK5tnfce40MTv2f7hnFTUtN9+9ULawKFu5Z5Xlm96WqrWCzWtd1aT?=
 =?us-ascii?Q?cBONH9A3BBxeMCz82X8R3Aq23oidst/n28ARK9HBp7I23c96C7HeIjuGChFY?=
 =?us-ascii?Q?w2Fuxa1OO1r9kb97GjDhuMg1YYocOtXF3ieGmibvAxbVl5VC291KbKHOGmOi?=
 =?us-ascii?Q?93f53Vmd5BxJKDEcKFbRmLqpv0A/8m/7JfjmoDht294LtB1A7JSelVXAj3Hu?=
 =?us-ascii?Q?Jn8yvZ9xqDgsbki6Fi2cdpLXw4nwePywZI28HCfo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b0d072-d798-4cd9-37ed-08de120085df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:50:58.8176 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 77G8FS1RhuFgWZApcHXhQouvjZ6XkSaPj3zMa2J0MI9btSFJFieEJ6U9E8YDQd9m4c8OMwxAUaR+bDi9FLwUsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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



-----Original Message-----
From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>=20
Sent: 21 October 2025 18:11
To: Sebinraj, S <s.sebinraj@intel.com>
Cc: igt-dev@lists.freedesktop.org; Badrappan, Jeevaka <jeevaka.badrappan@in=
tel.com>; Konieczny, Kamil <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v6 1/2] lib/intel_allocator: Add SYSVIPC support =
check

On Thu, Oct 16, 2025 at 05:08:15PM +0530, S Sebinraj wrote:
> Check for System V IPC support in kms_concurrent test to handle=20
> targets that don't have SYSVIPC enabled in their kernel. Without this=20
> check, the test would fail with assertion errors when trying to use=20
> message queues.
>=20
> Signed-off-by: S Sebinraj <s.sebinraj@intel.com>
> ---
>  lib/intel_allocator.c | 23 ++++++++++++++++++++++- =20
> lib/intel_allocator.h |  2 +-
>  2 files changed, 23 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/intel_allocator.c b/lib/intel_allocator.c index=20
> d22c70f1f..7508d1788 100644
> --- a/lib/intel_allocator.c
> +++ b/lib/intel_allocator.c
> @@ -250,6 +250,20 @@ static struct allocator *__allocator_find(int fd, ui=
nt32_t ctx, uint32_t vm)
>  	return igt_map_search(map, &al);
>  }
> =20
> +/**
> + * Checks if the current system supports SYSVIPC by verifying the=20
> +existence and accessibility
> + * of the /proc/sysvipc directory.
> + * Returns: true if accessible for read and write, false otherwise.
> + */
> +static bool system_supports_sysvipc(void) {
> +	if (access("/proc/sysvipc", R_OK | W_OK) =3D=3D 0)
> +		return true;
> +
> +	alloc_debug("SYSVIPC not supported, cannot access /proc/sysvipc\n");
> +	return false;
> +}

> If you have interprocess communication you can add new channel for it.

Hi,
This is an Api to check for multiprocess support. I guess for that already =
exists a channel (message_queue)  =20

Regards,
Sebin

> +
>  static struct allocator *__allocator_find_by_handle(uint64_t handle) =20
> {
>  	struct handle_entry *h, he =3D { .handle =3D handle }; @@ -839,14=20
> +853,21 @@ void __intel_allocator_multiprocess_start(void)
>   *
>   * Note. This destroys all previously created allocators and theirs cont=
ent.
>   */
> -void intel_allocator_multiprocess_start(void)
> +bool intel_allocator_multiprocess_start(void)
>  {
>  	alloc_info("allocator multiprocess start\n");
> =20
> +	if (!system_supports_sysvipc()) {
> +		igt_warn("System does not support SYSVIPC, multiprocess not supported\=
n");
> +		return false;
> +	}
> +
>  	igt_assert_f(child_pid =3D=3D -1,
>  		     "Allocator thread can be spawned only in main IGT process\n");
>  	__intel_allocator_multiprocess_prepare();
>  	__intel_allocator_multiprocess_start();

> But if you need to block I would change void -> bool in
> __intel_allocator_multiprocess_prepare() and return false if there's no c=
hannel. Then propagate this to bool intel_allocator_multiprocess_start().
> This requires changing intel_allocator_init() and set channel to NULL whe=
n there's no SYSVIPC. This way you can easily skip
> api_intel_allocator.c:fork_simple_stress() test as well.

> --
> Zbigniew

Okay got it, I'll change accordingly to suite the fork_simple_stress test a=
s well.

Regards,
Sebin

> +
> +	return true;
>  }
> =20
>  /**
> diff --git a/lib/intel_allocator.h b/lib/intel_allocator.h index=20
> 4b6292f06..46e3429d9 100644
> --- a/lib/intel_allocator.h
> +++ b/lib/intel_allocator.h
> @@ -166,7 +166,7 @@ struct intel_allocator {  void=20
> intel_allocator_init(void);  void=20
> __intel_allocator_multiprocess_prepare(void);
>  void __intel_allocator_multiprocess_start(void);
> -void intel_allocator_multiprocess_start(void);
> +bool intel_allocator_multiprocess_start(void);
>  void intel_allocator_multiprocess_stop(void);
> =20
>  uint64_t intel_allocator_open(int fd, uint32_t ctx, uint8_t=20
> allocator_type);
> --
> 2.43.0
>=20
