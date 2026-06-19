Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A34CD98E6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 05:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C0910E021;
	Fri, 19 Jun 2026 05:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcsTgWvv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF05D10E021
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 05:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781847308; x=1813383308;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TWXgLoQdKyE8od9CQcM5D7EVIdjjrdgjmMYRG5DQdx0=;
 b=dcsTgWvvf7k5vSqrZDWwIyNlXtvMup+H/h4EZK7xgmiYARliUwx8wlCg
 LtH7JZ1SZgHN3dBaZ/f4fJWbaku43U8XQoaGmI1k897t+lhtApDTjA/Rl
 DKK+VgJ1w9y5tPf5K9+TMsM8DSJytPaB99aAjxhLNVdECHtnVHRmNrcXb
 bSLgGDbGVP/6Z91HwTbJGHAD2bAMTzUha39oam+9PnCshwev/cjlc+VJZ
 e3aQ5MRzkHpwhQqc8x5q5YQSSw+vWnOalGhBZA7P7xwlWt+Kd+pCFXpAQ
 Zh0zxwYpyawTYM0co+nH1YPg60A7+brIFv6Qx/uFWcCN1Kt8LshA3rE6o g==;
X-CSE-ConnectionGUID: 8XytxMSLQpStr92clBpnHw==
X-CSE-MsgGUID: 9VqMEaJXSPirGILyHU/n+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="85251084"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="85251084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:35:07 -0700
X-CSE-ConnectionGUID: 0lWO4xusTF+tp8BNJP6TQw==
X-CSE-MsgGUID: 50J8useUSMmdpBwUxFfEIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="278732883"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:35:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:35:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 18 Jun 2026 22:35:06 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 18 Jun 2026 22:35:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2HHARfDP/ENWakbr5KUIf3OePIbTERD1D+9ihT2HR1osQymulRlR7rFZkHcS9SV7DGTZtsm2Hg5AvO9GaoqhDEIPvmfqjAMqJZ3o6dYMHeuSR7LoYfNoI4YmKH8sU/kGzxDXryD+glue472hjmh/y3tA83biaOifKEfYkB1qGd7WAWxH/ZX+JxG8ozKogY2RLCCLgOzHbmcZ+CLcxU1wubLaQBsbzwHkRdEfg7/FRlheOig4QImIbE1KGr6+XWApzX/Xc2MQmXCqnmnM7woxXEy1huuldw7gENlgMmuIodKZE8HzI//Ox6QGpFf917WNOFGeMyrAxsudGF0DJoJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2dMNWMtmoxhH9HuwtJwjpTrVLeFWwggrTBDBCH6/KI=;
 b=vqED+Lyru768k1KO84FSA0d5ey5tGvY57zO4oIIt16uPgKGvhZZ3wZ7bJfZK2R07GxVzDCpLNFPXHEXUCU7ErCIyUJ/7WUNZSFB+35qT6a8Q4ZDl1g79puYSP9baeXm2jenQ9T29pnTGlDuNH7BAxwjwQwDEwDl9VRh8WPIEJAtOzK1P5xiRYODQOaO48Ny4zFYNRBFi6Gcg4p0gao0K1E9rOk+rbr1Xxh1fkofBNJpOCpF1hi/6H/Rmlpk/LzaEr+AqkJkUw8leLmlrs7LBPaRQTvZk+jipQ24WQhqZknEtxaIS/CTeEDD0cL36tM0mjq3xPbrH5GrTjkC+fZKEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8434.namprd11.prod.outlook.com (2603:10b6:610:176::19)
 by DM4PR11MB6382.namprd11.prod.outlook.com (2603:10b6:8:be::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 05:35:03 +0000
Received: from CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc]) by CH3PR11MB8434.namprd11.prod.outlook.com
 ([fe80::52c4:16e1:a67e:63bc%7]) with mapi id 15.21.0113.015; Fri, 19 Jun 2026
 05:35:03 +0000
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Gandi, Ramadevi" <ramadevi.gandi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to
 multi-queue tests and subtests.
Thread-Topic: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to
 multi-queue tests and subtests.
Thread-Index: AQHc/jRXJX+QCvJuYU+UDT9VFUUHwbZC//+AgAJcPjA=
Date: Fri, 19 Jun 2026 05:35:03 +0000
Message-ID: <CH3PR11MB84344B2C4D5657E6FBBE4FE98DE22@CH3PR11MB8434.namprd11.prod.outlook.com>
References: <20260617083549.1347431-4-priyanka.dandamudi@intel.com>
 <20260617083549.1347431-6-priyanka.dandamudi@intel.com>
 <ajLYY_n7bLRFMqe4@nvishwa1-desk>
