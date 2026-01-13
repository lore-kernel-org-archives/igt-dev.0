Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9BFD2D10A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:36:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FECF10E2B9;
	Tue, 13 Jan 2026 14:36:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3p9rRmT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9610E2B9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768315007; x=1799851007;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gxxjLTLkisG3Jfajd6JHWWXbcs5EGgSme+kAKr1npdA=;
 b=O3p9rRmTIutgu59q2tuIKAf79geyhxgU44ftPziTROGC7EJkvRqzaz7l
 3LqqV86JGMLlEFBoYkTCkmMlI8KU3HtcBb1f88D4YQurU8F/CC6GFFj4y
 MktMjOo4eotholBQ4m02cAttFZzFX+gMn1Ip7XYJHqlL/RckANeGyrVc9
 2YU1/Tpsa+xQfZbVjDHc/l7se4DdkQnPi+yRtDxlTRDUfH5TXRO4Sk0Re
 FG5QqCIcKLY+YAKVuE5wCKbQGXWrNrPMiYGBrhnLTJ2PgPPMTG/3uTL1m
 cSuV6KBSb0virTeL61otGed811l+7URVzBhPDcnrs9CqoY0dWxFK+HaRT A==;
X-CSE-ConnectionGUID: Rrxy0xiNQpaHdyQOXrNtsw==
X-CSE-MsgGUID: VMOUPWzeRJGHeE2QPSdyxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73455622"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73455622"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:36:47 -0800
X-CSE-ConnectionGUID: +aBiRen+Q4q/3Mx8r7D7aQ==
X-CSE-MsgGUID: xHOsndiDQqWzCwZ51rstDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="235111914"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:36:46 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 06:36:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 06:36:45 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 06:36:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeEWsC7OkkBFUUeWF+baYE5tr4UBdTwol9CORzpWVyw2CcosO6gCJiNjg2zSlPKdMcOTYxo2tcHO4Ci50Q9Y/FMj/LuZWcNhs1Pz+0w2rWsSpugqxKWzwi0QzBATeP0R8hhl2xRRf45JUwL3k577BjzSt0Xc7ZadZO9SLW1j6GIlTxgTZgEGGgBJco7GmJmBYP8yRWlYP/tfU/K8KZ5fwM0exTPq0LDe2OkYsratKh2aIImBAL41hENYyzIWuAjlhGs4c1C5nrFz9LpKvAUVn8DPnz4PFrzgVD1vtSKALXYlUOmJQTa2NljrXcZBO7N+RUswpgDykt6e+bzWXBwzog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LqnhLdG7+ARKSM6CzfxErNOlGgCGbaUnrhTorI47dFw=;
 b=CtcFZPy2qm6fxux5yiVsWKW0L5f9S06Ktj2fEUAalzWvOy99nv+DA55QmECk7MWTiqQWCvsW1YBJii6zFcGj7l2rmcplBhziUX/w7mWYvqOk3mrdY1DRA3EdZYbzg/xh7/LcF1r7LjTsMST78qPBaI6B/G1HLsKoN6qt/fHxH08F3euuem6KZPJWuo7OAjelS3x0ghs44QwRxRsxjL4UtWw0ZJh7qFwSPQE17EWquLbJ5FmcoHckX4LaJm+NakJkVA5NsBFFfvl+3PHliTg0whLAhLUTC1TRTg2mo4PHWmr9Oisa887P4Y/S/KYLXFlmI1iTEogwGOW7pBS/y/Gdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by MW4PR11MB7127.namprd11.prod.outlook.com (2603:10b6:303:221::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:36:41 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::3e15:8d62:5e58:a513%5]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:36:41 +0000
