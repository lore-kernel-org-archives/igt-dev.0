Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E26C0219E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 05:37:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C72310E2E1;
	Tue, 11 Feb 2025 05:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WrAAL36E";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777E310E2E1
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739252249; x=1770788249;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CMFCV5DyChiSCl4fphhGJoposdEPETr0hlcF6+VnAAI=;
 b=WrAAL36E7oDfli4OOtu9COaJ5hSgP+yfjjmp8WXNB5xKgwzPmXcZGDxW
 5cKIydlgum51Bhfm9JpcCVWGdIUMCNSDX1Qm392UzbYrj3gy8pBS6pUCK
 19AcuqFCqxYX7kGl7E998eGS/lTA4DaklBfQW/gFPnlOsjhb/qTrQS7Yp
 1hohPshfmsZRxE6+2VuCm0+G/THvB+m0lfOtriD5Yv5gWP8kDDqYbiFIj
 nMq5NDrlXt6YDL8HZfvA+eh4X7J+ei0CLOCsOC65T8DnGLzhl55Q+yiAy
 0LJBrpQvzJ/REX+Dxw5vqBEa9S8VIiA5vgzZVJ2jTtrc6u+uwHTSItreX w==;
X-CSE-ConnectionGUID: 7kFeuaUZTfKP2M7+HCiK8Q==
X-CSE-MsgGUID: pUUrfXxZSaywf37wDKUAQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50492564"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; d="scan'208";a="50492564"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 21:37:28 -0800
X-CSE-ConnectionGUID: fthHuQFvQjaaXg4G21TveA==
X-CSE-MsgGUID: OJei2u6eRUiEMoDuoOWz3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117022912"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 21:37:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 21:37:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 21:37:27 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 21:37:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsPGwRhSm0YN4iqp/Dd7sP5fR6+kPqEh0ScN2RxSiMECvVJ33wG65gDiWeM/Bx0uniTYWEkAdwhn/H1rno5XUE8KG2+Pilyoge22saz6i073H0q37sUbQzdwWAY7VpzrPKVj4jyWmHLM6LjATV0uVlcjIFBu/xZSptAj1MLGVyj+Dt8KhqmDdexZ72wPhAEtXsfBPD/LIx0ozHoDT8oJFPiqxT1kTyr3Rx0ehmlhOfMbqY/yVE23I4baSgzpB1Y3gsYcwjRwL5rdxDBa2eMBApW1NjILoi2Rd8R5oB7jPvQ49ySKndPkIDUUtUYa6Dy1X4+i7RypCGyeLKJjAQb7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A190pWPHxxMIKtmYSaYPUxgVMkT7wD+WIQ023OvomMw=;
 b=NIbogZrxIxqjcx0MMhS8SW02kmlFysu8teiK4gN6ZMRARmfRb71rzvOuHx2pIzKm5/tOL4TW58AINKhMccnXbIWVHZtYT2tvNuge2ifXbHS3kJND+pmjPNpv0FiLl9mpLvQ7BHahsaucYzZ0Pffpb8m8f2OHHaweabu2IVVtShfVrBdhw8Bhk2MeAU36A0DHx9E+eXCqI6D6M3h0KCdUw3CrcGdGcjFp3qGVOXSt8GJ3aFssCZZrSjxhhxsNPtxoujcYP/ZS81ijk1lL+TwO15dhHYDAAW39flrVjbaOo0EvnRmMd0dyVL4/AoFm/id537MV+Sc13Crj4JV/sTL/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by PH0PR11MB5016.namprd11.prod.outlook.com (2603:10b6:510:32::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 05:37:19 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::603f:cea2:4626:ac38%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 05:37:19 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] tools/intel_error_decode: Enable support for xe
 driver in the tool
Thread-Topic: [PATCH 2/2] tools/intel_error_decode: Enable support for xe
 driver in the tool
Thread-Index: AQHbdB7iVR2xObqIikiX/Rq7T0G/KbM6fvkAgAcmWgA=
Date: Tue, 11 Feb 2025 05:37:19 +0000
Message-ID: <BL3PR11MB57474F7F2D72AA2155AB169BD0FD2@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20250131202940.1124460-1-sai.gowtham.ch@intel.com>
 <20250131202940.1124460-3-sai.gowtham.ch@intel.com>
 <Z6TiQoEs2RM-WrYP@intel.com>
