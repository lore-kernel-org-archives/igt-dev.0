Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5D19D116F5
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 13:13:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9765B10E3D7;
	Mon,  1 Dec 2025 13:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VQUYxlY5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8DC10E3D7
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 13:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764594828; x=1796130828;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/nMzKObskbX5bQ5GeFIM6JUsU1/xB3ac1/0iAMY6R/Q=;
 b=VQUYxlY5rHIzYLcHp4yeyQA/lh/vx0Ktim7/5qULoPCI53fxzk+ypeuo
 /F+NkvtCdZtcrJgbV/kvFeiLnYyTfB4YMwV/MddedgxVxVy2ArIzrHQPT
 WbyeMsDEf7jB3jYKexKUnI58i2WKU01HpPfpmtFR2MgNFCDzvffPSE60J
 RnwYVDDvVgCvZAfMWqEN9NY4dWbNvQ+TeXqdLlaqduWbJoHYDaOzedLkz
 gU+6JHjPFSWHIgEaayq98l3I/e0vCeMpQya1hneQHwi0mDraLlK761hbQ
 APAXr4sjrqxEph7D9dTkK43xom/82lyP/U85s8t31Gr7nQhv3heFwQco8 Q==;
X-CSE-ConnectionGUID: ff9yA5kjRJ2EUjWfmPLv0g==
X-CSE-MsgGUID: kPzGZSI1QT6TQIlgYYhEbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="83923014"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="83923014"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:13:48 -0800
X-CSE-ConnectionGUID: nt4FruejTsSxQT3pzHZ0sw==
X-CSE-MsgGUID: 0xypcqMdS62bWjSoXRJK+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193957677"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 05:13:48 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:13:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 05:13:47 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 05:13:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPLIDZ8M182wGWobdeoT3Z8fd4j4+8nqwB/Chtep4RBslKSIWHmCyiJnB3JdAJiEcCPTQx5QWZV7l92yWDNftydVHP1qIWnybX93xREc/nHzuUNuGMvVjWCApd+sb75vTPV2y/YflaLChQxgBhb6kn7ZHndgLpiDlwsFkcqtFsnmnLeQMUNjUGqDpAYX5Io1sKQXVjvto6F9oIq09Nw1FGMN0O6OUdzn6eG2MvbGFFtV0VXulovMepdcFTTNk9d7qF2ttElM9VrO0rG6Cv+ygsjP1TuIaDjxxa+tUN72WnIa/RIIVDbGdPQzJgGSGMVi6iRuFfd6Ef7uVldZOy1Srg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SJ+ESWJdH+ey1P4v56/hooAKEpTakINfOur/vj/id0=;
 b=OyFBePcHDFd+9oaKKxXqp0DEgol42RlDf03toT7DrK81gNZP7b6QEyW1vY08Z1EoEzAaULz/lHwNvzMjhsKEPo0Glk7t2e8VVX+aP8SJzjQ17/AZBcG9N3oMtVWW1eBNj0lnyPghfnCM3bFmopneWKFuMD5h8Yca9UfinthOKNItOnhaehmi/j2qjZMh1JVzY00qBNRgh5elmQkpkFByzm4uiqG6GGBZ/XD7OoHcg+unYYawoY94w1pTaijr+Tlxp820ZOWvwoiA+Cip29+QoVMXJOR3FRu0JTE5i2KojqqerQsD+fPfQZ0ZY0sx+Mn8PzAZfdwfR/RHp0ViKltxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 13:13:39 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::7181:6f6e:ae0e:3a4a%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 13:13:39 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Topic: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
 xe_vm_madvise
Thread-Index: AQHcYqFyb3JZhzgWPUGSjhaH9fS55bUMw03A
Date: Mon, 1 Dec 2025 13:13:39 +0000
Message-ID: <BL1PR11MB55251AE1CD4B6BD5F305194084DBA@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20251201090349.326673-1-nishit.sharma@intel.com>
 <20251201090349.326673-2-nishit.sharma@intel.com>
