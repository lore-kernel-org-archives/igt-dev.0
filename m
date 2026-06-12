Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA695CD98D6
	for <igt-dev@archiver.kernel.org>; Fri, 12 Jun 2026 15:20:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822FE10F581;
	Fri, 12 Jun 2026 15:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mkOIVIDg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 586CE10F581
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jun 2026 15:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781277618; x=1812813618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LTb7HH61KQmncKxv4I8Zj8QfzB85bRJ9QGQ/GI43LvY=;
 b=mkOIVIDgfmAJ4c1bNENXbUqOY700BSrLweW5ehZk3Ovw0mHsltW273RQ
 zRQRtIpZvzfXQ2H+jO3N1PeS2N9p4SKUTww2sE/G+P/wX7avJWA6r4pg2
 v8uimozb1Te4i/bLLASLz6FPLPDRygR8rRYFYTcNcoIyu1/R7zikCEohm
 zogoPSmJveJpbANvBls0CJbtE6etjRI4S+so+PtcnR5dXaj71EBPV/jTw
 Zss22DAdlD3jBBpxwTcasoCxhTsJmrR7bzcPGKs13qQ4yz99xB/gLYpcb
 KFOUd17ZyauSjmZh+aX7OzHbgRaRHOhbgm4I9F8trUWbvk6pdpx0k2DKs w==;
X-CSE-ConnectionGUID: zyEUZuuBTFOQox8zENGPYg==
X-CSE-MsgGUID: R59bFqWPTtWgGdRAnkkcQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82152686"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; d="scan'208";a="82152686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 08:20:10 -0700
X-CSE-ConnectionGUID: 9apTRQY/TxycBXOHRx+Brg==
X-CSE-MsgGUID: /chlXlfoS4ep9fJKKwojqg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2026 08:20:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:20:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 08:20:09 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 08:20:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENghnPT3pG8lw7n9uk6hhjc4jewcp5SZGgFLkjnN45VZC4vtwSeroQlsfm82A7EZpZM/i4EE4Kc5QQrkC1QWTcwMcEDpHlBEVnWEa+3aUs7fXk1FWWYUOYNA0chF1nbLYjxw+UW6sRWJzUBSu+alPaLiltFo1Qj96Ec9lhNEwtoimf5PYvs1pwfr5bXBWq8y2hcc+A01xv+8EmV7imkeiT/f/Sq9pWf4/2Jf8M1/5n2Pr4jww6WChWv3LBJjT1XHo6UwmeH3ByctXg21EN+7oEonI87wvoMlJdWsN6tCRRege6ajbRveYqh86Nge3Z+iOk6BKbBUPu8eA+oCWxVs9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=clGYfR5ULVp4thDBbsEpPzvUC2iYfUnWqcvnONNlTmo=;
 b=pTLX1fY6ouPqyTIz5zVd17iDsTRezs9YPxDdVMVIU9u0VWC4HCavpkXfCeIOETVHIX/7Lzc0rqTBv8OU3UdVWsqMVTPV6wFhb0d8Mrs6Q5oAp2jcjVVGzguz0FgLEFqio3o3VnpGFmnlMUsLC+5S0kPRXZwsdN1HJqBo6Z44E4GaKUylTYo5MkqGEF5A70nX1fT0oPWoznIdIXqnGuoCyievAJsyU9t/QqMq9+7ZWaV6ce+AK1bSD/+Gx/27Ku+e43VlvgSO+o5bV5ZhYj6ji2phwifjehm8rMdyWdW+NB8kLcLsqsTiUEdvavWKDH90+aNPuWOh7Ha4B6X4ZMfOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Fri, 12 Jun
 2026 15:20:07 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%3]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 15:20:07 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: RE: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Topic: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no engine
 supports it
Thread-Index: AQHc+eLVHcRnOb/1bk6keWnh8E37j7Y6bkYAgACW8YA=
Date: Fri, 12 Jun 2026 15:20:07 +0000
Message-ID: <DM4PR11MB545697EB075B02F75A046AF8EA182@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260611204154.2000148-1-shuicheng.lin@intel.com>
 <CH3PR11MB843495FBA81453F87689C03E8D182@CH3PR11MB8434.namprd11.prod.outlook.com>