In-Reply-To: <Z6TiQoEs2RM-WrYP@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|PH0PR11MB5016:EE_
x-ms-office365-filtering-correlation-id: 28b5604a-64c5-4b1e-4995-08dd4a5e26da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?sI5rBCGicb429RbMd8y4EPcCk7mKIVDB7iwpiLUwDfqv+h49sL5sEBoURtTh?=
 =?us-ascii?Q?bKG3qDB/DWCM+z3vT4dlgmPSYnbN6QmOQBoikCBsPgaT5ETovg8qVYbLt5HC?=
 =?us-ascii?Q?f7GPh1OENd7WTaKg2O4jUwg5t/T+4WvU0v/deGWlpAZykyEBcPZ6viYJkB+G?=
 =?us-ascii?Q?qWk6C/LIs+Ywfa1QGaOOkNd6CmpqRPsd8AAL9RooHxViOPIl0SVhb+L9M8IP?=
 =?us-ascii?Q?MpN9YGnWyuoIv8dlRUcT9qicybFVFDw5SwuZYJFfMcwoCtPbdeCuW/d8eiNI?=
 =?us-ascii?Q?6rv7sselS3FzhzLSH9phZss14Iih7u/a4lfNUv4bh5c7KyU04styUaCOGdbB?=
 =?us-ascii?Q?AQaAcFhEHahhK78dPfzOwDQa6fq+wklmpvaUV5h/+q14f4KlmcZIVKXraTqw?=
 =?us-ascii?Q?KaSOy6W7QdZQejwYT+an4rsEppBcFfFc1UxUjixKySdjLwqYfq1uG1/GgtcN?=
 =?us-ascii?Q?0t24CHioxIaCWzrUIjLu94icYCkGKDYhrU4nyGkRsbY2XBtHoNx0+l7VC7i6?=
 =?us-ascii?Q?VrLaxIDKPtSEdoFBrc0eT1XiWc5HQhMyrHmAoTw7qEEHoqY7ci9lUjgvSt0Z?=
 =?us-ascii?Q?puI8sYNleaRgbXXMFU0L9pDpBevDih4IlFwVr2bpHbkriqx5/+ualSSfLhzp?=
 =?us-ascii?Q?8AQGVr/HU+Mb2ohfzWfrEwSEV6SpbtWc+IrnhXkOltbH6vUuWldXEMrF/ye6?=
 =?us-ascii?Q?AOuYDjCZhe68CAJQ0/WSiOXErd1CYoigJyXkS7a/sYA81N9ooBpFsMjpOhOD?=
 =?us-ascii?Q?7V4rP6L1CiTfvOlItgdEGuXBi57/4/1N8UO+SFx9ydGzPgHjSM3DdCzQcXbh?=
 =?us-ascii?Q?XcfK6im7dWhLXIhebQ3/JQBHGYp4ODlk5hF0rsiEHQgIXAzrQMkMvstYakjA?=
 =?us-ascii?Q?ufj0lBJBXY6WzYnk1HWyNYWnTIFKqPLdl8ZWqBJRo8/7fP+HqXYoeSifSDe3?=
 =?us-ascii?Q?4HNnorU8LsoSOlCG9esNYVFOdIVlsHwBqgrr+IqHlvTM9Taoz1xBIFQ3ZdKy?=
 =?us-ascii?Q?nIlzsuhERYYX6jyaavljVNdtd/vt67aoiHmh6VdbIn7F0a+RnPxJnk89MGeU?=
 =?us-ascii?Q?w5hco+iWihFtzlMYHR4wrbKlWaqkpH6MBcD13OS6BUB6xGS0pN9XXoIys1Lx?=
 =?us-ascii?Q?TCfo3I6RhZLIniTOSGSVqqCa18nOLlgMM6he2Thk3Om8Jio2LE/9vixwLCgH?=
 =?us-ascii?Q?W/0r8vd8rHRjwt0UF9c1qdXERmAkTnsF9o99Lvb+9sac4gR6U0MsMCCoDVbr?=
 =?us-ascii?Q?PO48O6eyGUX5nWyTkAJihgr+5GOGvIlm9CPJefTgf8FqBCPFQs2Y7s+NB/C1?=
 =?us-ascii?Q?bBcZieUy7wqv92E4+mP37l60aWpFG+8w+yZrY532BiFb/SMpWLErUrmnIr5V?=
 =?us-ascii?Q?0dkBrYLVyJlatDRpbZ0cjNtFnwl5nBVVsyXSLUq66l6/I9Hn73GGCwnnODOZ?=
 =?us-ascii?Q?rGbebuyA2nvjRBqVF2vnz4cmto29DEML?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xFQZYLnJ8C/nYAg9oIABhNloPm7sQpkfGCec1dj9b/pZ6KM0o52frz4Anywr?=
 =?us-ascii?Q?MCOUFLJV33ONEyuyD4qi1f3s1yrLJR13sDFAFF4YAezymBHo+JoY1q1KCGgP?=
 =?us-ascii?Q?3lRNqf9lxfnqPkKfdCf2EXXN+z2vIwjP/SO2DHOjd24gQYer0dGW7LXfO9UR?=
 =?us-ascii?Q?RFBKmKj5w+x54HZm8Y+H4EYTpAUpEQF5+fdwDlBPzAtzZ8sGBi3rVjZiaCnk?=
 =?us-ascii?Q?cvCPm6ySR42zhFrDTSBgMCePePYUYzsJlbDEi9bjC1FWOPfNJ8JEWIjpkbgX?=
 =?us-ascii?Q?qY9F5KvuCNdJUoBidk3B3sc8BOi1gbyCNwGUmWldJUY1IIyomMGHeXrdfukV?=
 =?us-ascii?Q?3XsKX1OC7JGGs2/WpdRMtl4+XVlUOxnvANbEKh4srng/PbJw6kf6XwTd60Li?=
 =?us-ascii?Q?IC7B67AtqcstQga8ldWdxzLYh5GorCwWOkA349ZSQvP1S6idNv/kVDk9YKIq?=
 =?us-ascii?Q?Sqpz8ztlBgBNdKLuxtWrwb6aXxA2MazIkCHJ2xetatjSIJpkZVwnvi4sTo2V?=
 =?us-ascii?Q?gRWnb8c8Fbpdk8OKJFqrIGiVd0eYcbcmeHgscHPBNEhLocxEry241KSdhA5c?=
 =?us-ascii?Q?f/B/FdPjyqJpYZ76IQn0vMCh2ug4z4t28hv78f5B+IND36IF3fBdnOKg2/pB?=
 =?us-ascii?Q?iPyU2iBOogWzxxMYNacCDQVXAP1uesOrnW5mP4urxrdppJGzMgTsAfTF6/TP?=
 =?us-ascii?Q?Yn8RB7jLVu/YS9QiJOx5ZpOUF5uX4sM5GvsHffuvbPUYteKiAx49MdnM03aw?=
 =?us-ascii?Q?VQeX02pX+diYphw7qPaOiiqBAwpDcQVibR6xy0h25UFZ9/geTVk5OrqPbhVy?=
 =?us-ascii?Q?t0HTWhVpcym6rIi/qJ4tA7pyVDGRCkpDKn9lpjZcLzrBbOGq2PL9JnJqJRBq?=
 =?us-ascii?Q?VZCKIJzObBXOWiCMp7pC5SITNQHY0m8Su5q3GRPnZhfLBsmswHrrP2B4NrlO?=
 =?us-ascii?Q?nrJ5UUp2vNdbZseWSeWOeF7/XjjeHcDzKEcEXlSYiCBP22g1x135yrTSaJA8?=
 =?us-ascii?Q?CDipqq+e46D6SaNYtdZQm52GnKOZNGthEFBhnz06PThZD6545EhA8np9ODgk?=
 =?us-ascii?Q?IFYzrFkQnyncKrVqW01GiNWJybLMhtrgqUIzYzwuDUQZUcJek8NggJguMhEQ?=
 =?us-ascii?Q?NN/xXV7g6rLXynPZTOvv9cMi4Jy0UY4GuKMG5I/GKOtfz5GUQkZvK2ijgTLU?=
 =?us-ascii?Q?AJdi4gOf96OqM4GKo6X46cy4neK2+Kp1fHlYi9Da8++41C35KjlJKrCwsLeg?=
 =?us-ascii?Q?Q/+eM63Uz977gSPcPVRTP5pp9ni2AUdxdh//SfKv29z0Nan5CZqPFFfaV0wl?=
 =?us-ascii?Q?5hT/xXtno7QyrwQpZeetWxdrX2cmPJvvMS1o0lsI63c+5CDyMBn1Jo619k3s?=
 =?us-ascii?Q?Gisla/NUCZ4jv0KkAKstcfcCvMxn2zlGBNwDya1Xy/yc52ceh1uYUtFYjseU?=
 =?us-ascii?Q?YXzX6YYbIo0jLfzRI5LQpvbkVeV3RPsu/kPFi7pfPwp2+iNQ7B+vc/tEfFZF?=
 =?us-ascii?Q?Zpks+Loby+Lg7dwHABclqe2PQsU2k8a6PVDMweusB+kq9/tDmckgzig/EvwI?=
 =?us-ascii?Q?Dknktytf8PjWFQh/tgq3OoxOh510vPDJlOpZasR0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b5604a-64c5-4b1e-4995-08dd4a5e26da
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 05:37:19.5654 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zkoBaXfuhJrrmDquxD6NRjOO06mgV4ApjKfMbAXYEXawa43glJ5baeF4CPK9fEblYOBYDTf228rdNNzU9j9FwjU7ulxTyPD//yIIt2pWTSg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5016
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



