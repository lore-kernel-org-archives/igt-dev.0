Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85A9C30653
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 10:19:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4C010E0FE;
	Wed,  3 Jul 2024 10:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QxTN5NSp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B31610E0FE
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720001996; x=1751537996;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=rD5K3lHuZ9LjNAYXeVLHt1hyI1bNa3T2Lsmy+Ij2UCU=;
 b=QxTN5NSpmoK9K/8iF7dojm3Xb4x5XU8RkKcqiq/2yzC9/sIKNMjpOKjT
 ZIK0p1eg/9sh/YFKYzteIg07ZtVWFVgAfBvluQZRa+YyqSzgtpB2TtuEM
 YiH4QqF/IfgeVEqhoAyNkPR2giyKqIvHZ0ouQYgaodFH/ougVKoKpGDjQ
 3KUYLDBjPZjJ6WkDPg5H5/ccveNRhKyz0hyTXCw2TpCySE5VM2af3fS3H
 rTycm/KRz1NIj3CyMZygHMmA1Ow8nW0AKMF9acmZ4i5OFoqi1Xk1zElW5
 MRu8VrhiHMhCPkMlSQ1m45XcqZsjNTYCDjSjX7RT46sxGZcJSqgVBbR7P A==;
X-CSE-ConnectionGUID: e6r8osT0RuOALdedgWtfKw==
X-CSE-MsgGUID: hHprhzptTiOuiWt4d+ASsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17059838"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="17059838"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 03:19:56 -0700
X-CSE-ConnectionGUID: Oalr9NM4QV+cThUBNcKCrw==
X-CSE-MsgGUID: Sx2cbZg2Q/eiMIX5twE3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; d="scan'208";a="46123134"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jul 2024 03:19:55 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 3 Jul 2024 03:19:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 3 Jul 2024 03:19:54 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 03:19:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GXr9UAnpjfXn5LhAGfa2L/H99BBiKyMv7dLUl+f01iirE3Arji00q6guooMplh6hsKh7p8dV56pfoftS6rJAXqxeeazpnloYc14VGGExQvrS3rvNZQtocoKmpdlLGECDz28UyqSr21vpcKMP6XMBmPQlCxHNf3bihCI/1xUxeStjq48mIi3w6ZFi04f3Ms8icSiM4uxZsvbt2RfD8yG7DW9HnCC3VN679r0tswJ5YM8GlQWVO6c/Hd/Gilgx40TOPlluiKZ27h/BG3USV7EQxfvUUn/8RdBe+vEom8BXOY6qQXGV6qYXSBqmRMCWqfPRU45CupRtIeU8fVnP6nNf4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rD5K3lHuZ9LjNAYXeVLHt1hyI1bNa3T2Lsmy+Ij2UCU=;
 b=Xw5vpTKhlTvGfXC8SOT9vluGoypcHjYrStDMQwpJj2BhHEpNCkwFmcOeGE4N3gZgC0Tryv3zRO99dV5yaiSFu+QXws/n8pSmzPnxdplYGykcQdLxiePAv60P0ZWdX8DtyFYQp5cJfMWWo/1z6Gg16eqtZCJRhkEY4rdAZb4oiXhofKorzYQBnNE9wYw07PyWnZFBwgW8SBayFOIArynxlgNnFRvcF4Z7SZrnXWPi16zFFRrOUzPhqXE8auFBd1+Q0KpnDuPcPkdZ7aD6Ylw7j4QOi7T6cWtyp6Rz0eyyOyK8OEZfUrcgpTlA/gIj8VA7s5UAg+1hzs4yOD3VQQbIFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 CO1PR11MB4945.namprd11.prod.outlook.com (2603:10b6:303:9c::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.33; Wed, 3 Jul 2024 10:19:50 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%2]) with mapi id 15.20.7719.036; Wed, 3 Jul 2024
 10:19:50 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Manna, Animesh" <animesh.manna@intel.com>