In-Reply-To: <CH3PR11MB843495FBA81453F87689C03E8D182@CH3PR11MB8434.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SN7PR11MB7465:EE_
x-ms-office365-filtering-correlation-id: 39edd5a5-61d2-48cf-e688-08dec89615ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|56012099006|22082099003|18002099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info: SSFwqqaRaJ9DnDn4j15nbSs4/5LgD0GRPkUHiblznxwsfafCIPzFZFzmPxmSL2tE0H6y6l3ncjqcqJp6iKC6RXiuryHNVejk5xIdjG+s8KCP6r6yxHgfIKxWyg85pKdC6uNIJcklgc593JN9QexSxBVs84yZ0JvzqquCjpkBK5060TcNWdvxsdjdlTeE1WMZnj7Mgy+spKUjKk/DHOsTgj1iyDUWDmARYPWBM/QlHOsitrqGN3UL0uZOkrH40/EbfRLdhOiO+RCjc64LUPcWOxvImqygTW+q2/AJGh7f3jjEJ+nK847fVKZIsogbXbzwOsFUupRiZ5JlDBuruQN5G8hRdg3PFgalq0acw1BVC3uRvZ++qJS6Ohcul431qrFnzi34BMwYZZYFpFIDyL2hyWbGoojXpIqq+R8i5OFYJ0LfACf5/5DXrXQEBod4t56W4VVgA22JFLil//taziV2H1JYexIyFS9hq7+W3ghu0U9NEjs2Ve0KDzyPGWS14F/S3xK7Ke3xspK0V2p59TFzMBYgS9dli1MlLC4TRqiRwFpipAJYwzPmjqBAHe9y8/AE1tSyI3xs2P8uoCEfGeQquCad+fQdxJD/96mDfKL17uyZKrxG/NEvbw4mFyQ8sc57U5FWnKSJFLflHkiaipW62IMsP/ntmim77KxZ8hf5pA7WNcBz6QOEGcp4fXIXQvUlsaZLYnl5UfQo53AsEfZsDplgjiGf+GHmwnaq5bUQRNGMQvOpXlQNaPw4MGSvNjyu
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yHXselHt6iX7371mxmu68W/gbUakyfTJ5wjUQkU0r2tmnClBq8qNhyU1FnTr?=
 =?us-ascii?Q?O4bLinw6ILT+kPFYSgg1b4Fzc++47uM+RmJBPnx5sBsYiIjEf52RnD/NYBDx?=
 =?us-ascii?Q?PcUwpcs3WJxwfTQ59IB0sdJ9h1wUbTC6G1m4DTXYLPxuiMcRRADqApGDTio9?=
 =?us-ascii?Q?g2UP0MoythDSQLy7viBTPpZEP1Upp4dy29Mgm20hMzpfa7oSAE1uqnMht630?=
 =?us-ascii?Q?hW0JxRmkAkhd5Ly8wBYqzC9sgu4WKScF49mSRdUpsAC0eqyFxFrKB921bFqv?=
 =?us-ascii?Q?6p8HKi+RInYEBvMw3ziot16xVQ1vy+wgz6VRdNhu+hRJYG6seDam1exu1Gm0?=
 =?us-ascii?Q?wrWbLbjEDc3zDVQuEBzRwhh07jRw6Lnrlu1HjPKc9OggZurdLDOBxr8n0qWC?=
 =?us-ascii?Q?9/vFXgm/VBnASiBQfWQ+sWWt2YBNTcIycXL3EtMVyUizJDWGMkgxhtKZFA/p?=
 =?us-ascii?Q?+8TkzLfTEJpoqB3AadamAaZhT0tz6IRsEM7sx8z5WVqhzh+mLlaCsTymZuVi?=
 =?us-ascii?Q?onk01QSZfU6FtAZOMRk5wOtfq7CnYuhlaYorHRjrPXc+kzpHe1NGxUDTZCnm?=
 =?us-ascii?Q?Z3HBkkzkWSYRNNqm8LwYnFEoncOu6YOBfxJJPfeX7Y6Ab4ZHuduFCtkxcv4F?=
 =?us-ascii?Q?8ahIzcUWt1NrdmgR112frIcXyiyNQO1AdE0JznOmKc/g2ZVRxsPMEC4kBY1M?=
 =?us-ascii?Q?XU9+aaZF1vbEtySfp4OlefwonZtr8X/aqNlmTZPLI+oCJARtr6IJfNyqICqW?=
 =?us-ascii?Q?QLfFUnO24RpuEF1mVVj13rKWv9uedPwZm5rLSFjVUoi3WrfgCZCr93y+GYxG?=
 =?us-ascii?Q?/HtU56fgq94B4tQKQ+I4KnebkRlS3zNf5ZEDWLs/6oda9182AjulOF7XL0wh?=
 =?us-ascii?Q?r/hJ26l4s61fpPYFMMIFnHPNOCrcGrLolGbYZ6QnWbSHuANAg+AmOVvYsmMG?=
 =?us-ascii?Q?kRKL40FZ8K+coM+oo7xNc9d8Q3YWvEsaQFM7LaM9/gVIsE1ZXzHD4JLUqyAM?=
 =?us-ascii?Q?AwQomPikB0b+LQRDwUcQa9ucwe9YOmgy/IHzFt3GUsnoz9zAVLesy74REhFj?=
 =?us-ascii?Q?4f3p4YhJYdVHXWUHJgtWziY784EW2lZbsYI1nLUFLDbSwJ7JWFJExebt0XL2?=
 =?us-ascii?Q?t1cK4hRb4i/DRcc6kr9/aSVXm5agqnauYmwwFiWIl1smUpb5IIxue6RvOAsS?=
 =?us-ascii?Q?RExaWkVQFVsZHxpMOUSCDOPa/H1e1qKfa/G+24hAYPhQ3gBuNGOwZlfUWtpQ?=
 =?us-ascii?Q?R/VvyTKxoTJrxd7xFZPkqVDUd/II/YFwuuWaKl+VecC7UmuyNmxbVGZeRHfP?=
 =?us-ascii?Q?m04L4Iaj3h0FIRUaKsW4Yjeg+eQuLQI6h6xQ/gTEbJDzekM6yZoLp9fpVSYn?=
 =?us-ascii?Q?KhGWoGKC8h9Ym6mTJpbWIBcsoWhAMiuRTHGrv7Oppg+xhSQCetdnZvxylejR?=
 =?us-ascii?Q?GOcOd1ZoAIhhBeGEIALYnkL4BmIM0v/kKJMIg4oYV8luKKfrx7mcqOH5+y5i?=
 =?us-ascii?Q?MnY+c/ac/Zk8qpfyqOH2KU2eY8xkLwNqSUZQzZ6QSq0tBk3bje4nayoFFuEf?=
 =?us-ascii?Q?ZZHhj8FbafJTTY3NGLbI37sQhiCfMVtqhaNvk6SveTPGfhQpNL+13EcAtZ4M?=
 =?us-ascii?Q?eaMnt871QyL17rdEI/aSyq90wHKosZYUEijnxnOgUefmhxvklRWEbeDd9ITi?=
 =?us-ascii?Q?orlJrjS3GQIKQy6pB+6mkzE1uuMZ43RElrDF2m+8Sb7dhmLORnFkgVUE69ZS?=
 =?us-ascii?Q?rdVOJAXxYQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: SrfJgnbQx3jDjcyrabhkEnOO7ASFLgBMpcSS9VTUDqTqWmElrU+8Ra/FBera+8jzJZqKiIpNHftAThjACaRGjYk0l3fumU/pWFs4b+4XCckBPaBDaiNJ+CIipIqDFdA9aQE19UmU/+xYSnkGo4S3JJBCpzrh5R1WdIo2Lbizbomni00Lunl9C6CuG351pGRNN1WIep/COj6hbgwZqWUA5GIGrQ0U9RMal89/lAkmiCoduKUAdGxSgSWSFyKshr9ECuWWrLBlA9Z4R8vwc6QMBSenKBa4cfG8OBRpMrA3XSaWlosUl62RsEZ0I9cTRuAi5WiVWTbfvhjB6Htf0yKhug==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39edd5a5-61d2-48cf-e688-08dec89615ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2026 15:20:07.1220 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ooo/CRhj3TATToW9qyprzgO1RT2NAx/iC8geoBx6sShZ6F73YM1wN4Ram/JyYkMo+lvA3+hhY5q+X3dnHedcrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