>-----Original Message-----
>From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
>Sent: Thursday, February 6, 2025 9:55 PM
>To: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
>Cc: igt-dev@lists.freedesktop.org
>Subject: Re: [PATCH 2/2] tools/intel_error_decode: Enable support for xe d=
river in
>the tool
>
>On Fri, Jan 31, 2025 at 08:29:40PM +0000, sai.gowtham.ch@intel.com wrote:
>> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>>
>> Enables error decode support for xe dumps. which uses
>> intel_error_decode_xe lib.
>>
>> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
>> ---
>>  tools/intel_error_decode.c | 156
>> +++++++++++++++++++++++++------------
>>  1 file changed, 107 insertions(+), 49 deletions(-)
>>
>> diff --git a/tools/intel_error_decode.c b/tools/intel_error_decode.c
>> index 451608826..a722621e2 100644
>> --- a/tools/intel_error_decode.c
>> +++ b/tools/intel_error_decode.c
>> @@ -57,7 +57,11 @@
>>  #include "instdone.h"
>>  #include "intel_reg.h"
>>  #include "drmtest.h"
>> +#include "drm-uapi/xe_drm.h"
>>  #include "i915/intel_decode.h"
>
>From this one we can see that the right place for the lib is under:
>igt/lib/xe/
>
>> +#include "xe/intel_error_decode_xe_lib.h"
>
>also, what about
>devcoredump_decode.h ?
>
>> +
>> +#define XE_KMD_ERROR_DUMP_IDENTIFIER "**** Xe Device Coredump
>****"
>
>what about having this in the lib?
>
>>
>>  static uint32_t
>>  print_head(unsigned int reg)
>> @@ -793,14 +797,86 @@ static void setup_pager(void)
>>  	}
>>  }
>>
>> +static FILE *
>> +try_open_file(const char *format, ...) {
>> +	int ret;
>> +	char *filename;
>> +	FILE *file;
>> +	va_list args;
>> +
>> +	va_start(args, format);
>> +	ret =3D vasprintf(&filename, format, args);
>> +	va_end(args);
>> +
>> +	igt_assert(ret > 0);
>> +	file =3D fopen(filename, "r");
>> +	free(filename);
>> +
>> +	return file;
>> +}
>> +
>> +static FILE *
>> +open_i915_core_dump(const char *path) {
>> +	FILE *file =3D NULL;
>> +	struct stat st;
>> +
>> +	if (stat(path, &st))
>> +		return NULL;
>> +
>> +	if (S_ISDIR(st.st_mode)) {
>> +		file =3D try_open_file("%s/i915_error_state", path);
>> +		if (!file) {
>> +			int minor;
>> +			for (minor =3D 0; minor < 64; minor++) {
>> +				file =3D try_open_file("%s/%d/i915_error_state",
>path, minor);
>> +				if (file)
>> +					break;
>> +			}
>> +		}
>> +	} else {
>> +		file =3D fopen(path, "r");
>> +	}
>> +
>> +	return file;
>> +}
>> +
>> +static FILE *
>> +open_xe_core_dump(const char *path)
>> +{
>> +	FILE *file =3D NULL;
>> +
>> +	if (path) {
>> +		struct stat st;
>> +
>> +		if (stat(path, &st))
>> +			return NULL;
>> +
>> +		if (S_ISDIR(st.st_mode)) {
>> +			file =3D try_open_file("%s/data", path);
>> +		} else {
>> +			file =3D fopen(path, "r");
>> +		}
>> +	} else {
>> +		for (int minor =3D 0; minor < 64; minor++) {
>> +			file =3D
>try_open_file("/sys/class/drm/card%i/device/devcoredump/data", minor);
>> +			if (file)
>> +				break;
>> +		}
>> +	}
>> +
>> +	return file;
>> +}
>> +
>>  int
>>  main(int argc, char *argv[])
>>  {
>>  	FILE *file;
>>  	const char *path;
>>  	char *filename =3D NULL;
>> -	struct stat st;
>> -	int error;
>> +	char *line =3D NULL;
>> +	size_t line_size;
>>
>>  	if (argc > 2) {
>>  		fprintf(stderr,
>> @@ -823,69 +899,51 @@ main(int argc, char *argv[])
>>
>>  	if (argc =3D=3D 1) {
>>  		if (isatty(0)) {
>> -			path =3D "/sys/class/drm/card0/error";
>> -			error =3D stat(path, &st);
>> -			if (error !=3D 0) {
>> -				path =3D "/debug/dri";
>> -				error =3D stat(path, &st);
>> +			file =3D
>open_i915_core_dump("/sys/class/drm/card0/error");
>> +			if (!file) {
>> +				file  =3D open_i915_core_dump("/debug/dri");
>>  			}
>> -			if (error !=3D 0) {
>> -				path =3D "/sys/kernel/debug/dri";
>> -				error =3D stat(path, &st);
>> +			if (!file) {
>> +				file =3D
>open_i915_core_dump("/sys/kernel/debug/dri");
>
>This i915 vs xe detection looks complex.
>We should keep these i915 possibilities inside the i915 function and here =
have a
>simple is i915 call i915 function, elif xe call xe function else error bel=
ow...
>
>>  			}
>> -			if (error !=3D 0) {
>> +			if (!file) {
>> +				file =3D open_xe_core_dump(NULL);
>> +			}
>> +			if (file =3D=3D NULL) {
>>  				errx(1,
>> -				     "Couldn't find i915 debugfs directory.\n\n"
>> +				     "Couldn't find i915 or xe debugfs
>directory.\n\n"
>>  				     "Is debugfs mounted? You might try mounting
>it with a command such as:\n\n"
>>  				     "\tsudo mount -t debugfs debugfs
>/sys/kernel/debug\n");
>>  			}
>>  		} else {
>> -			read_data_file(stdin);
>> -			exit(0);
>> +			file =3D stdin;
>>  		}
>>  	} else {
>>  		path =3D argv[1];
>> -		error =3D stat(path, &st);
>> -		if (error !=3D 0) {
>> -			fprintf(stderr, "Error opening %s: %s\n",
>> -					path, strerror(errno));
>> -			exit(1);
>> -		}
>> -	}
>> +		if (strcmp(path, "-") =3D=3D 0) {
>> +				file =3D stdin;
>> +		} else {
>> +			FILE *i915, *xe;
>>
>> -	if (S_ISDIR(st.st_mode)) {
>> -		int ret;
>> +			i915 =3D open_i915_core_dump(path);
>> +			xe =3D open_xe_core_dump(path);
>>
>> -		ret =3D asprintf(&filename, "%s/i915_error_state", path);
>> -		assert(ret > 0);
>> -		file =3D fopen(filename, "r");
>> -		if (!file) {
>> -			int minor;
>> -			for (minor =3D 0; minor < 64; minor++) {
>> -				free(filename);
>> -				ret =3D asprintf(&filename,
>"%s/%d/i915_error_state", path, minor);
>> -				assert(ret > 0);
>> -
>> -				file =3D fopen(filename, "r");
>> -				if (file)
>> -					break;
>> +			if (i915 =3D=3D NULL && xe =3D=3D NULL) {
>> +				fprintf(stderr, "Error opening %s: %s\n", path,
>strerror(errno));
>> +				exit(1);
>>  			}
>> -		}
>> -		if (!file) {
>> -			fprintf(stderr, "Failed to find i915_error_state beneath
>%s\n",
>> -					path);
>> -			exit (1);
>> -		}
>> -	} else {
>> -		file =3D fopen(path, "r");
>> -		if (!file) {
>> -			fprintf(stderr, "Failed to open %s: %s\n",
>> -					path, strerror(errno));
>> -			exit (1);
>> +
>> +			file =3D i915 ? i915 : xe;
>>  		}
>>  	}
>>
>> -	read_data_file(file);
>> +	getline(&line, &line_size, file);
>> +	rewind(file);
>> +	if (strncmp(line, XE_KMD_ERROR_DUMP_IDENTIFIER,
>strlen(XE_KMD_ERROR_DUMP_IDENTIFIER)) =3D=3D 0)
>> +		read_xe_data_file(file);
>
>xe_read_data_file() is a better name for this function
>
>> +	else
>> +		read_data_file(file);
>
>and probably good to rename this to
>
>i915_read_data_file()
>
>in other words, add i915_ prefix to all current functions exported in
>lib/i915/intel_decode.h and even rename the file to i915_error_decode.h an=
d in a
>separate patch...
>
Thanks for your comments Rodrigo, will keep these comments in mind and make=
 changes according.

Thanks,
Gowtham
>> +	free(line);
>>  	fclose(file);
>>
>>  	if (filename !=3D path)
>> --
>> 2.34.1
>>
