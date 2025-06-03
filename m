Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126E4C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 19:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF1F910E723;
	Tue,  3 Jun 2025 19:38:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSThY/0O";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6A610E712
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 19:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748979515; x=1780515515;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F0RwyvBofio7g30bkmsI76VCQmvJynEYjGkr2rY9sCo=;
 b=eSThY/0OZZasuxfl8Bnk7yqs51CsgCU25WJ8Sk0+eccxEaggXLx4VUBE
 QrtrxUleR48mpVbjJVba2+QlOCwmGVHxvzUyVQPT9vZYnPRPVkpIxVZr1
 YWOBZuDpnlvttgJ2HKbBaQW684vrROkVaHEMZm5nzj07taqWGjXHppS+1
 +VVXcv5XGReJ9lzNB/MnQ11KhaO4Xrtt/Cpk6PJ7myNkc8UKOLc8LFkMB
 85TktHBsRREndiby+ap4tt5hk3Olt3/S3SV3YLMzCUaPE+jc8WUvI3Hor
 fCUkfLXs0aMVNk9T1WxRGH2K+GuCflL1fmiYT3H/XEwwK8qMmEuBVXA26 g==;
X-CSE-ConnectionGUID: l0xyirZKRRiS5gZ0oy44JQ==
X-CSE-MsgGUID: YmqORgU7T32ifi4KdP5BeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68473694"
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="68473694"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:38:34 -0700
X-CSE-ConnectionGUID: iXphr2HhQXW0Ud7aGxnSaw==
X-CSE-MsgGUID: ghdfnIzFTuuhfVfzq5Jsfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,207,1744095600"; d="scan'208";a="150109268"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 12:38:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 12:38:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 12:38:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.71)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 12:38:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aw17i1khYQwDdJSh67dmTsf3mrVMiQjWgsYNTiGAhWo2OpuLXhz5sY9VkUr6WINVu3B1fcmhseHyzs8dnOST2o3ai8iLsQomS21I5u9NqfHiu8B/zTavSfGUmIFzqnk14OTKTnlyzVBnRHtxFqAAlSTLYVEzBpowdSDHqS31fsNHNKpiryNMJ2gDz+e9wmiNA8iurPFSLtdu1nw7bvCfvJ0Jcb+fsCPR3gcB6twjGtOJwyxEb7hM9eZvzwL0drCGyrnxtgPcaYj1KXq8pFad6d0NUq3GLgGDZplek9cMPDH6rOObvUGyKdUBSTzcucaZe4lwdjCNuqZb1xj0w84QAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/mXiyfXFXtqGvuuwCeVMPXhVi+v/Nax68hEE34Rkqw=;
 b=dWaLpOtoNZM6NeUV7nfIgx/EbSJpJCTm9c79nYzxxsGUp5sb8vupDIo+5QV//6vyT78s1R0eIKweeF+xfNyqIh/ew79Ztsa5cLBYCYSDl2Kp//nt6dX0FOZ/jB3XK0iiBrYWWbx/oYgLHJtVK8hF1c1JdyDOxx9fGjJcdPd4qeCHaj8nj1e5Nq9Oedjk9a3TjAsH8IrA+okCPrDCGIKXKf2k4HlVNpkHVKqaLs/ZWa+PKibD/Tvgoy1vBoCrV8yQPTlXVeFxrG/R2x1gDgyxefKNj6KPXm55WbBT2DsCbMz6anBdzLjzdwMjV5JMji0rklhGLzO6UUKgOrOhQusjHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by PH8PR11MB6779.namprd11.prod.outlook.com (2603:10b6:510:1ca::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Tue, 3 Jun
 2025 19:38:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 19:38:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>, "Wajdeczko,
 Michal" <Michal.Wajdeczko@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Topic: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors
 while injecting fault