On Thu, Jun 11, 2026 11:02 PM Priyanka Dandamudi wrote:
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Shuicheng Lin
> > Sent: 12 June 2026 02:12 AM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Lin, Shuicheng <shuicheng.lin@intel.com>; Vishwanathapura,
> > Niranjana <niranjana.vishwanathapura@intel.com>
> > Subject: [PATCH i-g-t] tests/intel: Skip multi-queue tests when no
> > engine supports it
> >
> > When no engine supports multi-queue, xe_for_each_multi_queue_engine()
> > iterates zero times, causing subtests to report SUCCESS without
> > executing any test logic.
> >
> > Add xe_has_multi_queue_engine() helper and use it as an igt_require()
> > guard in all multi-queue subtests so they properly report SKIP on
> > hardware without multi-queue support.
> >
> > Suggested-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  lib/xe/xe_query.c                 | 16 ++++++++++++++++
> >  lib/xe/xe_query.h                 |  1 +
> >  tests/intel/xe_exec_fault_mode.c  |  1 +
> > tests/intel/xe_exec_multi_queue.c
> > |  1 +
> >  tests/intel/xe_exec_reset.c       | 22 ++++++++++++++++++++--
> >  tests/intel/xe_exec_threads.c     |  1 +
> >  6 files changed, 40 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c index
> > 3286a3b37..27e471840 100644
> > --- a/lib/xe/xe_query.c
> > +++ b/lib/xe/xe_query.c
> > @@ -346,6 +346,22 @@ bool xe_engine_class_supports_multi_queue(int fd,
> > uint32_t engine_class)
> >  	}
> >  }
> >
> > +/**
> > + * xe_has_multi_queue_engine:
> > + * @fd: xe device fd
> > + *
> > + * Returns true if any engine supports multi queue, false otherwise.
> > + */
> > +bool xe_has_multi_queue_engine(int fd) {
> > +	struct drm_xe_engine_class_instance *hwe;
> > +
> > +	xe_for_each_multi_queue_engine(fd, hwe)
> > +		return true;
> > +
> > +	return false;
> > +}
> > +
> >  static void xe_device_free(struct xe_device *xe_dev)  {
> >  	free(xe_dev->config);
> > diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h index
> > 8815c6c66..9f04a7422 100644
> > --- a/lib/xe/xe_query.h
> > +++ b/lib/xe/xe_query.h
> > @@ -163,6 +163,7 @@ uint16_t xe_dev_id(int fd);  int
> > xe_supports_faults(int fd);  bool
> > xe_engine_class_supports_multi_queue(int fd, uint32_t engine_class);
> > bool xe_engine_class_supports_multi_lrc(int fd, uint32_t
> > engine_class);
> > +bool xe_has_multi_queue_engine(int fd);
> >  const char *xe_engine_class_string(uint32_t engine_class);  const
> > char *xe_engine_class_short_string(uint32_t engine_class);  bool
> > xe_has_engine_class(int fd, uint16_t engine_class); diff --git
> > a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
> > index 3e92dfbd9..58509db14 100644
> > --- a/tests/intel/xe_exec_fault_mode.c
> > +++ b/tests/intel/xe_exec_fault_mode.c
> > @@ -445,6 +445,7 @@ test_exec_main(int fd, int n_exec_queues, int
> > n_execs, unsigned int flags)
> >
> >  	if (flags & MULTI_QUEUE) {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_exec(fd, hwe, n_exec_queues, n_execs, flags);
> >  	} else {
> > diff --git a/tests/intel/xe_exec_multi_queue.c
> > b/tests/intel/xe_exec_multi_queue.c
> > index d9d648b02..3d9e168b2 100644
> > --- a/tests/intel/xe_exec_multi_queue.c
> > +++ b/tests/intel/xe_exec_multi_queue.c
> > @@ -1094,6 +1094,7 @@ int igt_main()
> >  	igt_fixture() {
> >  		fd =3D drm_open_driver(DRIVER_XE);
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> If below condition is used then the above platform support check is not r=
equired
> either one of it should be present I think as the below require would mak=
e the
> tests skip on unsupported platforms or engines?.
> --Priyanka

Yes for latest kernel, but may return false positive with old kernel for pr=
e-35 platform.=20
The check relies on line "multi_queue_engine_classes" in "info" file existi=
ng in the debugfs.
If it doesn't exist, xe_engine_class_supports_multi_queue() will fall back =
to the hardcode default which does not do IP_VER check.
So, if run this IGT in older kernel doesn't have this key, or kernel with d=
ebugfs disabled, xe_engine_class_supports_multi_queue()
will return multi-queue support for pre-35 platform also.
It seems better to keep this IP_VER() check.

Another option is to move this line to inside function xe_has_multi_queue_e=
ngine().
What is your idea about it? Thanks.

Shuicheng

> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  	}
> >
> >  	igt_subtest_f("sanity")
> > diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
> > index
> > 19643b887..20be33736 100644
> > --- a/tests/intel/xe_exec_reset.c
> > +++ b/tests/intel/xe_exec_reset.c
> > @@ -1103,6 +1103,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cat-error") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    CAT_ERROR | MULTI_QUEUE,
> > @@ -1112,6 +1113,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cat-error-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    CAT_ERROR | MULTI_QUEUE |
> > @@ -1122,6 +1124,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-gt-reset") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		ignore_gt_reset_warnings_in_dmesg();
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16, @@ -1132,6
> > +1135,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cancel") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    MULTI_QUEUE,
> > @@ -1141,6 +1145,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-cancel-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(fd, hwe, 16, 16,
> >  					    MULTI_QUEUE |
> > SECONDARY_QUEUE, @@ -1150,6 +1155,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-close-fd") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(-1, hwe, 16, 256,
> >  					    CLOSE_FD | MULTI_QUEUE,
> > @@ -1159,6 +1165,7 @@ int igt_main()
> >
> >  	igt_subtest("multi-queue-close-execqueues") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			xe_legacy_test_mode(-1, hwe, 16, 256,
> >  					    CLOSE_EXEC_QUEUES | CLOSE_FD
> > | @@ -1169,6 +1176,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-cat-error") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16,
> >  					  CAT_ERROR | MULTI_QUEUE);
> > @@ -1176,6 +1184,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-cat-error-on-secondary") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16,
> >  					  CAT_ERROR | MULTI_QUEUE |
> > @@ -1184,6 +1193,7 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-gt-reset") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		ignore_gt_reset_warnings_in_dmesg();
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(fd, hwe, 16, 16, @@ -1192,6
> +1202,7 @@ int
> > igt_main()
> >
> >  	igt_subtest("cm-multi-queue-close-fd") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(-1, hwe, 16, 256,
> >  					  CLOSE_FD | MULTI_QUEUE);
> > @@ -1199,21 +1210,27 @@ int igt_main()
> >
> >  	igt_subtest("cm-multi-queue-close-execqueues") {
> >  		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe)
> >  			test_compute_mode(-1, hwe, 16, 256,
> >  					  CLOSE_EXEC_QUEUES | CLOSE_FD |
> >  					  MULTI_QUEUE);
> >  	}
> >
> > -	igt_subtest("multi-queue-long-spin-many-queue-switch")
> > +	igt_subtest("multi-queue-long-spin-many-queue-switch") {
> > +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe) {
> >  			xe_legacy_test_mode(fd, hwe, 4, 8,
> >  					    LONG_SPIN | MULTI_QUEUE,
> >  					    LEGACY_MODE_ADDR, false);
> >  			break;
> >  		}
> > +	}
> >
> > -	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch")
> > +	igt_subtest("multi-queue-long-spin-reuse-many-queue-switch") {
> > +		igt_require(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0));
> > +		igt_require(xe_has_multi_queue_engine(fd));
> >  		xe_for_each_multi_queue_engine(fd, hwe) {
> >  			xe_legacy_test_mode(fd, hwe, 4, 8,
> >  					    LONG_SPIN | MULTI_QUEUE |
> > @@ -1221,6 +1238,7 @@ int igt_main()
> >  					    LEGACY_MODE_ADDR, false);
> >  			break;
> >  		}
> > +	}
> >
> >  	igt_fixture()
> >  		drm_close_driver(fd);
> > diff --git a/tests/intel/xe_exec_threads.c
> > b/tests/intel/xe_exec_threads.c index 2f44d5555..cf8fec6c6 100644
> > --- a/tests/intel/xe_exec_threads.c
> > +++ b/tests/intel/xe_exec_threads.c
> > @@ -1723,6 +1723,7 @@ int igt_main()
> >  			if (s->flags & MULTI_QUEUE) {
> >
> > 	igt_skip_on_f(!(intel_graphics_ver(intel_get_drm_devid(fd)) >=3D
> > IP_VER(35, 0)),
> >  						"multi_queue is supported on
> > graphics version 35 and above");
> > +				igt_require(xe_has_multi_queue_engine(fd));
> >  				/* Balancer can't be set with multi-queue at the
> same time */
> >  				igt_assert(!(s->flags & BALANCER));
> >  			}
> > --
> > 2.43.0