In-Reply-To: <ajLYY_n7bLRFMqe4@nvishwa1-desk>
Accept-Language: en-US, en-IN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB8434:EE_|DM4PR11MB6382:EE_
x-ms-office365-filtering-correlation-id: a43586fc-2741-430b-4685-08decdc48390
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|23010399003|1800799024|376014|38070700021|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: fh1JspP6Szj/EoMQViA0jcsi4/tLxAlV+5wNGMqxSQfNa82aJLFZqikw+KOGk8rBYrH0IQaJPvSjAD8wzURklecyrb6p7BdoKlTZ8p4guFZm3Zz2NdSgOIjV34Z8NHGTLwcBZItPOIwHQqYZoQ4W2nWTIu2l1QcWRkK2XmWmuX+D3RTnY/QQrCYD+8mZnX1A1Ug1Yr/+ssY50lNS7ERpNSZolideQy85+2Aq9R8SAdGHQfO5cszQh2hshlXwh+M9CLX2o/8ohpPBT42DGBeOeA7ldc1B9O+ngUL8Qubz1UZw7Dq93K9Y8a2x14bHDwvDxP2Al6z/BIBU26X086ujDII8PCe1P/ltQ4hCV9JHrTOGSN0rPLyNodVdTLDtXYSHISN3CuDm5tp9c7IZXxS2tGiWyI5/4fAWUk2FfsNJxUh/f+/bBOyfvs46p1kxtikYA065UcQBQSh5f4Wm4GfroI8QuNSOIvQRKOnTU7MWGx/hg93XqDSWF/aF4CoWvZN+ZwHEGphx+pTxO3R3/4o2ZTdiZoHnPTVi9PPDoBqDZoq//TixaqRdJPOwRobAbPgBTPvyozRxv7w7dxfwrZjSYoHVrWhnN5/TMb2GPYZ1dOtpX1T85ROzwU2zU8MSdsghkGT0muxCMwNafDMErAGUPwV+59dqjQOTZ80MqzOYbhksGL2krol0Ao92/wfTQMNt8o8e/02NaatT7e87eroUlTbdRvyWIzEQTurz3gVJ8lY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8434.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jNh/k8gay1YUQ7a5kkF4YguA5P12hes7tIqZ5yPUQ181X/x/zrThlnvjjjlt?=
 =?us-ascii?Q?dMmlySOPlCyOKDYRFgcg1yhxV8KlEpaQIBAi82jOv+BEXyp8hhHg+un+rv1x?=
 =?us-ascii?Q?NGMAcG4oRzOWucV1dyPdHtD2NCpONNY8xI2Il/Pv1XESOmWlhivL8/bIaThM?=
 =?us-ascii?Q?A+vt5Td0e1I/iojs/Dmb2q+Fwu4xuSNT1KZdo+ueP9PQsZw+5R1rTt7XLV5Y?=
 =?us-ascii?Q?KHyZYWLgBb8LSNCl6pKlgzmhYLwjd73QsQ4o4Gp6JZ2qVhwGhVbOF7QS82kb?=
 =?us-ascii?Q?ydPV7wdKg4BPrJ+BYzhnXmxmpXIZC6kRFB/fDwPuiNT7cxeXm2zHgpjFtrCD?=
 =?us-ascii?Q?cLbb1d76HUIi/0rgZBA7hGZzMLMcMgwKODTQn6GLgv/QRpZyEH0BAOveiahx?=
 =?us-ascii?Q?YUaxGnNv5XjfQU6yMw2lwoD64jQurS3iVTGZ+2ROmv1NlZ0obm4AkMdsXFdo?=
 =?us-ascii?Q?Age60ASzbJfvUunM40jRPp6/iVU7OKAeR2l+2wsMZLu76XIGcv/44XkcfFZk?=
 =?us-ascii?Q?TOLn+OHOphfpQDIVTB/QMZuSras2TGXHcwoNYFMvTWiVUpSo1UFyiwTKTVop?=
 =?us-ascii?Q?Y9l2/Sf8B23Ty9YXhZTtYDACIt6liR7L1kN79LXQ449x4FL/GxJBdJEggCfd?=
 =?us-ascii?Q?Uab467zpH3MBXkCIw0sJNl0FoYCJZGGhY9/mUyfx5+sDUINFI7r2MWUJZi6u?=
 =?us-ascii?Q?qfeytcXoniDT1FNI4h+EPbMCM+mVZGIvgscZ24khgPp4eQUXD/SFz7uOyP6u?=
 =?us-ascii?Q?e7NmReJiITycqjYz75IGRcDuQD2QWPgS4L0aq/Y1JX1XUMwUSHhLrpE3Yanc?=
 =?us-ascii?Q?KRkMhADG6idDB6+2HVIgU5A1G54KVMGgzjBRrZVn6bajqtoPIODAgWgUSQu0?=
 =?us-ascii?Q?prZgDHRmxiqK/kur7cxGHiQS9zfGH2XlF4MkCjsvhnaGo/3M4d8+ToTfLBcR?=
 =?us-ascii?Q?iA0ZlfMJ9J+HFAbd6D3cnxClt10AnPrWL7eZkhL48qeg2thZEqtW9iH3dgTN?=
 =?us-ascii?Q?pSCQM0NcIdSNs/mbzg3KGZcy58wPHNjmMnfVtxR2/t10PN89HC0i8peg5oXN?=
 =?us-ascii?Q?9BAQ2ae/97ZtiK/nRDML9YNkTgrae2MocMWF1Bg7UZNgTqMEe/piuDenyFf7?=
 =?us-ascii?Q?Sn4ONMROjSvCppdxW1n7mHlrVetCrUnHdc8cfl+L9bxevnJUAOIDuiTa8bji?=
 =?us-ascii?Q?UtL6BsD2dZDAK3bTLM2+VLa13bLion4H8P9xDlrwIMqiua6O8JNQpG1VENoH?=
 =?us-ascii?Q?1n4Dul6cT70PN4YHE63IdMZjSjU+Nk5fvo5jWcynhOwTXntddaCavOg7tBni?=
 =?us-ascii?Q?C4E3vk9+SvwDvY/qjjNenJvPVf4tYidrgHF5NrGpdykvZrd/1hk+nN3n/hvb?=
 =?us-ascii?Q?tnp+CvU5iJmbw08xp20rGf9WA7AJ3js2AMhhHBm0YkXT+tgsoxEzutYKmdlg?=
 =?us-ascii?Q?Pm2tIp+nki/OgoEQb4XrojtsaVfLt8i6xquuNBHsG1DW0ku3SmUzs4l/cCv5?=
 =?us-ascii?Q?641TNEolMyI4iyZGymiGeP+n4xhcB7gWcKPAMx0hDgcOiHPZbAFgjZkpLRWd?=
 =?us-ascii?Q?wC/oNf4c376yyFYMlh4Vhj7tTY2ZUAtZDP05qFzmGjuB9epL8dOEgLgfXoRT?=
 =?us-ascii?Q?RwT3kyto1DDJsO3jLs8DTQZeLvy8w3xfsaCArxhzhsBm4dXNnTNCutIppDPY?=
 =?us-ascii?Q?dz6TBirDJvpPuYMKzhFT6NzmqwQwyH9wfClAfJIB27ZnJmD2tQEsam8T7wzU?=
 =?us-ascii?Q?SyLNgHOJwuQFbZiTwTnknQi8Zdr5YnWlGHFyXQ58VQspJa4aJEgqyleA9rn8?=