Thread-Index: AQHb1L7a724NKO4yE0KdmVQH5hqmBrPx1Epw
Date: Tue, 3 Jun 2025 19:38:30 +0000
Message-ID: <CH0PR11MB544465CC3CE07DD3E7921CDEE56DA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250603193640.630957-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250603193640.630957-1-jonathan.cavitt@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|PH8PR11MB6779:EE_
x-ms-office365-filtering-correlation-id: ffc65e03-3642-449f-68bc-08dda2d6382e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?F4rlVDnbOrNiSAKOE/JvFWjzlR+5OQjembJMVqC29g3Vt4FK9RJFeHVRPNzs?=
 =?us-ascii?Q?rQV4w+DmpWZKpEn1c7qsXvNjdELGRWVxaJCWo7NlAMb/JD+lOFfZRMp0rHAz?=
 =?us-ascii?Q?kfqRg8kSdhAwxvKohXFc7osZdO+yjvUgx2Lp6vnRySLjKsBsivVaBJcntMND?=
 =?us-ascii?Q?bF5ZHCe2zuhVZ8Uk4houl1gYX1dlgICgmpAQfOe48nGv0dDSlbuGYjaMvApx?=
 =?us-ascii?Q?9F+1AFDk9UXQ4Mlc++I7eTgCQcp2OGjRk3Hw84NXJkI2sM3Tyvr9ptQIKjBd?=
 =?us-ascii?Q?vr17raS59L3QUkDjsaLJ/tPZkVxEMlWADo+f+CPZcIkNlav/uZnJiX6lHgkz?=
 =?us-ascii?Q?inMPOtIXVHDOPuk0S4w3riMluMtvzIGBNbVt+xjQeBNB5MT+hF83BPVfStbq?=
 =?us-ascii?Q?nmAaPwZr75JegB7CWF+jtgUiWAzlgNw2LDX+2Ozl9E843A6mr0lhyqFlTipZ?=
 =?us-ascii?Q?ykb04yr7DxsDrcR16RsHorkDzeGkMSb62DcLhRx1UbGhtpMmXUfbQ/oDsb5q?=
 =?us-ascii?Q?Cn6Qg8gRXjQJYm7a5mIcFubL/gYvSCb2YQXaJ68fJkYzGrhmzBtibeErHmq6?=
 =?us-ascii?Q?TKYZziDiVv83wfHcJkd5O+tyvWsfYrxtJ7sZBFF5YQFxBuAlZUO5CWu3iMp0?=
 =?us-ascii?Q?dN4yc6Pe8vhvKnetDjdtgiSkyO8cg5hHtXqcaEkkXOYi9zDXh52/i2WYDkMa?=
 =?us-ascii?Q?gt2qIdJts2b4aN6TZO7oqeWuGfocD7qnJE8sc12on6NxqAqYHRuRZ9aU4FYh?=
 =?us-ascii?Q?ZpbRCmf2gkA5TTX1yhGchLMWjq/zOTZ3/lXdt2MR75G/WyW9AqPWonC9ugag?=
 =?us-ascii?Q?HWK4ADXPmnsR9KMM/Xa9xKNRiqlnVLCBmPz95l7hM0Xrg6fDF0Nm/4SLHS5M?=
 =?us-ascii?Q?u4NU3l1mUWv0MZ9aq6Ho/DkLKSSXTpu118tL0rq6Kpjzqat7204KMRhbcbaR?=
 =?us-ascii?Q?lAkkqPPsI6VSrcRdWQr3SlBJeJT3iW5SNND6WPox4Bjqu97nLnES1RKJh155?=
 =?us-ascii?Q?kQyZmrgOLW0+VgsAFpaRikSvtqeUHJg8v9AkQwSQC/PuWleTO3N9wQGtj74A?=
 =?us-ascii?Q?tEgBeU5fpitRfazLVCW3BQgbYFMsgVNHr8yEqEPZBYNrKBmGTfxRxd8IQ95G?=
 =?us-ascii?Q?6VrBUk2MBOVxkwOWDl5mbwwdgSBrV98C1jYQ0fSKHLVAtmbcKBmZVWwyHmEm?=
 =?us-ascii?Q?ZohQrCFRKDwM9OIWmpKCVBlGYstAwhuaDxEAnyRld31PWa+ianQZsoZnS3EI?=
 =?us-ascii?Q?MO5x/YN1Y/H+zTXfBq7xPqIeceSs4gQG7S6QUH901FzEK/z7aE29rztjAOMv?=
 =?us-ascii?Q?OwCFRYSn7OeGUMGXPWSdGyChWZdNvxFC/VFuplGZqzoXWKXwuVjYpjpf1to4?=
 =?us-ascii?Q?gNnNchoO1AhuwO7ChEEmBhpMVgj26VHy1behRFCFXlo1QMYDBvgrl+isjprT?=
 =?us-ascii?Q?3KqBhiYsQ5kXAF99pLnosKgQiQWpUAOMHqX8hHPyQU7T6k++DvSc8ELAI97x?=
 =?us-ascii?Q?tzOzkMt645xMmEM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?NCAdz+rUDUkOCrUk8eFs/mlsDXk3lX1xWeTfD60q30ekbdXZ7sa+ql8l7wfY?=
 =?us-ascii?Q?3SFKsQ1E7sykLqKUZJdlbRnH2plKSv/bq3prdDCOWMWzVwe3xXe9dtQjO2wP?=
 =?us-ascii?Q?0jE3OZBZfGx9fb5To0rFL8+wycRYDyp/D0fo6q7Zvuq3cvt9s5Wqh6K0Pal6?=
 =?us-ascii?Q?uSq30zs1ab6OZz1LAlX1TGXVCNRFg1qOPOym7lJjiZox4XpOzJ1ODgdn0A5u?=
 =?us-ascii?Q?sQSBeqiI3qMo4v8UEawIW3TjswhQuGwbtvwV0PQpdyuvJlMg39h9VTnGkYvl?=
 =?us-ascii?Q?pCa4NfpDl4ahV6JOAxR0pn02Cy7cfQW9lfM8P9ik3rY/JlbvUI/zXAdb4IlK?=
 =?us-ascii?Q?6wLxOpPlqKqMhU0VwupkL4Bai9+80yc04Xe1wnI67atY5xIs7fPWq793U29n?=
 =?us-ascii?Q?vF4/dQzYfKy6S9cJIQ3PFshX8epvz9kVhDZMK/Zi1vn5DHJ/MmNXVjsMxScZ?=
 =?us-ascii?Q?NmvWS5OYRj4Cj2+xsCQQ9ajrGwLle5fHa9m8HUQ8JotRS1vkyjNon+NfTMLn?=
 =?us-ascii?Q?6/mf2GDxJhv5J9Jl0CYoRlfhchtaHx95BH6JQOFArf+ulDHV9ddsFCZ/cRNy?=
 =?us-ascii?Q?/3xSqEtxwMCBvjzTFfmGDWmYk9yzblkrQG7+lyfMukePz9EjZe2nry/Wl52w?=
 =?us-ascii?Q?WC49RRB1In+DtugobT4ym2IP4QVMpdXl9Xc5bEJroT7JDTXQqM6FIuFryaq/?=
 =?us-ascii?Q?jXYsMDdLO844uFZj5NRkO3m5VEbduisf7pUkt3vCj1ElHbo5WIM4Sh41AqxF?=
 =?us-ascii?Q?EShFHpZLCll6S+1LwQ5etwXUg5Ad7iKM5BJA0LyDWgX9hKLqTg5kCrbfsc6E?=
 =?us-ascii?Q?1zGWrXwyj+rYaseULp1nWhVePZLKGzWMDkIKgVqR9tNgyMdzyIySsI+Pn+mt?=
 =?us-ascii?Q?ZQt9/fDRLLw2RUmGAqwCVc60FZPe13geeDDgzRmZlXB51opZGZsORTdHyQcb?=
 =?us-ascii?Q?JOwn+PKYUJzKfdPRRKYFw3rjvIPQyG3EYd9XANzntIs4Ow7Jtjiy4UtMdzUq?=
 =?us-ascii?Q?j9s/q162XhoBZJ1D321aroAlCPOrnCjvKdOFc9Ohw9IUbt4aR8sGr+mMwXyd?=
 =?us-ascii?Q?j9u/tsz4aG22zmoCxQpsIxitsbvKgOFEol25FXMSy+mcUvT+Ngdll5o28kIz?=
 =?us-ascii?Q?8BtgdNBvbHkAmXyoI5raRLUFSE7ET5OYJyu5M8tmDy57Q8m3x06hX8utz17S?=
 =?us-ascii?Q?qOy/IW6a8F+pZRbUWzZCV16P9N18bKIpgkfl3TCiNF2JkwJDGS9id6UWM5OD?=
 =?us-ascii?Q?CrG9dGnoDJvhKxuGndFBOxH5RmviSRyjBtsR63xANMGr1K7F4zmdjpmy97gR?=
 =?us-ascii?Q?NxB9+wf/GrQMFvpTMnMCDz5VMTon11bwbFEHVNBRWd7tY/2KFcwXO31AlHPa?=
 =?us-ascii?Q?Ib0w5lMfaeyXrV5xgjiw6XUSg+rIapgnU2+pC5OjXnwqOtBHLPT8GyfZO0Ur?=
 =?us-ascii?Q?AM/VEIs0UF9ST1llMsj6qURWPT74NOPv/0ktPP6rc8kpikURuxa6r4NW7JAO?=
 =?us-ascii?Q?P+C/z3hlsF1B8PVlegSx/ONfgKbHH1slnsUaPvfBU8GVmFdHP9KZhOoR57hn?=
 =?us-ascii?Q?yn+LmbZvg5Jw+bRnemSPcRIVrMgtSMFaIHqkP3PO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc65e03-3642-449f-68bc-08dda2d6382e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 19:38:30.5648 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f+AAt1VVRV6B1Qkb+y1Sh+yOm6P+9DVtQhOQtKt4DznSvgLDryYKoUvHRzr4zKMigMh0ARUN8snLfT4u8biNlyw0z+p/BYtza38fPI8iQJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6779
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

