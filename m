Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1226CF58EE
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 08:31:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D0310E157;
	Fri, 20 Sep 2024 08:31:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kMCqsLFo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD9F10E157
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 08:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726821102; x=1758357102;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/a1kx9qqyTCY35kUAWrS0t95iDGqnQs0uSTjWsj9Ds0=;
 b=kMCqsLFoOwP0Zv+GNS85UxEdfDEGhmLW/zA62kB6IUGeH7it8FE7MLwf
 JqpvMo5qzTSV43CTQ5SceJHNtiwp2RHcf6tHkspm9d2KB0WHwcJSZwhsF
 IAqeg11bm3z7XOpJ54Nq6V7xl3QpavVtzusA8fjZs+YyoHTW9aUaABorv
 adaE0D6saCoiSk6GtjjczVsFWceyDB7bXSChVsT7skDirQzP7TL08hG1v
 ycJVWOVkS+2jy6yKjBv7Kr4X8kjGt7a1hxZOWoAiH0HGz1T5lfffbG+zE
 mYt6gRY38SZtqhO1B7WIMKTWpiyphr6xkmWBOP4XrebDJG4nQI3ejDyGO A==;
X-CSE-ConnectionGUID: yX9J8uUfRauXUzIk3p6ajA==
X-CSE-MsgGUID: fjNGd+kbQsmXPx2NePiHag==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29604429"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="29604429"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:31:42 -0700
X-CSE-ConnectionGUID: z4XF/B98THaxVG4kaj001w==
X-CSE-MsgGUID: Lymek88KRkqX0+wzufps5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="93539584"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 01:31:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 01:31:41 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 01:31:41 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 01:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZI63P2G1z10qmQsJ82ZCh2I0ojBlHraG9PAXxdzVCW1UfjbHwK+pwyIv/qilTD7W7hjUKlggV9quNaJ3gP7J4I+EPvUTV8RBubO3Z3lQ0ayOYI9jEOK0n1t4FMyRpDXV+ddjS4l3D4bpzrRmeefVgI0VuzzML+NfXYxcn256QxA9zfB/0NA8SPP0LNymGsUm+1C2/r5LlmpA5s4Y3FKgmLRPFKDhCBngdkzU78VxJG94qTIejUZABjWBTRY4GZKg0tjATZd15hVEnNP4QXzghcg386FvG/fVc/ao3QWKrz2osvYzit42RNlT2ytnH4RHeBP8SaRg2kdMfd5o38IX+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXHdiMv+w+LuFV4kh0ixxvoqCZOKb4nnH7JyffYoNpg=;
 b=WaHDaAPav9hfDci6EQ+gKJbslm+RPGXPeXM8UoInUtZinJ1Ar10T3ESr6adpokyAFFtICq0bx+8guLLW7ybd94dsnZWx5GtfTeI2ABtVxQCf8Gt/IyGKxem3FQWpSyMPMR5S01xtIjk1Y3UTHKMNWLEvTixWgS1Sw981X0gpjqaEa1/tdgUSOIukWFEANOl+ELnIq0gNt6DxbXq7v6W2QZ+0XMfhxVUN7iE3PA3TkhZE9eT8b3M/2BaAizWVb4ZSPbZvr7sMhfSvShs8CXUgEFIfCk0ieFB3vNdHKWJr/SShopeWY75oD6bS1HGNf4zX79Bvj87pk3XZyxKJxJLeEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by DM4PR11MB6042.namprd11.prod.outlook.com (2603:10b6:8:61::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 08:31:38 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%5]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 08:31:38 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Poosa, Karthik" <karthik.poosa@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Kamil
 Konieczny" <kamil.konieczny@linux.intel.com>
CC: "Nilawar, Badal" <badal.nilawar@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>
Subject: RE: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution and
 sleep times
Thread-Topic: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution
 and sleep times