x-ms-exchange-antispam-messagedata-1: GmoVQVKsA/oeN+Jwtme+VxZgwSwov9fhlKM=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: UCT4pmaQv3JUI65CAmma9G2f8PZblV7gVsge6VuQNItjYnxuty+q7Dp0Zkct6pAUTvOS6CgBb/EiUTPh+PWmlo+ln/jH3HmD/vYWoNY5LoLOaNjSYED0k+fDy39zAQynEHGy3N53mgaRJgiEJ1rxo0QKVqCi3txujF+uCV3G18tVTL2mY5ITIDlsLlJp3UqJQgHMZCsbfpfM1/lNZsnAVlsY+97wk+oANdEWXMXdLc/1HhqhnokwEsTdA+5GsNQOb8o6bMLX05egwx59yZZPQZ5IP7zsGY/bYiDlY1lSz4hlIMF01MjKdp+NP/EW8VlT9G3uNW5UAlJM3zMu4VjkfA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8434.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43586fc-2741-430b-4685-08decdc48390
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2026 05:35:03.7193 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r9WF3z8aXauwtvFbNoKtoVKCJSJ6ApJ7osW2uFWuLRUmGdi6rqLpz2lFmDpGWdy5gxx2ypjRKCvbJ8P44FSzRCxno4ySUUK7ezP+Qm98VNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6382
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
> Sent: 17 June 2026 10:55 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Cc: Gandi, Ramadevi <ramadevi.gandi@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe*.c: Add documentation to mu=
lti-
> queue tests and subtests.
>=20
> On Wed, Jun 17, 2026 at 02:05:52PM +0530, priyanka.dandamudi@intel.com
> wrote:
> >From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> >Add Mega feature and Sub-category fields to multi-queue tests and
> subtests.
> >
> >Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >---
> > tests/intel/xe_evict.c           | 72 ++++++++++++++++++++++------
> > tests/intel/xe_exec_fault_mode.c | 81 ++++++++++++++++++++++----------
> > tests/intel/xe_exec_reset.c      | 28 +++++++++++
> > tests/intel/xe_exec_threads.c    | 44 ++++++++++-------
> > 4 files changed, 167 insertions(+), 58 deletions(-)
> >
> >diff --git a/tests/intel/xe_evict.c b/tests/intel/xe_evict.c index
> >82a6cde0a9..70cfa11bbb 100644
> >--- a/tests/intel/xe_evict.c
> >+++ b/tests/intel/xe_evict.c
> >@@ -559,11 +559,7 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> >  * arg[1]:
> >  *
> >  * @small:			small
> >- * @small-multi-queue:		small multi queue
> >- * @small-multi-queue-priority:
> >- * 				small multi queue priority
> >  * @small-external:		small external
> >- * @small-external-multi-queue: small external multi queue
> >  * @small-multi-vm:		small multi VM
> >  * @beng-small:			small bind exec_queue
> >  * @beng-small-external:	small external bind exec_queue
> >@@ -593,12 +589,7 @@ static unsigned int working_set(uint64_t
> >vram_size, uint64_t system_size,
> >  * arg[1]:
> >  *
> >  * @small-cm:			small compute machine
> >- * @small-multi-queue-cm:	small multi queue compute machine
> >- * @small-multi-queue-priority-cm:
> >- * 				small multi queue priority compute machine
> >  * @small-external-cm:		small external compute machine
> >- * @small-external-multi-queue-cm:
> >- * 				small external compute machine multi queue
> >  * @small-multi-vm-cm:		small multi VM compute machine
> >  * @beng-small-cm:		small bind exec_queue compute machine
> >  * @beng-small-external-cm:	small external bind exec_queue compute
> machine
> >@@ -629,8 +620,6 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  * arg[1]:
> >  *
> >  * @mixed-threads-small:	mixed threads small
> >- * @mixed-threads-small-multi-queue:
> >- * 				mixed threads small multi queue
> >  * @mixed-many-threads-small:	mixed many threads small
> >  * @mixed-threads-small-multi-vm:
> >  * 				mixed threads small multi vm
> >@@ -668,8 +657,6 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  *
> >  * arg[1]:
> >  * @cm-threads-small:		compute mode threads small
> >- * @cm-threads-small-multi-queue:
> >- * 				compute mode threads small multi queue
> >  * @cm-threads-small-multi-vm:	compute mode threads small multi
> vm
> >  * @beng-cm-threads-small:	bind exec_queue compute mode threads
> small
> >  * @beng-cm-threads-small-multi-vm:
> >@@ -700,7 +687,6 @@ static unsigned int working_set(uint64_t vram_size,
> >uint64_t system_size,
> >  *
> >  * @threads-small:		threads small
> >  * @beng-threads-small:		bind exec_queue threads small
> >- * @threads-small-multi-queue:	threads small multi queue
> >  * @threads-small-multi-vm:	threads small multi vm
> >  * @beng-threads-small-multi-vm:
> >  *				bind exec_queue threads small multi vm
> >@@ -722,6 +708,64 @@ static unsigned int working_set(uint64_t vram_size,
> uint64_t system_size,
> >  * @beng-threads-large:		bind exec_queue threads large
> >  *
> >  */
> >+/**
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description:  %arg[1] evict test.
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @small-multi-queue:		small multi queue
> >+ * @small-multi-queue-priority:	small multi queue priority
> >+ * @small-external-multi-queue: small external multi queue
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description:  %arg[1] evict test.
> >+ * Feature: compute machine
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @small-multi-queue-cm:	small multi queue compute machine
> >+ * @small-multi-queue-priority-cm:	small multi queue priority compute
> machine
> >+ * @small-external-multi-queue-cm:	small external compute machine
> multi queue
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description:  %arg[1] evict test.
> >+ * Feature: mixed threads
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @mixed-threads-small-multi-queue:	mixed threads small multi
> queue
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description:  %arg[1] evict test.
> >+ * Feature: compute mode threads
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ * @cm-threads-small-multi-queue:	compute mode threads small multi
> queue
> >+ *
> >+ * SUBTEST: evict-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description:  %arg[1] evict test.
> >+ * Feature: threads
> >+ * Test category: functionality test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @threads-small-multi-queue:	threads small multi queue
> >+ */
> >
> > /*
> >  * Table driven test that attempts to cover all possible scenarios of
> >eviction diff --git a/tests/intel/xe_exec_fault_mode.c
> >b/tests/intel/xe_exec_fault_mode.c
> >index 3e92dfbd9a..23a1c31301 100644
> >--- a/tests/intel/xe_exec_fault_mode.c
> >+++ b/tests/intel/xe_exec_fault_mode.c
> >@@ -78,14 +78,6 @@
> >  *					bindexecqueue userptr invalidate
> >  * @bindexecqueue-userptr-invalidate-race:
> >  *					bindexecqueue userptr invalidate
> race
> >- * @multi-queue:			multi-queue
> >- * @multi-queue-userptr:		multi-queue userptr
> >- * @multi-queue-rebind:			multi-queue rebind
> >- * @multi-queue-userptr-rebind:		multi-queue userptr rebind
> >- * @multi-queue-userptr-invalidate:
> >- *					multi-queue userptr invalidate
> >- * @multi-queue-userptr-invalidate-race:
> >- *					multi-queue userptr invalidate race
> >  * @basic-imm:				basic imm
> >  * @userptr-imm:			userptr imm
> >  * @rebind-imm:				rebind imm
> >@@ -101,15 +93,6 @@
> >  *					bindexecqueue userptr invalidate
> imm
> >  * @bindexecqueue-userptr-invalidate-race-imm:
> >  *					bindexecqueue userptr invalidate
> race imm
> >- * @multi-queue-imm:			multi-queue imm
> >- * @multi-queue-userptr-imm:		multi-queue userptr imm
> >- * @multi-queue-rebind-imm:		multi-queue rebind imm
> >- * @multi-queue-userptr-rebind-imm:
> >- *					multi-queue userptr rebind imm
> >- * @multi-queue-userptr-invalidate-imm:
> >- *					multi-queue userptr invalidate imm
> >- * @multi-queue-userptr-invalidate-race-imm:
> >- *					multi-queue userptr invalidate race
> imm
> >  * @basic-prefetch:			basic prefetch
> >  * @userptr-prefetch:			userptr prefetch
> >  * @rebind-prefetch:			rebind prefetch
> >@@ -124,17 +107,63 @@
> >  *					bindexecqueue userptr invalidate
> prefetch
> >  * @bindexecqueue-userptr-invalidate-race-prefetch:
> >  *					bindexecqueue userptr invalidate
> race prefetch
> >- * @multi-queue-prefetch:		multi-queue prefetch
> >- * @multi-queue-userptr-prefetch:	multi-queue userptr prefetch
> >- * @multi-queue-rebind-prefetch:	multi-queue rebind prefetch
> >- * @multi-queue-userptr-rebind-prefetch:	multi-queue userptr rebind
> prefetch
> >- * @multi-queue-userptr-invalidate-prefetch:
> >- *					multi-queue userptr invalidate
> prefetch
> >- * @multi-queue-userptr-invalidate-race-prefetch:
> >- *					multi-queue userptr invalidate race
> prefetch
> >  * @invalid-fault:			invalid fault
> >  * @invalid-userptr-fault:		invalid userptr fault
> >- * @multi-queue-invalid-fault:		multi-queue invalid fault
> >+ */
> >+/**
> >+ * SUBTEST: once-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description: Run %arg[1] fault mode test only once
> >+ * Test category: functionality test
> >+ *
> >+ * SUBTEST: twice-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description: Run %arg[1] fault mode test twice
> >+ * Test category: functionality test
> >+ *
> >+ * SUBTEST: many-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description: Run %arg[1] fault mode test many times
> >+ * Test category: stress test
> >+ *
> >+ * SUBTEST: many-execqueues-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description: Run %arg[1] fault mode test on many exec_queues
> >+ * Test category: stress test
> >+ *
> >+ * arg[1]:
> >+ *
> >+ * @multi-queue:                        multi-queue
> >+ * @multi-queue-userptr:                multi-queue userptr
> >+ * @multi-queue-rebind:                 multi-queue rebind
> >+ * @multi-queue-userptr-rebind:         multi-queue userptr rebind
> >+ * @multi-queue-userptr-invalidate:
> >+ *                                      multi-queue userptr invalidate
> >+ * @multi-queue-userptr-invalidate-race:
> >+ *                                      multi-queue userptr invalidate =
race
>=20
> Here and elsewhere, may be we can add one more tab instead of going to
> next line?
> Also, all tests start with 'multi-queue', may be include that in SUBEST t=
ag as
> now we have seprate definition for it (like SUBTEST: many-multi-queue-%s)=
.
> That will also reduce the test name length here. Same applies elsewhere
> also.
>=20
> Niranjana
>=20
Tab I will add based on your suggestion but for the next suggestion to use =
SUBTEST: many-multi-queue-%s
I need to create new struct=20
Below is the example which would be for all=20
+	static const struct section sections_mq[] =3D {
+		{ "basic",				MULTI_QUEUE },
+		{ "userptr",				MULTI_QUEUE | USERPTR },
+		{ "rebind",				MULTI_QUEUE | REBIND },
+		{ "userptr-rebind",			MULTI_QUEUE | USERPTR | REBIND },
+		{ "userptr-invalidate",			MULTI_QUEUE | USERPTR | INVALIDATE },
+		{ "userptr-invalidate-race",		MULTI_QUEUE | USERPTR | INVALIDATE | RACE =
},
+		{ "imm",				IMMEDIATE | MULTI_QUEUE },
+		{ "userptr-imm",			IMMEDIATE | MULTI_QUEUE | USERPTR },
+		{ "rebind-imm",				IMMEDIATE | MULTI_QUEUE | REBIND },
+		{ "userptr-rebind-imm",			IMMEDIATE | MULTI_QUEUE | USERPTR | REBIND },
+		{ "userptr-invalidate-imm",		IMMEDIATE | MULTI_QUEUE | USERPTR | INVALID=
ATE },
+		{ "userptr-invalidate-race-imm",	IMMEDIATE | MULTI_QUEUE | USERPTR | INV=
ALIDATE | RACE },
+		{ "prefetch",				PREFETCH | MULTI_QUEUE },
+		{ "userptr-prefetch",			PREFETCH | MULTI_QUEUE | USERPTR },
+		{ "rebind-prefetch",			PREFETCH | MULTI_QUEUE | REBIND },
+		{ "userptr-rebind-prefetch",		PREFETCH | MULTI_QUEUE | USERPTR | REBIND =
},
+		{ "userptr-invalidate-prefetch",	PREFETCH | MULTI_QUEUE | USERPTR | INVA=
LIDATE },
+		{ "userptr-invalidate-race-prefetch",	PREFETCH | MULTI_QUEUE | USERPTR |=
 INVALIDATE | RACE },
+		{ "invalid-fault",			MULTI_QUEUE | INVALID_FAULT },
+		{ "invalid-userptr-fault",		MULTI_QUEUE | INVALID_FAULT | USERPTR },
+		{ NULL },
+	};=20
Add new loop
+	for (const struct section *s =3D sections_mq; s->name; s++) {
+		igt_subtest_f("once-multi-queue-%s", s->name)
+			test_exec_main(fd, 1, 1, s->flags);
+
+		igt_subtest_f("twice-multi-queue-%s", s->name)
+			test_exec_main(fd, 1, 2, s->flags);
+
+		igt_subtest_f("many-multi-queue-%s", s->name)
+			test_exec_main(fd, 1,
+					s->flags & (REBIND | INVALIDATE) ?
+					64 : 128,
+					s->flags);
+
+		igt_subtest_f("many-execqueues-multi-queue-%s", s->name)
+			test_exec_main(fd, 16,
+					s->flags & (REBIND | INVALIDATE) ?
+					64 : 128,
+					s->flags);
+	}=20
After the above code addition/change we can change the documentation is it =
ok add new structs and loop? if so, will change all over.
Please suggest.
--Priyanka
/**
+ * SUBTEST: once-multi-queue-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test only once
+ * Test category: functionality test
+ *
+ * SUBTEST: twice-multi-queue-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test twice
+ * Test category: functionality test
+ *
+ * SUBTEST: many-multi-queue-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test many times
+ * Test category: stress test
+ *
+ * SUBTEST: many-execqueues-multi-queue-%s
+ * Mega feature: Multi-Queue
+ * Sub-category: Multi-Queue tests
+ * Description: Run %arg[1] fault mode test on many exec_queues
+ * Test category: stress test
+ *
+ * arg[1]:
+ *
+ * @basic:				multi-queue
+ * @userptr:				multi-queue userptr
+ * @rebind:				multi-queue rebind
+ * @userptr-rebind:			multi-queue userptr rebind
+ * @userptr-invalidate:			multi-queue userptr invalidate
+ * @userptr-invalidate-race:		multi-queue userptr invalidate race
+ * @imm:				multi-queue imm
+ * @userptr-imm:			multi-queue userptr imm
+ * @rebind-imm:				multi-queue rebind imm
+ * @userptr-rebind-imm:			multi-queue userptr rebind imm
+ * @userptr-invalidate-imm:		multi-queue userptr invalidate imm
+ * @userptr-invalidate-race-imm:	multi-queue userptr invalidate race imm
+ * @prefetch:				multi-queue prefetch
+ * @userptr-prefetch:			multi-queue userptr prefetch
+ * @rebind-prefetch:			multi-queue rebind prefetch
+ * @userptr-rebind-prefetch:		multi-queue userptr rebind prefetch
+ * @userptr-invalidate-prefetch:	multi-queue userptr invalidate prefetch
+ * @userptr-invalidate-race-prefetch:	multi-queue userptr invalidate race =
prefetch
+ * @invalid-fault:			multi-queue invalid fault
+ * @invalid-userptr-fault:		multi-queue invalid userptr fault
+ */
> >+ * @multi-queue-imm:                    multi-queue imm
> >+ * @multi-queue-userptr-imm:            multi-queue userptr imm
> >+ * @multi-queue-rebind-imm:             multi-queue rebind imm
> >+ * @multi-queue-userptr-rebind-imm:
> >+ *                                      multi-queue userptr rebind imm
> >+ * @multi-queue-userptr-invalidate-imm:
> >+ *                                      multi-queue userptr invalidate =
imm
> >+ * @multi-queue-userptr-invalidate-race-imm:
> >+ *                                      multi-queue userptr invalidate =
race imm
> >+ * @multi-queue-prefetch:               multi-queue prefetch
> >+ * @multi-queue-userptr-prefetch:       multi-queue userptr prefetch
> >+ * @multi-queue-rebind-prefetch:        multi-queue rebind prefetch
> >+ * @multi-queue-userptr-rebind-prefetch:
> >+ *                                      multi-queue userptr rebind pref=
etch
> >+ * @multi-queue-userptr-invalidate-prefetch:
> >+ *                                      multi-queue userptr invalidate =
prefetch
> >+ * @multi-queue-userptr-invalidate-race-prefetch:
> >+ *                                      multi-queue userptr invalidate =
race prefetch
> >+ * @multi-queue-invalid-fault:          multi-queue invalid fault
> >  * @multi-queue-invalid-userptr-fault:  multi-queue invalid userptr
> > fault  */
> >
> >diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> >index 9f5fde1a74..e41c663342 100644
> >--- a/tests/intel/xe_exec_reset.c
> >+++ b/tests/intel/xe_exec_reset.c
> >@@ -350,9 +350,13 @@ test_balancer(int fd, int gt, int class, int
> >n_exec_queues, int n_execs,
> >  * Description: Test long spinners with many preemptable jobs, use
> >queues again spinners complete on media GT
> >  *
> >  * SUBTEST: multi-queue-long-spin-many-queue-switch
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test long spinners with many jobs with multi-queue
> > switching
> >  *
> >  * SUBTEST: multi-queue-long-spin-reuse-many-queue-switch
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test long spinners with many jobs with multi-queue
> >switching, use queues again once spinners complete
> >  *
> >  * SUBTEST: gt-reset
> >@@ -383,42 +387,66 @@ test_balancer(int fd, int gt, int class, int
> >n_exec_queues, int n_execs,
> >  * Description: Test compute mode close exec_queues close fd
> >  *
> >  * SUBTEST: multi-queue-cat-error
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test cat error with multi_queue
> >  *
> >  * SUBTEST: multi-queue-cat-error-on-secondary
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test cat error with multi_queue
> >  *              on a secondary queue
> >  *
> >  * SUBTEST: multi-queue-gt-reset
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test GT reset with multi_queue
> >  *
> >  * SUBTEST: multi-queue-cancel
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test engine reset with multi_queue
> >  *
> >  * SUBTEST: multi-queue-cancel-on-secondary
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test engine reset with multi_queue
> >  *              on a secondary queue
> >  *
> >  * SUBTEST: multi-queue-close-fd
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test close fd with multi_queue
> >  *
> >  * SUBTEST: multi-queue-close-execqueues
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test close execqueues with multi_queue
> >  *
> >  * SUBTEST: cm-multi-queue-cat-error
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test compute mode cat error with multi_queue
> >  *
> >  * SUBTEST: cm-multi-queue-cat-error-on-secondary
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test compute mode cat error with multi_queue
> >  *              on a secondary queue
> >  *
> >  * SUBTEST: cm-multi-queue-gt-reset
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test compute mode GT reset with multi_queue
> >  *
> >  * SUBTEST: cm-multi-queue-close-fd
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test compute mode close fd with multi_queue
> >  *
> >  * SUBTEST: cm-multi-queue-close-execqueues
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >  * Description: Test compute mode close execqueues with multi_queue
> > */
> >
> >diff --git a/tests/intel/xe_exec_threads.c
> >b/tests/intel/xe_exec_threads.c index 2f44d5555d..894fa49bff 100644
> >--- a/tests/intel/xe_exec_threads.c
> >+++ b/tests/intel/xe_exec_threads.c
> >@@ -1203,6 +1203,14 @@ static void *thread(void *data)
> >  *	balancer mixed fd userptr invalidate
> >  * @bal-mixed-fd-userptr-invalidate-race:
> >  *	balancer mixed fd userptr invalidate race
> >+ */
> >+/**
> >+ * SUBTEST: threads-%s
> >+ * Mega feature: Multi-Queue
> >+ * Sub-category: Multi-Queue tests
> >+ * Description: Run threads %arg[1] test with multi threads
> >+ *
> >+ * arg[1]:
> >  * @multi-queue-basic:
> >  *	multi-queue basic
> >  * @multi-queue-userptr:
> >@@ -1244,49 +1252,49 @@ static void *thread(void *data)
> >  * @multi-queue-fd-userptr-invalidate-race:
> >  *	multi-queue fd userptr invalidate race
> >  * @multi-queue-hang-basic:
> >- *     multi-queue hang basic
> >+ *	multi-queue hang basic
> >  * @multi-queue-hang-fd-userptr-invalidate-race:
> >  *	multi-queue hang fd userptr invalidate race
> >  * @multi-queue-mixed-basic:
> >  *	multi-queue mixed basic
> >  * @multi-queue-mixed-userptr:
> >- *	multi-queue-mixed userptr
> >+ *	multi-queue mixed userptr
> >  * @multi-queue-mixed-rebind:
> >- *	multi-queue-mixed rebind
> >+ *	multi-queue mixed rebind
> >  * @multi-queue-mixed-userptr-rebind:
> >- *	multi-queue-mixed userptr rebind
> >+ *	multi-queue mixed userptr rebind
> >  * @multi-queue-mixed-userptr-invalidate:
> >- *	multi-queue-mixed userptr invalidate
> >+ *	multi-queue mixed userptr invalidate
> >  * @multi-queue-mixed-userptr-invalidate-race:
> >- *	multi-queue-mixed userptr invalidate race
> >+ *	multi-queue mixed userptr invalidate race
> >  * @multi-queue-mixed-shared-vm-basic:
> >  *	multi-queue mixed shared vm basic
> >  * @multi-queue-mixed-shared-vm-userptr:
> >- *	multi-queue-mixed shared vm userptr
> >+ *	multi-queue mixed shared vm userptr
> >  * @multi-queue-mixed-shared-vm-rebind:
> >- *	multi-queue-mixed shared vm rebind
> >+ *	multi-queue mixed shared vm rebind
> >  * @multi-queue-mixed-shared-vm-userptr-rebind:
> >- *	multi-queue-mixed shared vm userptr rebind
> >+ *	multi-queue mixed shared vm userptr rebind
> >  * @multi-queue-mixed-shared-vm-userptr-invalidate:
> >- *	multi-queue-mixed shared vm userptr invalidate
> >+ *	multi-queue mixed shared vm userptr invalidate
> >  * @multi-queue-mixed-shared-vm-userptr-invalidate-race:
> >- *	multi-queue-mixed shared vm userptr invalidate race
> >+ *	multi-queue mixed shared vm userptr invalidate race
> >  * @multi-queue-mixed-fd-basic:
> >  *	multi-queue mixed fd basic
> >  * @multi-queue-mixed-fd-userptr:
> >- *	multi-queue-mixed fd userptr
> >+ *	multi-queue mixed fd userptr
> >  * @multi-queue-mixed-fd-rebind:
> >- *	multi-queue-mixed fd rebind
> >+ *	multi-queue mixed fd rebind
> >  * @multi-queue-mixed-fd-userptr-rebind:
> >- *	multi-queue-mixed fd userptr rebind
> >+ *	multi-queue mixed fd userptr rebind
> >  * @multi-queue-mixed-fd-userptr-invalidate:
> >- *	multi-queue-mixed fd userptr invalidate
> >+ *	multi-queue mixed fd userptr invalidate
> >  * @multi-queue-mixed-fd-userptr-invalidate-race:
> >- *	multi-queue-mixed fd userptr invalidate race
> >+ *	multi-queue mixed fd userptr invalidate race
> >  * @multi-queue-cm-basic:
> >- * 	multi-queue cm basic
> >+ *	multi-queue cm basic
> >  * @multi-queue-cm-fd-basic:
> >- * 	multi-queue cm fd basic
> >+ *	multi-queue cm fd basic
> >  * @multi-queue-cm-userptr:
> >  *	multi-queue compute mode userptr
> >  * @multi-queue-cm-rebind:
> >--
> >2.43.0
> >