Fixed the weird thing.  For a second I was worried I had accidentally
squashed the patch with another unrelated one, but it turns out I=20
had just accidentally applied a whitespace replacement command
too aggressively.  It's fixed now.
-Jonathan Cavitt

-----Original Message-----
From: Cavitt, Jonathan <jonathan.cavitt@intel.com>=20
Sent: Tuesday, June 3, 2025 12:37 PM
To: igt-dev@lists.freedesktop.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; K V P, Satyanarayana <sat=
yanarayana.k.v.p@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=
; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>; De Marchi, Luc=
as <lucas.demarchi@intel.com>; Dugast, Francois <francois.dugast@intel.com>=
; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Harrison, John C <john.c.harrison=
@intel.com>
Subject: [PATCH v2] tests/intel/xe_fault_injection: Ignore all errors while=
 injecting fault
>=20
> From: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
>=20
> Currently, numerous fault messages have been included in the dmesg
> ignore list, and this list continues to expand.  Each time a new fault
> injection point is introduced or a new feature is activated, additional
> fault messages appear, making it cumbersome to manage the dmesg ignore
> list.
>=20
> However, we can safely assert that all dmesg reports that contain
> *ERROR* in their message can be ignored, so add them to the dmesg ignore
> list.  This unfortunately does not include the device probe error
> itself, so that must be added separately.
>=20
> While we're here, we should also assert that any errors we see are only
> coming from the target PCI device.
>=20
> v2:
> - Only ignore error-level dmesg reports (or, at least, reports with
>   *ERROR* in them), and device probe failues
> - Add PCI data to regex (Michal)
>=20
> v3: (Michal)
> - Revert name change
> - Add change log
> - Remove fixes tag from commit
> - Rename ignore_faults_in_dmesg to igt_ignore_dmesg_errors_from_dut, and
>   move to lib/igt_core.c
> - Minor code fixes
>=20
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Suggested-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: John Harrison <john.c.harrison@intel.com>
> ---
>  lib/igt_core.c                   | 27 ++++++++++++++++++++++++
>  lib/igt_core.h                   |  1 +
>  tests/intel/xe_fault_injection.c | 36 +++++---------------------------
>  3 files changed, 33 insertions(+), 31 deletions(-)
>=20
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index b06cdfd894..e666660ff3 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -76,6 +76,7 @@
>  #include "igt_rc.h"
>  #include "igt_list.h"
>  #include "igt_map.h"
> +#include "igt_device.h"
>  #include "igt_device_scan.h"
>  #include "igt_thread.h"
>  #include "igt_vec.h"
> @@ -3581,6 +3582,32 @@ void igt_emit_ignore_dmesg_regex(const char *ignor=
e_dmesg_regex)
>  	igt_kmsg(KMSG_INFO "%s%s\n", mark_ignore_dmesg, ignore_dmesg_regex);
>  }
> =20
> +/**
> + * igt_ignore_dmesg_errors_from_dut(int fd)
> + * @fd: The file directory
> + *
> + * Submits an igt_emit_ignore_dmesg_regex request targeting all error-le=
vel
> + * dmesg reports (or, at least, reports that contain the string *ERROR*)=
,
> + * as well as any device probe errors, that are reported from the pci
> + * slot of the given file directory @fd
> + */
> +void igt_ignore_dmesg_errors_from_dut(int fd)
> +{
> +	/*
> +	 * Catch any dmesg reports that contain the substring "*ERROR*", as wel=
l as any
> +	 * device probe errors.
> +	 */
> +	static const char *store =3D "probe with driver xe failed with error|\\=
*ERROR\\*";
> +	char pci_slot[NAME_MAX];
> +	char regex[1024];
> +
> +	/* Only block dmesg reports that target the pci slot of the given fd */
> +	igt_device_get_pci_slot_name(fd, pci_slot);
> +	snprintf(regex, sizeof(regex), "%s:.*(%s)", pci_slot, store);
> +
> +	igt_emit_ignore_dmesg_regex(regex);
> +}
> +
>  /**
>   * @igt_measured_usleep: Helper to model accurate sleep time for tests
>   * @usec: usec to sleep
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 2db579423c..f6affbaf57 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -1599,6 +1599,7 @@ int igt_pci_system_reinit(void);
>  void igt_pci_system_cleanup(void);
> =20
>  void igt_emit_ignore_dmesg_regex(const char *ignore_dmesg_regex);
> +void igt_ignore_dmesg_errors_from_dut(int fd);
> =20
>  unsigned int igt_measured_usleep(unsigned int usec);
>  #endif /* IGT_CORE_H */
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_inje=
ction.c
> index 9fe6bfe351..594c1417a2 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -64,32 +64,6 @@ static int fail_function_open(void)
>  	return debugfs_fail_function_dir_fd;
>  }
> =20
> -static bool function_is_part_of_guc(const char function_name[])
> -{
> -	return strstr(function_name, "_guc_") !=3D NULL ||
> -	       strstr(function_name, "_uc_") !=3D NULL ||
> -	       strstr(function_name, "_wopcm_") !=3D NULL;
> -}
> -
> -static void ignore_faults_in_dmesg(const char function_name[])
> -{
> -	/* Driver probe is expected to fail in all cases, so ignore in igt_runn=
er */
> -	char regex[1024] =3D "probe with driver xe failed with error -12";
> -
> -	/*
> -	 * If GuC module fault is injected, GuC is expected to fail,
> -	 * so also ignore GuC init failures in igt_runner.
> -	 */
> -	if (function_is_part_of_guc(function_name)) {
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT .-ENOMEM");
> -		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed: -ENOME=
M");
> -	}
> -
> -	igt_emit_ignore_dmesg_regex(regex);
> -}
> -
>  /*
>   * The injectable file requires CONFIG_FUNCTION_ERROR_INJECTION in kerne=
l.
>   */
> @@ -234,7 +208,7 @@ inject_fault_probe(int fd, char pci_slot[], const cha=
r function_name[])
>  	igt_info("Injecting error \"%s\" (%d) in function \"%s\"\n",
>  		 strerror(-INJECT_ERRNO), INJECT_ERRNO, function_name);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
> =20
> @@ -299,7 +273,7 @@ exec_queue_create_fail(int fd, struct drm_xe_engine_c=
lass_instance *instance,
>  	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_q=
ueue_id), 0);
>  	xe_exec_queue_destroy(fd, exec_queue_id);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queu=
e_id) !=3D 0);
> @@ -334,7 +308,7 @@ vm_create_fail(int fd, const char function_name[], un=
signed int flags)
>  {
>  	igt_assert_eq(simple_vm_create(fd, flags), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_create(fd, flags) !=3D 0);
> @@ -397,7 +371,7 @@ vm_bind_fail(int fd, const char function_name[])
> =20
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert(simple_vm_bind(fd, vm) !=3D 0);
> @@ -445,7 +419,7 @@ oa_add_config_fail(int fd, int sysfs, int devid, cons=
t char function_name[])
>  	igt_assert(igt_sysfs_scanf(sysfs, path, "%" PRIu64, &config_id) =3D=3D =
1);
>  	igt_assert_eq(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_REMOVE_CONF=
IG, &config_id), 0);
> =20
> -	ignore_faults_in_dmesg(function_name);
> +	igt_ignore_dmesg_errors_from_dut(fd);
>  	injection_list_add(function_name);
>  	set_retval(function_name, INJECT_ERRNO);
>  	igt_assert_lt(intel_xe_perf_ioctl(fd, DRM_XE_OBSERVATION_OP_ADD_CONFIG,=
 &config), 0);
> --=20
> 2.43.0
>=20
>=20