Thread-Index: AQHbCzXHtb5NvjeIAEKwAWB/doCQl7JgVWng
Date: Fri, 20 Sep 2024 08:31:37 +0000
Message-ID: <CY5PR11MB6211A751A26CA560A3575536956C2@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240920083315.1763178-1-karthik.poosa@intel.com>
In-Reply-To: <20240920083315.1763178-1-karthik.poosa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|DM4PR11MB6042:EE_
x-ms-office365-filtering-correlation-id: 79408ee8-2f96-4d45-5ce6-08dcd94ea519
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?wclMEFfm/qLUeZNmLb57DoqLptbyRNosztRiZbgLrtADFRInhUqDRocmTsO0?=
 =?us-ascii?Q?f39YEXOohm0PO+Oq5JU9OE19Ze7cheVIwUPtcoPk1nkMcEq6VX71Qd8vRyY1?=
 =?us-ascii?Q?Cn0LnJ5tBmOiQE0U39wufP6McoylRb3TO397+grmE+AZaEZTmTqjdHEdALge?=
 =?us-ascii?Q?dB/pxDuf5/PkVKlrvrWdzLs8oUWerMMHphnYnENtloxFYn6SkWBIcFqv5shM?=
 =?us-ascii?Q?MoJglfXH0hK99vHU5JzdTDfgqNd6DjF+tSrglOHrA2Y/OwO5rfHW1Oqvs5Hr?=
 =?us-ascii?Q?zOa4snKZT2ZbZjURMtPO/wBQ89/JfkfTl60hE+rre3q0pDy85hPkaANTKKxX?=
 =?us-ascii?Q?JN9RvQdgZpJ83vemu97+L+T9Rh77TLEyVPwksSmlYFJMS9LyZGDKex798M3b?=
 =?us-ascii?Q?lh+IZf37yrcxFgnhKqkVzI6bEkTEbRGd+vCUI5FcYl662GUHRu5vaGHtQNBo?=
 =?us-ascii?Q?jBLfvnGmrZpYp21sKbuJF11poOjYN0SqVWf/y5r1Zz2Mi3vx8uUbRfd3TIo0?=
 =?us-ascii?Q?sRqQbaqznBhg5dZFgl6mEaCqwm0OZL18p70wnxpmKNITTIchGOExJgEVEpqh?=
 =?us-ascii?Q?yBoyzAJiPBo3R7EeyRfKmA63kion8HEgdOLPfN1tIdXLy2WJvmDIo1EBOHNq?=
 =?us-ascii?Q?PIM+PulpP7NjJEecPZSN2KRbRe8ki4S30ihCF1ngSYiY2YdXJGR2GpVWjV1/?=
 =?us-ascii?Q?GuJ26KQ3DPy2sBqKe8hnoRvCRZAuYyp4w0qnN4Sv8NWZif9ysPe2JIhbnISQ?=
 =?us-ascii?Q?97dauIOFNfkgllEvRcqC+WymQI9t1w+CqPARctYXLD80/su3DwqHy1QdkIP4?=
 =?us-ascii?Q?iDua1uboHXRdsYE/d+eX1mhbI80h5GqxnJMrQ3OfPaT2FoOwIeDrUSIub28l?=
 =?us-ascii?Q?SroTF/90jQC1GfXKE1ZYdny/1UiZmqLxhq+PEX3Xxj6q30bgVTiCpw1JdI5Q?=
 =?us-ascii?Q?+9vWw5MGvl3S6zVlf1aYqdGLn1eUM0WzqdTv8hXkc+6zaUa7gSIXBQRDU5oX?=
 =?us-ascii?Q?/R5rjNRBwba1cqkd9r466Ll/GmqZHmfMS3XEVGxBdGBJa8PIIR7JNdUOCltO?=
 =?us-ascii?Q?DTCTs2VqJma4U6M6QD5GZ2C0i+yPEVNrdfGD9+geEmhOVLmjyeg38Pg1dz5/?=
 =?us-ascii?Q?3kf3lglveWUuoohMsy7bVh1nkQQTHD2yFWilDTO/gwK3hlRJbShm4QksEGC5?=
 =?us-ascii?Q?kCgwiXdK3z3R73Yxcm/QywL4/WwBGOw+N1hap8JwH58nWhkwf7CYKqB+/DE+?=
 =?us-ascii?Q?QzCkx3v5MRr69M9w/FHSKugW4StAYP5IwkA4WoyDSjvcd+A+Xoxn02pqOxnd?=
 =?us-ascii?Q?kOmd1jGUl7QNtxym4yXnjPdzv9BowBEdWZyp87f174b5ZqKfBYw2wuZ4NJtq?=
 =?us-ascii?Q?FdTibU4pQXDSzBjt2iX9tvA5CLOBLFR7peEitZ2Bz2aSLs26cw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?P+32xNswf00Gz/kR5VgJf1G1JSPciAfXwm/Ozaym6DwI1yYz4DB4aZH+UBei?=
 =?us-ascii?Q?xpDBvkWT0uvgjxHSntKLJcjshQp0vCpatDfto0O5HRtAm9d5k3D7uYjiSD20?=
 =?us-ascii?Q?K5LFdzCz8cICaHHHe1Dgk48IKv287sjWrm+II9soRz2qeqmzXeBjxvqJcBxW?=
 =?us-ascii?Q?GOb1KBSjU0G88n4qeS/LiHE9TURmGy0TxBo2HT+gTtac0jOx9JA8u+C2M6MK?=
 =?us-ascii?Q?v70P1Ylk0wawerfmuOc2PTFU+qa57n1oxoKq1NuMJ0ugbYchqVXBEm+TFJUG?=
 =?us-ascii?Q?NQLd65t+7nHk5kQIvlMkbFWBWdWWG7fpLK25Fxvw+aOr10MgwPjjS2SqvyLw?=
 =?us-ascii?Q?jvh1oG4zB2AQJB1myq27wntugM4c3T2vpXUHId4u9NY2HHV/oE6/MxbhR3/f?=
 =?us-ascii?Q?JhoUeBO/AU8aNzfhEq9WfddeaHJN2phrFe0Wj2bdoiaqHHVTAGQvbYCEUpnX?=
 =?us-ascii?Q?KyvaUx80HejB4ADmrd5iNAxOdPsOTrBArEKTMVA8xY1zOUAlnExA+y1DuOpS?=
 =?us-ascii?Q?iA36AP1RjP1z53syBjwZQkMYJO2ZQ7gKmkUGTx7fC/R9OemnIlEFsv9jLQCr?=
 =?us-ascii?Q?rtMRDhHzYOiJ7nEV2alnX5loWRXWpt5DjkHK4SX1AYxCX+2NieZ1yNL3eukz?=
 =?us-ascii?Q?6G8883kIoI+JfaPhtuyM+UyhV6lgCLXSb4HYVB+9S9rAxH1hujvlvgc5hbt7?=
 =?us-ascii?Q?5dR9tvLOFDEzg7chMkx7SqwV3vsk4sK0qAHj1wZgqIO9L4G77KOZFMIFP4ny?=
 =?us-ascii?Q?X9CCkGeqMjoDeZg65F0zGucEQwBDu1rQgtGcaPMyVYkEvGL1shHiedzu/r/4?=
 =?us-ascii?Q?SQ/m0dc8fQg/WbUxh7eD71R026D/bn+JZGPjBcM4Fh1I482N2y3w0DREl7xr?=
 =?us-ascii?Q?yMCZq5F5j/CA/ZTJKHdZ77LVlrRhMfxRxyvVHXBxmRATlkrprbnzgeXZULgU?=
 =?us-ascii?Q?jYcs6JfLzlPg7bu7dBYOytqyiPpCR/qGQ9t5vXfVIru3jTNqKKViBZMU5FzT?=
 =?us-ascii?Q?i24ljjfJAX8DNgGpF7AgbVxzv+Vu1PZH8+/s9hdpHodR59tl/fjbfhw30ij8?=
 =?us-ascii?Q?WoZFNs4Z4mHmCxFFQyMKZbm7r4XdF5WOCxz08i/Co+j7B73eaqRlxcXT6o92?=
 =?us-ascii?Q?7VEjdz4RtW8i44cFKlAltYqZzH7KRiCIFwaXadYu1tU3qvdM6fIhGMoy1V5F?=
 =?us-ascii?Q?HhG2MAU86SFhtkZ3bxgjVq//G/a0dCDIzHy3qQv2xhHTjf5x/nKImNmByvuR?=
 =?us-ascii?Q?VAarUR3Kd9i/fkYGqDSKTfvUIDDz3COFyuKIrKrJm5RLwZiUdznR1bhc1Wl2?=
 =?us-ascii?Q?rKB5t4GjIAZebzNwK7OMQVYKV+LWg7VW/6XEkiq2EWJLw57vMrfLYXdvJE3d?=
 =?us-ascii?Q?3L2VJCdiHxiwlhKrBAMyh+p/LKaiEvyDmtUCai1KWDertA00huMmA004eSLJ?=
 =?us-ascii?Q?g1bzjfPzP+Si7ZuIGBWgHy1omlv8f9fQKiltyzSIrMDV0C6OiNgjxDUjsCb+?=
 =?us-ascii?Q?EKxw4z21S87a0e0gos+gIPJ+nC1rhYm7nLPNAGDWrj0usaygvZnJ3MoMOYgS?=
 =?us-ascii?Q?6rZCQg7qVoXuYSoE8hnmerq9ntKaITpJN9JASrPS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79408ee8-2f96-4d45-5ce6-08dcd94ea519
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 08:31:38.0058 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QQywA4ZYlKff9i51qPLwJr+OSwx00GVrv37QXd4gdSSd6slEPj/NFrgGinyDnUq/vLE2+HCdpokAN/xbf29EZzWSIXZPArPmbD9IH2U5z7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6042
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
> From: Poosa, Karthik <karthik.poosa@intel.com>
> Sent: Friday, September 20, 2024 2:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Poosa,
> Karthik <karthik.poosa@intel.com>
> Subject: [PATCH i-g-t v3] tests/intel/xe_pm_residency: Print execution an=
d sleep
> times
>=20
> Print the workload execution and sleep times of the test to help diagnose
> timeouts.
>=20
> v2: Patchwork test re-run.
>=20
> v3:
>  - Assert if syncobj_wait took more than 1.2 seconds, as it causes the te=
st
>    to timeout because test would sleep for more than 120 seconds which
>    triggers per task timeout.
>=20
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  tests/intel/xe_pm_residency.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.=
c index
> 0e687558b..343fdd694 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -139,11 +139,14 @@ static void exec_load(int fd, struct
> drm_xe_engine_class_instance *hwe, unsigned
>  		elapsed =3D igt_nsec_elapsed(&tv);
>  		igt_assert_eq(data->data, done[1]);
>=20
> -		igt_debug("Execution took %.3fms (submit %.1fus, wait
> %.1fus)\n",
> +		igt_info("Execution took %.3fms (submit %.1fus, wait
> %.1fus)\n",
>  			  1e-6 * elapsed,
>  			  1e-3 * submit,
>  			  1e-3 * (elapsed - submit));
We don't need to change to igt_info upon igt_assert it will dump each igt_d=
ebug log.
>=20
> +		/* Assert if syncobj_wait took more than 1.2 seconds */
Explain by comment why 1.2 seconds  ?
> +		igt_assert((uint64_t)(elapsed - submit) < (uint64_t)(1.2 *
> +NSEC_PER_SEC));
Your calculation is based upon the igt runner per test timeout which can ch=
ange.
So better to stick with 1 second. Or better to get per test timeout via igt=
 environment=20
variable.
Cc: Kamil
Is it possible to get the per test igt timeout value in igt test ?

Thanks,
Anshuman=20
> +
>  		syncobj_reset(fd, &syncobj, 1);
>=20
>  		/*
> --
> 2.25.1