In-Reply-To: <20251201090349.326673-2-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|PH8PR11MB8260:EE_
x-ms-office365-filtering-correlation-id: 9a2067d3-5dca-4be8-d2bb-08de30db71a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Fc83QAgR9T4zpAPDXIkCcuzx+HAd40A2VqPHqOGO2RDeaZbklz5rjySbmGQi?=
 =?us-ascii?Q?3b5HWWX5BPc1BnZnx57Lx5MjW1OWObzve/Bv7dcQdzYIEZSHe4jyEMuOwzYK?=
 =?us-ascii?Q?nvlqqBzQ+aW1+VVby4JV0dekAi3aTImRwyjiwKtumbXpk5cRxtcuCccjDDvG?=
 =?us-ascii?Q?wE6v3johN3at2cUxbg2tQ9oOYwhXS12mxo1dk3AdxwfMau/RsIfdVWqj8ieX?=
 =?us-ascii?Q?TskKMKgt7LI6eYP/JtLTcEoUEQb+GQdLeRNM1BbchCLHcDUj2rFxmdLMgm2D?=
 =?us-ascii?Q?aj3oKnyGv6xAMPYv5LEKDoSV8jtKWaJe0urcSlW3txBTfydmIeOm12YlGl5O?=
 =?us-ascii?Q?5OVrfJqoKJ/6ngPe/76lnBiyWkQuPAlnV2LZthjUh1bekC+qanzyM0V/FpXw?=
 =?us-ascii?Q?AHPpm8wZswKKrIsY8OU2JoPBKN/wusWzEjK6k+PaOPAw2iwgOn+aKkPa3+TG?=
 =?us-ascii?Q?QzoVEzfZPtHlqPn91+lyk3ZpeLMQXm5ZVi7amqeY+f45nfIKywWF0GhBZgx3?=
 =?us-ascii?Q?eakvbwFBfrw7wDosElscvFfEfLL14SfYftXt7dZQ6PnXaBmc++CZMXHK/M8b?=
 =?us-ascii?Q?VpuOepAwFtASRLloVsz2eiBAltlDe4dcEQqd1Y4UBs4oktOTrZiVYdsUu4FF?=
 =?us-ascii?Q?Zpuj9GYfAlqN9QGUOab4bA2PYutVeY7f18yRKwL4NbjOBvQye7oC4TZn5EhP?=
 =?us-ascii?Q?k5OJ5X2XQ2h/0YFE6n2KB7JzsYNGR7d9Y+Ogwo9c6PvQnGv/RuxnQgUwvMGW?=
 =?us-ascii?Q?5Uh2+pjoncvq2vA8DUb5XISH9gRvmIun/py314m0F6y/xv85gTE+vB6CUnZx?=
 =?us-ascii?Q?+XEVDskQ8CVRDR6UK5y//mB95/esC8s0X1rQ1Zioz5tCC6oh99uJdwAzijLI?=
 =?us-ascii?Q?uWGGAS+SaABUnB8VQJKgfVF0EMJfQf9WcaZmfDylIl3WS4xquFtSki8SVkqY?=
 =?us-ascii?Q?o7zIAEg5sClAPYStIgE3K+jUwm4LRznTvzykWz6O1bwf8GbMw71iaH/UbmGq?=
 =?us-ascii?Q?1KIHqIYHQ3O31VYNXTadWEeU5ZGpL0coQkGJP9JZWHWjVRFx++W/KIOIpZ2E?=
 =?us-ascii?Q?lQ5evP6kMElKUeIrAc03aFs9dmjNK/phmI1cNhKGCDOASsARjq/p2MtcFh43?=
 =?us-ascii?Q?0x+AGLv3MQFTqZvZ3PRSSzx8LDAah/zd/yblB++6vhEwYTXdfYGPpC+2EliZ?=
 =?us-ascii?Q?u4IUdMez+lN1wOSaMoa+VsJXDsGzi63zv05eS0iI+zI6CkFmwg27oyUMDMUI?=
 =?us-ascii?Q?FXfTxzaETQboOXDn+2+3DzXC/GRLcIFD7wBI+oA1K3h/RO1fuCkRDA7Jul2N?=
 =?us-ascii?Q?dZYo97h5VSW8cNRFMcOhmEYoGnhVYKF8v+Z4AKGY7WpMt6VpxIsPdrbtLMak?=
 =?us-ascii?Q?HHFHGbbvEACSaooO7KtVr5dVwvK5momdkryQymeCTTeFazpeARxSOBYFZxN2?=
 =?us-ascii?Q?tA71M36wJ6jc//4yX3Q1RPA2QAMaG8ghQ90jm30CWDPVC5UuSnmr5fmIm2yn?=
 =?us-ascii?Q?D2WC7XWSQRYz1uy0rFvZUb/9Pb9zdss/ZQRQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vGQtvoR7Fn9pbslfdPi2DEXgehjMWqmffXKYWlsjRwrCa1Koz2xUhIiurixF?=
 =?us-ascii?Q?ZJBLBvg/MiZ6RDCOCCEbucGP5P7yA9heB6pWLioQ0WCeLJg280y5Viv+m03P?=
 =?us-ascii?Q?3OCt0FDmK3Tu5wPqsDV6V/5gQnzKtDCru53+8CcmeRWlKMFdGb7aCppiUoCY?=
 =?us-ascii?Q?fdX0n1ojk7Aeg1oGjJhkxEF9cGAYenvO3Dq+Utnd6aamBnVKbqovNbcVFo9o?=
 =?us-ascii?Q?1ap++kYqRnGZeFcg3e6jLlOTC2Z9op9vtudMfRCwG/8H3znOqK0IURDtEnx3?=
 =?us-ascii?Q?6Kp24DioLThprMzjWCvCW1oIn2ECavjU2oFHvlD6Spk1qpkbSa0hvQYUqQdZ?=
 =?us-ascii?Q?jiuwaGbWkS3meCxGK1IEK4pc3S5iTKV36o9GDJkOmx9zbYzPFtH+Vzmx6xTx?=
 =?us-ascii?Q?LmghmRZd5nXcpcaVqGM8qHlm43gesvrQc5G1InoAZCAQhZJ5oOberQuEhAlC?=
 =?us-ascii?Q?Q5cCdd7T+krpki9++1lG6DWM9tbTb6HFewHyx0p8jMlOQm1TGVaFLqQiLeN1?=
 =?us-ascii?Q?9Jqh3zroxcPsvCY//pEBczdeBxA5C2ih70TNkbPCfCbTsrN4IU5LrU1JJfOL?=
 =?us-ascii?Q?geMH3sk53/ulcM7YW4yRtpYNvfUFVMxFA4Pngsgfy6kwnQHd58dldEq9psy9?=
 =?us-ascii?Q?ta7gbSgN0zSVHv7+oot2let0KoV+gHSfEVd/XdPF11vl4POnxXb4tySwWz8G?=
 =?us-ascii?Q?LC/vDOsO3W0IijDdVoPvX3XyUqYsjiewWOgmXjdJKHwncIxf+dm92JtAc9f0?=
 =?us-ascii?Q?YNg9gBaYzoD/mvTGipYiBaYjvxy4Q1TzG5OkoCDJkMlPrDCHbGEmUr+wNLuE?=
 =?us-ascii?Q?2UhzwgArnNIaZeIUijWLtrJWz5YYgJDN9QDAvMujdmBqvOXjk/AwBy4NhyqC?=
 =?us-ascii?Q?pf8mR3hBjAZwlN18QCZIda9f6AU0UXJ3gWCsfR2AEuERuDoy9lrFZ5bHFJUG?=
 =?us-ascii?Q?N/ISWts6ZHHJyjdqdnyvtceaY0iQkQcEBa8RW0QlQ4cG27NhBUs6TmNieKli?=
 =?us-ascii?Q?hnj4YXHtsUdB/NkKOkHVKXplKUr/6BjOhoMOq3PXlQd4HPdscxF7OgqVq4qO?=
 =?us-ascii?Q?wDs32KgBSachBYlDiJ7eRlybSHltENpOt5EFV4kQQ/j7LNeJzzacfifPj6fs?=
 =?us-ascii?Q?fsSltaZJ+pvcBl6G6bPcReaqRWutMm+95cEcBCi0SJh2EVgmsV52sD3MZb9q?=
 =?us-ascii?Q?LY+M/4UEQ1bsLJZNgsbXHhwgG+IDdNDAw3N/1mrXzQ1ejX+5r99sRkVdmOPg?=
 =?us-ascii?Q?e+ffwNCj6Fh8+DdULMS1G38O4KQ1tTdGnJWaHXKrpr+/HzEpzQ2Q7umojElv?=
 =?us-ascii?Q?xwi2irifO34Mfk0QZX+ZIC4PM1c29xu8nHOZhm2jEOkKmRo5s1RJo7JVPh2i?=
 =?us-ascii?Q?to6ou5HGdppAZVnIvNXEuWQLEPWEdA95UrVuC4NNJHU0kjQp+JpaZ24pI1DI?=
 =?us-ascii?Q?GncgjASTAoTdJ9X4CFECLdkjaAvW4YPeDGzCSLmMzy/EqaHz2gQBLpJmLySK?=
 =?us-ascii?Q?SUOT3Ty+N6wFbqADlIvWp2InhY/IuF/VxpFW2fdJXd5dhcpXa5FXPkc++L+9?=
 =?us-ascii?Q?pnFDU5vqf2enSXG3Uk9sCigwKrZrrMxBVHw4M0wu?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2067d3-5dca-4be8-d2bb-08de30db71a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 13:13:39.4872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nvsur7MQm2LC4jXmN+Yb2lvSRkUL8pxza5zhhbslc36TcIfkKOv/WRm47zoBAxkwhNMTTcXgHIX3bgAt9gPtgob9RkDZZxCON+lruBTL+tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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