Subject: RE: [i-g-t,2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
Thread-Topic: [i-g-t,2/2] RFC: tests/kms_vrr: Add new test to validate LOBF
Thread-Index: AQHazTIMnqlOcjI9IUexzpGET8ZCYrHkynkw
Date: Wed, 3 Jul 2024 10:19:50 +0000
Message-ID: <DM4PR11MB63121E9063B885B08E722FC690DD2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240626191537.1507452-3-jeevan.b@intel.com>
 <c7df35c7-d641-414d-b032-2cd3d8a47401@intel.com>
In-Reply-To: <c7df35c7-d641-414d-b032-2cd3d8a47401@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: animesh.manna@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|CO1PR11MB4945:EE_
x-ms-office365-filtering-correlation-id: e27e20eb-ba56-402f-5297-08dc9b49ac46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UkdvMkJKdmRnc0RqS0RpWHN4UUlDU1pDNTBvUk0rZFVQSU5RdTM3dlhHY2Jp?=
 =?utf-8?B?Q3c3RGJ3TUNCTUdhT0pTVC9TODNOT29GQnlZREpEblMwZkNYNzFWWG54UDVq?=
 =?utf-8?B?K1JsSzhYUVFLMEQ5cEJFT0xBeGNkU1E4K3VjaW96VUdCeVdYdEYzVzNMSUpT?=
 =?utf-8?B?R2psZGNZemRiZEl5Tyt0K2NjQ0ZWNTZreFlFemZxRVBjWlZYRVBKanM1V3Fq?=
 =?utf-8?B?dUxUbE9oTWM2ZFFqSm14clllVDMxbEtqZXZsbTlwclRNb1Y3QlVlQzVjTExm?=
 =?utf-8?B?QUkvOTVic0RkTDNqUFZidlhwanNUblNVUS9ESzRJSnR1a0hYMjZVaDdzNkNF?=
 =?utf-8?B?dEFqb29kbmdVN2xwNnpCNnlQVy9GYVdleFZWVHcrelpMM2wrK2QyVjZOVGsy?=
 =?utf-8?B?UlpsWlNvVmlOUEV2Ylpwa2paVmhvQUdiYkxjWDZUZnQrWnJXZjRWcnVxanp5?=
 =?utf-8?B?WS95Y3lsd211dHE2WTA5bXBvQ29ZbkFHUFVFNStiVEJnQmRSUzVuNVFvRVhu?=
 =?utf-8?B?RG9JVWVtQ1RXa3RHbjZONDZhU0R4QzkxdmdUNG4rUU14R1NSakNsSDNxMS92?=
 =?utf-8?B?V0tnYTJlYnNreE1PcEN2dk4xV3NJdHZDbW95U3ZMdVZvZzFUUDltdUl2eGFP?=
 =?utf-8?B?R005Mk0rSmQzSlhaeDQvTFlIcGM1VmlOVG45NEpocTVUWTJLcmRvOFR0WFB1?=
 =?utf-8?B?YkkwUkhaWXhiR1VGUE5WdkdIdjFNU2RaeXFOdytSTmpxNEFLQ2phakowTmdD?=
 =?utf-8?B?S0o0NEZ2ZVE2WU9ibEZlUi9vWjI2MlZYOEgrMEVXQTVzYnd1RUl4L0o0S2NW?=
 =?utf-8?B?bFVBMFUrS1pqZm95L1ovb3JOcTRKd24vMmxwMFV5c01LV0oxbUxuOE5oVzQv?=
 =?utf-8?B?T3VFRldBYnZ1ZWN2QmhlQmFnSXQwRGFnWS9SSks4Uk9wUVVyNXUxQi9PbzdF?=
 =?utf-8?B?Y0Nrd0ZGaEZ1eWc0T0xMdlArRU5TYi96YTdlNlVOWkJRSmtINTJtWGJXdGlI?=
 =?utf-8?B?clZZa01rRDFJNW4vNVA5V1hvY0toL0NHNzAwQnA0YnBsUWpHVUF1MTdEcU93?=
 =?utf-8?B?eU5zZURVSmpoUWE5WkJRVEhPMm8xemJ2MWZ4eFIxeWhaMmp5YnBCNGhldlJD?=
 =?utf-8?B?aGVkRk5tSzhyTk1nZnlDRHJEM3lHanJ6S1RjbU5oVjFUTi9DMDdPbDhwNEdq?=
 =?utf-8?B?US9md1d4eFN4MmYrN3REQlN4QitIMWtaVnhMSmIweHFjeFRrQjhJeXhFYVZB?=
 =?utf-8?B?ZzRXa3YxdThEK2Y3RVNHRndUd2hRaFJ0TVptcWpRWFJQY1g2ZkM3RDBkQW42?=
 =?utf-8?B?STk2MDBCUHd3UERRdFBORXFvektwd3hMZ2dYVGhXRGhSTll6LytvYk1WTWta?=
 =?utf-8?B?ZHNOMkJxL0FMNlZDczRTV1ZQdUllYVo2dmZYaklTay9QaW9qYW1kcjh4aEln?=
 =?utf-8?B?b2szRHhITzNmVFdFbHV0YWEyRWZjaWEvTWh0b2NoMjNqYTZEWW1ZeWt5aWIx?=
 =?utf-8?B?bGY4YXQzRC9ZajA1YUhxeFJkWGtrc0VnRHRpVEdSWGdqKzVWSUtOcU40WTJR?=
 =?utf-8?B?R2JrYUtXdkJJL3ErakRtVFNxT1hRN0ZYQmJZMG5oWDZzYXQzQ0tKWjg5MHdS?=
 =?utf-8?B?Yy8venM2OWVrMm8rZDR4bjRtN1RsNS9yU0V6NTlpTmZNTWxYOEF5NHdBU1J5?=
 =?utf-8?B?SmVGQ0xBaG14Ny9kb1pWcGFXRGh1d28yd2ExOE1OTnVROXpCS05ZTGU0aEN5?=
 =?utf-8?B?dFlTTlhwVTZJT2JvU0F3czJ0alNncWp0REdweVhWR0ttS2Y5ajZJdEhYY1Zv?=
 =?utf-8?B?QjBpbnhONVpyUE1mZ0NJTjBBbFVqby9nRlBSdnBMdGVFaUdCOTFWakdlQmJ5?=
 =?utf-8?B?VmN4TlpHYUhUVzB6aytTRFM1ZDNzWjNheXk1Nmo3VmNoR0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFgydHhOYlNQQ0tmUFdUSkJBWkNsZGN0RVQrV3NFaFUvS1JqcUVKSkVhYVlW?=
 =?utf-8?B?YjlOUnFpMVRkK3VQRjZia3k4aHNJaU9WbU43MzhjM0NWTzRQKzJzZFE2QytN?=
 =?utf-8?B?UzhQZ2R2ZzhiQ1pXTURFbXhVWmtuS2tpN2oya1A2RG1DbEovQXQxekE3NlVV?=
 =?utf-8?B?Slk4TkczSjMzRmlLSFVsSnFzbTJMRkN4WmhZQ1h2NmdHKysvalpuNFVRdlh4?=
 =?utf-8?B?eW9JbE5QaUF5eGZMUXlUYTBFYjNndHVxTzF6aGYvRTVTOUpwc29Hbk5xRVNn?=
 =?utf-8?B?aDJrUWJlRDIrUjF5cU5zZGhOaFN1SkNlK2tEOGRzMEM0bmIxWG5CODBBdVhO?=
 =?utf-8?B?emNCdWxHckZra2dQQUhJd0JERURuTjJEUEtBN1B4K1oyUmI3ZjJpTjNMQWpL?=
 =?utf-8?B?cEtBdGVKZWNmZU92Y0w4YllIU2R3cDFGVG8rN0JBT2c5R2NpQ2JDUDV1S3J4?=
 =?utf-8?B?MXdHd3JjN1ZCU3dLWSs0MVVZY2w1MDNWSTcvUnREdC82UEI0bjJWdmNaRkgz?=
 =?utf-8?B?V3NVNU9oZ0lRZkpJYjhScjJJbUxGQWZUUCtMMVJSMnJLUGVRc2thM0E4RytV?=
 =?utf-8?B?eWd3MDE5aEFSZk9SVUx1VU1yeFhBYkhpZlg3Z2VBRlU4V0k0emM4aE1rTllQ?=
 =?utf-8?B?ZXpXbE93UDdJQU84V3FOYTZjRElKWE5VM2xRdTZhZC9RcTNzZyszNmxCdTd3?=
 =?utf-8?B?bVNEVytrdEl0M29MMWRuQkUwbmZqV3RlQUlVcDUrWm42eTJjSnQ3T1dYTUNy?=
 =?utf-8?B?NmVCN0lONG80WmVraHY3c1YrTzJFZmZvQ2QwaWJHd1dzUDAxdStqQ3dzbE5W?=
 =?utf-8?B?cVB1a2E3eUtaN2htMG5Lb3dIdURGa2lsTU9maW5xckptNU5hbnBNdm1nb1dD?=
 =?utf-8?B?UVRiSklqemZJSG1Rc093RlRSQktLT3p0VmZqY1RHdjNldWZWQXZvRGFJbjZi?=
 =?utf-8?B?dDZRVmgyWnlwNzRHM0FCM2lIYTZtaDZKSWV1ZXpIb20ybWZJbnk5RVQ2c0lL?=
 =?utf-8?B?SklYZmgvVVpLalhYenJKL2toTUt2OWJ3S2lLNDh6WUdxRHdrT3NteGZmQ21r?=
 =?utf-8?B?cUZDejRidG1zZWN3Tm9WMEVCcisxY1lCZXR6L0RPMnM1M1JPSEtpUDl2ZEtx?=
 =?utf-8?B?R01SbDJ1d2J6Y0dUQXVIdmpacENNeVFHY3NUSXViMkwwalNpK3hVenVzMXZT?=
 =?utf-8?B?L2lpdjlCcUJpZDFpMGtSbkN2ZUN0MzFhckZ2VTRpY05KVzVTQjJ1Z01qWi81?=
 =?utf-8?B?MitVai9VVWVGQVRvdWZMb0tuSkZORFoxNnFQNDVrM2NOUjJrQXhhckltL2t2?=
 =?utf-8?B?S3Fpa09EbjFsU1hCRUZRNFJtSHpFVHJFQ2JPZTFPMzRKVi9ydlFVLzRmbG9J?=
 =?utf-8?B?Z1NkcG9qZVhWVmRHQVN0YWpwZm0vZHYwWTRueElVQ2lJcWI0d293ZVI0cUhW?=
 =?utf-8?B?aHVsY082NXdER1FTNWNjR3ZsUjNqay96Y2lZM2hNN3RMUjd0UStJUENOVStj?=
 =?utf-8?B?SnBNTmxoL3BEZENzQUhmYmhZNkxhL1M0Q05MY0dZa0FvV0NncGQybW1yUy9i?=
 =?utf-8?B?Z2VuQW1VelR1WG8ycnpYMFZ0MWtCYUpaVWxpRHZjdVNhSlg5R3ovMkpabEdR?=
 =?utf-8?B?VVJ0WFBRcGpXelc4a1FnUXpONGcrQ1BtOGZTR2lsNUtBZXVRN2hWbzRGNVFj?=
 =?utf-8?B?dGRBdk8xRGdvemdSUnBlWXZ5aldGMHZjUFFHcjF1MzhuMXQxTmhUZE5nMzcv?=
 =?utf-8?B?eFIvSGxINzJNeFNta0xTc2NTbjNnMjRKOVdQSHV0T3dHdjFHenZHUmJzelpZ?=
 =?utf-8?B?aE0xMjM3TUVEZXRmQnJzNGVYZ3REd0poVEdacjJjNU41OEYxdWErWURTcnNv?=
 =?utf-8?B?YnpqSUwvNU1icHJhRXA4bzJWbE83Mk04TWJaZnhTOUcraHoxNHIvUUd0L2sy?=
 =?utf-8?B?Y3NJVnlETzdiS3JLbnM2aTdzaUV6dktLRnFpSVQ2ZGhPWEUrODJ1enhMcGtU?=
 =?utf-8?B?SzAxWGhkVDladUpUdDNxbkNlNk05cGY2Y3U0Q3VnMGdsYWcxRlFLTGxZT2RE?=
 =?utf-8?B?RUdHSFp6ZEFFUzQweUNpYjFnNlVMNTNlQ2dTTlRlblVpVWw4eXBSZTlETk9m?=
 =?utf-8?Q?th1M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27e20eb-ba56-402f-5297-08dc9b49ac46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 10:19:50.4878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: keOqGQafmsrwd4N+ZBdAg9xM8wiGQeK1D/s4SYqXhLn1lSEDCQQwUwU8ZD7LN+lWELoSqQG8/vMZFlPVCGDN1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4945
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

QE1hbm5hLCBBbmltZXNoIEkgdGhpbmsgdGhpcyBjYW5ub3QgYmUgdGVzdGVkIGFzIFZSUiBjaGFu
Z2VzIGFyZSB5ZXQgdG8gYmUgbWVyZ2VkIEFuaW1lc2ggcGxlYXNlIGNvbmZpcm0uDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaGksIEt1bmFsMSA8a3VuYWwxLmpv
c2hpQGludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBKdWx5IDMsIDIwMjQgMzo0NiBQTQ0K
PiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBDYzogTWFubmEsIEFuaW1lc2ggPGFuaW1lc2gubWFubmFAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW2ktZy10LDIvMl0gUkZDOiB0ZXN0cy9rbXNfdnJyOiBBZGQgbmV3
IHRlc3QgdG8gdmFsaWRhdGUgTE9CRg0KPiANCj4gDQo+IE9uIDYvMjcvMjAyNCAxMjo0NSBBTSwg
SmVldmFuIEIgd3JvdGU6DQo+ID4gVmFsaWRhdGUgcHNldWRvIHN0YXRpYyByZWZyZXNoIHJhdGUg
Y2hhbmdlcyBpbiB0aGUgVlJSIHdpdGggZml4ZWQNCj4gPiByZWZyZXNoIHJhdGUgZnJhbWV3b3Jr
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSmVldmFuIEIgPGplZXZhbi5iQGludGVsLmNvbT4N
Cj4gSGVsbG8gSmVldmFuLA0KPiANCj4gQ2FuIHlvdSBhZGQgYSBIQVggcGF0Y2ggaW5jbHVkaW5n
IHRoaXMgdGVzdCBpbiBmYXN0LWZlZWRiYWNrIGZvciBib3RoIHhlIGFuZA0KPiBpOTE1LCBTbyB3
ZSBjYW4gZ2V0IHJlc3VsdHMgZnJvbSBDSS4NCj4gDQo+IA0KPiBUaGFua3MgYW5kIFJlZ2FyZHMN
Cj4gS3VuYWwgSm9zaGkNCg==