From: "Samala, Pranay" <pranay.samala@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
Subject: RE: [PATCH v1 0/2] DC5 DPMS/PSR suspend/resume validation test
Thread-Topic: [PATCH v1 0/2] DC5 DPMS/PSR suspend/resume validation test
Thread-Index: AQHchJDzSj4cinLcxUaimXWwaqWwELVQKjiQ
Date: Tue, 13 Jan 2026 14:36:41 +0000
Message-ID: <PH7PR11MB6053818E666120B7FBD73578E78EA@PH7PR11MB6053.namprd11.prod.outlook.com>
References: <20260113132639.13411-1-mohammed.thasleem@intel.com>
In-Reply-To: <20260113132639.13411-1-mohammed.thasleem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6053:EE_|MW4PR11MB7127:EE_
x-ms-office365-filtering-correlation-id: 0fb5e464-ea9e-458e-1c9b-08de52b12ae5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lufEJ9UA1YViPLExbwK88TOwTsZinEZLP91XcTjI2wUdQDULScy2ln7LoiY0?=
 =?us-ascii?Q?IicztlpTv4ARtYS++8mXRd6Bd+U6wA5EFUit9sTx8R/dz8XBGRC5VQTtEuam?=
 =?us-ascii?Q?qiHJgjMtHoDrEuYjfpKSroeErcjnZ6BZ0zqR1bu0LeAXrRl4xcH6KvtH7Wmu?=
 =?us-ascii?Q?60s1WUcnYZeO4vzKVTn9I3Tn+sXtq+7dHlpHxj+IokZRCmSra7NVRNkjYoNd?=
 =?us-ascii?Q?6wgM8byHie7qjhRAP5PPIvQZFM0WWxD87j4Jvrf6VgL3Gu2Ky5eLv7MDa2Y0?=
 =?us-ascii?Q?s8UfYOp06FrqMfc2wXbW5MbJB7+cVnGOS57puGoXqo995vMykx77j0Zkn3KA?=
 =?us-ascii?Q?g0aN6OgAQsnnfxRCw1S0YEyLeen7mlndQTh3k7ucEM+jNPe4Mvup5i7phkvU?=
 =?us-ascii?Q?4FCUDIW8MFik5jPcy/OLeu+2hVDiSxgxAxzHvRKTtaFQj8SC0mx/3a2LO4A6?=
 =?us-ascii?Q?p6lySopquXfsbwIhiaC7JMtgvjRCnzi1MwEgnsa1c5DzzHBqTJdmNwbf1La0?=
 =?us-ascii?Q?44lBWCkHbqnFQBpgJj62s6TAxdN1QQNKpgxMDRV1vIeZJfRid2qQuePM8hi4?=
 =?us-ascii?Q?2MZGW9Pry7Y4t8bvof5uun3iuE1LGO3i8oCWCSfCNf7nJCCKn5otsIgpWM3K?=
 =?us-ascii?Q?Fd32VL+WA/Dl5UUJ0lbRPMnyZJMMX9vY7aNeVb7hNprvMP3M49DFUlV3+RR4?=
 =?us-ascii?Q?AZvRLJwhm4JIVycoi8C8gv3qyOYx2IiU+4aZJHbkP71XVH6ukitaDYBbju40?=
 =?us-ascii?Q?bLQiQsGP0guB8YHzuWhxBN6m/6jK/0rV3Qgd9AhUGoYSVLi/y1Qcp8u0haz+?=
 =?us-ascii?Q?YD2oHGj7VJisa7NNm+M2bDyGuhPdpGC3WtIEu0IlCEipWLoVqXsMFJyH1n5i?=
 =?us-ascii?Q?W+aeKJvvHz1Ui3IkOL9MozMkBz4I9Mep+O/lNzDfXCtKf0mcWxb1KkRA3MQT?=
 =?us-ascii?Q?yuzIHeV06RCS+RzjcRtLQF8pA/+DHLK+lrVsqmuAVL6WYK2o2SsD57fHxI4E?=
 =?us-ascii?Q?Nodf5SxQvPvMn4j+DlvRtPRfiKvLKRZed7UX7FO+yIXnISrSN8F1E72NEa74?=
 =?us-ascii?Q?TZEi7imNdoylsEeTZywuWGfCP9DMbF7EnDDN99AQANK9LWiFBCrPv+C3Dp39?=
 =?us-ascii?Q?lyH79DgsZHyM/7ED08yZvebfQW7Nuy2W/+sfYSdJgSutD2TZqjmwfAH+YInu?=
 =?us-ascii?Q?Owg4RSqPN3R9cn7MiSI+MBz1wVIt6eN51ZOIP/HcsCKckviWBcxUOZNYwnAe?=
 =?us-ascii?Q?a8HPYREpf899ILsM3ebAslPAYo/8fnMV30O0t+BpSfBiociyqpV02iVcb2tx?=
 =?us-ascii?Q?m54qGalx6JD1dT9jN5Nk49ow3W7yYicG25/Yi1Q6AZRLz3JE5e1nt99+O5hr?=
 =?us-ascii?Q?IsXiMfH/7aZpI+eDjq41hyGP7mhoKKurxLfSuSJP4ytTaQho6h4Jh9vWyaAi?=
 =?us-ascii?Q?xVgF5162BY+hs0SWr9mt8TB+r/eDg8kRUBI363ZmlJMunZfsxsBF65xGOl19?=
 =?us-ascii?Q?/er1Yn6YPcRPtH2o7HCibGYIyC/O7HkNyVLK?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8DBBGqJGmSM/YZBbVBW9V4TuroDXiBA2TlzJrnWAyFuQKPPAcMwrT6DNXA0Z?=
 =?us-ascii?Q?syZczfJnjGVpsKwyfjemGHLV3F3DbT7Pg1kWyUJHBt7XBY5uvmpEJdwTDEif?=
 =?us-ascii?Q?4hYzzWyOROJ09m3tGiOvkQ0x69IIXrbgZuiFauUksalnRpbJvQpbQD4Odxhf?=
 =?us-ascii?Q?Arfnf47DJfWvRf8ijQqW+mglQRkcV6ObPjg0Tbo1/MBkMnm3Cdm3CBscQxVl?=
 =?us-ascii?Q?HfcNP0nMS8z3ovRgdjiIwuUHGVhY6Vhow1WN8Y63/TBCU58/uaZIixyxCqsZ?=
 =?us-ascii?Q?6EZVSUs7g4TFxedWsxaOnbvSeE8+nUB3VJ9sUckluwCdhWfjLRYfu0Q4CcU6?=
 =?us-ascii?Q?vmKWllbYAlZhjJZURM6EKwrwN3/eHALR/sOagg3tjOZAMR27vm6FICwe89yc?=
 =?us-ascii?Q?cL1OsnF809FPBR+xEtvnNXiHhigsS2WQIBcM402FTRL++TCzvRkLORU8Dote?=
 =?us-ascii?Q?tAhgCrKi4A0DxZOgpRyGqbwaHa9zAifbvBjYhwM9KiZryzey4zAwphIVheBU?=
 =?us-ascii?Q?xM0e30cXRoDbbKUrDxVMe7bk4+xNMTbSbcS4UuimI9nyoG0SvRfTM4TdoVGk?=
 =?us-ascii?Q?UrouULotaGGmW+buh+14Jel/Ml4/pYr5L0IYWg5K/KWdpH//xAy6nFHFYMc6?=
 =?us-ascii?Q?1wBx+gjMDPC51IoFUQA+gbOkiBDHlD89eWibXD1uWKAK5H3bxw06x7z7Tz0I?=
 =?us-ascii?Q?9sbWw4P9Arao5C65mpvH9/aU4wvy48C/LQ1em+IlR9LSzo6Wv+fxSy44MWNd?=
 =?us-ascii?Q?8sD48QKOeGSc4QN8y72tvhIxysoyEqUJZGho4b/2A1PYoNBXW0KlbAhQi/aN?=
 =?us-ascii?Q?NEESZGqHDnptCl9CX7HuATdH/4YT7hRFb2XhuKiVSfkynz2Z+1jVz4bWTtas?=
 =?us-ascii?Q?gUpsL3GJFcjVO/eQfSguKSyEVaU8Zs+ipVU4OleudI8a+RKD3f2iTC6cV8dy?=
 =?us-ascii?Q?c6zt2VliOBmYxATZEnJBvmSJySbAmE+FXwgm0RX+d7gM3zWtbcYitnYlEMys?=
 =?us-ascii?Q?3SphgKymCY9AQkuwKmMq0Zvx2oKu1egxbo5lIcmtgGqiqgeMLn/hR0ARQ42u?=
 =?us-ascii?Q?Ey8vC3cuHXNA3zbQbhjdA+iODrWzPhoWRaYl29d3AQKrbo61T8HGHQdKh5+g?=
 =?us-ascii?Q?Gu1bSBVlMAX1EyjT2nC29ma72B1myVGHB7krS3frqATrPPIlpe2N1RmvIynK?=
 =?us-ascii?Q?KWemRUlSW7doiwzsthqbr033sXWb40M3jfy6S8AUbykd4CmBookjYtiKpzIl?=
 =?us-ascii?Q?w7Ge94VSOAKnKXx+2YXFBevNRF4sp/U1LNB59j+ryRoMc1P9ImMpsrmc65pr?=
 =?us-ascii?Q?3E7w6uyNhn94af4n1NqIDC4CvyyNjSfM84HVstKcUTeXStkqDg8gfpk6JmmR?=
 =?us-ascii?Q?7rTD7kGiEOiKQ68azTdRA2oeofZoa2rTYGfTYr8Kq50QYt2p2h8WEPuVTRzS?=
 =?us-ascii?Q?TgN9l2m/jKIIDL/NNx/4ZLFcg05njSjyFkzMwZ8ybMkhGcFWtVFfdcuYvSRy?=
 =?us-ascii?Q?7gEXOesULc8zfmiCVGTbet7/9xlWF2ZMc3wU2VT66HMQKVifh1zQ+31zVuCa?=
 =?us-ascii?Q?U56uS3ISGKS5Pb3NfifEFyQjvgtzrPvSanrhgXt3EqYKIBTAQDkvVDp/KOCA?=
 =?us-ascii?Q?EREUI9zsyM40JfD7mlynIg6m/3EDK98ly/uQ/QViuY/NnoI9ACEWtUSZW2+G?=
 =?us-ascii?Q?lS1z6XKI4tKVNm7gOCQZvHM0wG3gVUoX0eFeFC26Movh2is3I4EVz1+jbrVB?=
 =?us-ascii?Q?Wkpev7onSQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb5e464-ea9e-458e-1c9b-08de52b12ae5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2026 14:36:41.4937 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmQrTxtuUqQJJsa37V8pLnKQz8vJftaD6kP3lm+Xi4YqJmXY8cKSlZGf4Mpm2N/xNTRWz/ITOMdIg4WgAAYziQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7127
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

Hi Thasleem,

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Mohammed Thasleem
> Sent: Tuesday, January 13, 2026 6:57 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>
> Subject: [PATCH v1 0/2] DC5 DPMS/PSR suspend/resume validation test
>=20
> This test validates dc5 dpms/psr before and after suspend/resume cycle.
>=20
> *** BLURB HERE ***
The commit message still contains the placeholder.=20
Please remove it.

Regards,
Pranay

>=20
> Mohammed Thasleem (2):
>   tests/intel/kms_pm_dc: Add DC5 DPMS suspend/resume validation test
>   tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume validation test
>=20
>  tests/intel/kms_pm_dc.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> --
> 2.25.1