> From: Sharma, Nishit <nishit.sharma@intel.com>
> Sent: Monday, December 1, 2025 2:34 PM
> To: igt-dev@lists.freedesktop.org; Sharma, Nishit
> <nishit.sharma@intel.com>; Gurram, Pravalika
> <pravalika.gurram@intel.com>
> Subject: [PATCH i-g-t v9 01/10] lib/xe: Add instance parameter to
> xe_vm_madvise
>=20
> From: Nishit Sharma <nishit.sharma@intel.com>
>=20
> tests/intel/xe_exec_system_allocator: Add parameter in madvise call
>=20
> Add an 'instance' parameter to __xe_vm_madvise() and xe_vm_madvise()
> to specify which VRAM instance should be targeted for memory advise
> operations.
> Getting compilation issues in xe_exec_system_allocator test after adding
> 'instance' parameters in xe_vm_madvise(). As a fix 0 as instance paramete=
r
> passed in xe_vm_madvise() calls available in xe_exec_system_allocator tes=
t.
>=20
> Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
> ---
>  include/drm-uapi/xe_drm.h              |  4 ++--
>  lib/xe/xe_ioctl.c                      | 13 +++++++++----
>  lib/xe/xe_ioctl.h                      |  9 +++++++--
>  tests/intel/xe_exec_system_allocator.c |  8 ++++----
>  4 files changed, 22 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h index
> 89ab54935..3472efa58 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -2060,8 +2060,8 @@ struct drm_xe_madvise {
>  			/** @preferred_mem_loc.migration_policy: Page
> migration policy */
>  			__u16 migration_policy;
>=20
> -			/** @preferred_mem_loc.pad : MBZ */
> -			__u16 pad;
> +			/** @preferred_mem_loc.region_instance: Region
> instance */
> +			__u16 region_instance;
>=20
>  			/** @preferred_mem_loc.reserved : Reserved */
>  			__u64 reserved;
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c index 39c4667a1..221fd=
7c62
> 100644
> --- a/lib/xe/xe_ioctl.c
> +++ b/lib/xe/xe_ioctl.c
> @@ -687,7 +687,8 @@ int64_t xe_wait_ufence(int fd, uint64_t *addr,
> uint64_t value,  }
>=20
>  int __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> -		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> policy)
> +		    uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> policy,
> +		    uint16_t instance)
>  {
>  	struct drm_xe_madvise madvise =3D {
>  		.type =3D type,
> @@ -704,6 +705,7 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t
> addr, uint64_t range,
>  	case DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC:
>  		madvise.preferred_mem_loc.devmem_fd =3D op_val;
>  		madvise.preferred_mem_loc.migration_policy =3D policy;
> +		madvise.preferred_mem_loc.region_instance =3D instance;
>  		igt_debug("madvise.preferred_mem_loc.devmem_fd =3D
> %d\n",
>  			  madvise.preferred_mem_loc.devmem_fd);
>  		break;
> @@ -731,14 +733,17 @@ int __xe_vm_madvise(int fd, uint32_t vm, uint64_t
> addr, uint64_t range,
>   * @type: type of attribute
>   * @op_val: fd/atomic value/pat index, depending upon type of operation
>   * @policy: Page migration policy
> + * @instance: vram instance
>   *
>   * Function initializes different members of struct drm_xe_madvise and c=
alls
>   * MADVISE IOCTL .
>   *
> - * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE.
> + * Asserts in case of error returned by DRM_IOCTL_XE_MADVISE
>   */
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> -		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t
> policy)
> +		   uint64_t ext, uint32_t type, uint32_t op_val, uint16_t policy,
> +		   uint16_t instance)
>  {
> -	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> op_val, policy), 0);
> +	igt_assert_eq(__xe_vm_madvise(fd, vm, addr, range, ext, type,
> op_val, policy,
> +				      instance), 0);
>  }
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h index ae8a23a54..bbee0=
6a9d
> 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -100,13 +100,18 @@ int __xe_wait_ufence(int fd, uint64_t *addr,
> uint64_t value,  int64_t xe_wait_ufence(int fd, uint64_t *addr, uint64_t
> value,
>  		       uint32_t exec_queue, int64_t timeout);  int
> __xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> -		    uint32_t type, uint32_t op_val, uint16_t policy);
> +		    uint32_t type, uint32_t op_val, uint16_t policy, uint16_t
> +instance);
>  void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t range,
> uint64_t ext,
> -		   uint32_t type, uint32_t op_val, uint16_t policy);
> +		   uint32_t type, uint32_t op_val, uint16_t policy, uint16_t
> +instance);
>  int xe_vm_number_vmas_in_range(int fd, struct
> drm_xe_vm_query_mem_range_attr *vmas_attr);  int
> xe_vm_vma_attrs(int fd, struct drm_xe_vm_query_mem_range_attr
> *vmas_attr,
>  		    struct drm_xe_mem_range_attr *mem_attr);  struct
> drm_xe_mem_range_attr  *xe_vm_get_mem_attr_values_in_range(int fd,
> uint32_t vm, uint64_t start,
>  				    uint64_t range, uint32_t *num_ranges);
> +void xe_vm_bind_lr_sync(int fd, uint32_t vm, uint32_t bo,
> +			uint64_t offset, uint64_t addr,
> +			uint64_t size, uint32_t flags);
> +void xe_vm_unbind_lr_sync(int fd, uint32_t vm, uint64_t offset,
> +			  uint64_t addr, uint64_t size);
>  #endif /* XE_IOCTL_H */
> diff --git a/tests/intel/xe_exec_system_allocator.c
> b/tests/intel/xe_exec_system_allocator.c
> index b88967e58..1e7175061 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1164,7 +1164,7 @@ madvise_swizzle_op_exec(int fd, uint32_t vm,
> struct test_exec_data *data,
>  	xe_vm_madvise(fd, vm, to_user_pointer(data), bo_size, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      preferred_loc,
> -		      0);
> +		      0, 0);
>  }
>=20
>  static void
> @@ -1172,7 +1172,7 @@ xe_vm_madvixe_pat_attr(int fd, uint32_t vm,
> uint64_t addr, uint64_t range,
>  		       int pat_index)
>  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
> -		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0);
> +		      DRM_XE_MEM_RANGE_ATTR_PAT, pat_index, 0, 0);
>  }
>=20
>  static void
> @@ -1181,7 +1181,7 @@ xe_vm_madvise_atomic_attr(int fd, uint32_t vm,
> uint64_t addr, uint64_t range,  {
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_ATOMIC,
> -		      mem_attr, 0);
> +		      mem_attr, 0, 0);
>  }
>=20
>  static void
> @@ -1190,7 +1190,7 @@ xe_vm_madvise_migrate_pages(int fd, uint32_t
> vm, uint64_t addr, uint64_t range)
>  	xe_vm_madvise(fd, vm, addr, range, 0,
>  		      DRM_XE_MEM_RANGE_ATTR_PREFERRED_LOC,
>  		      DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM,
> -		      DRM_XE_MIGRATE_ALL_PAGES);
> +		      DRM_XE_MIGRATE_ALL_PAGES, 0);
>  }
>=20
>  static void
> --
Reviewed-by: Pravalika Gurram <pravalika.gurram@intel.com>
> 2.48.1

