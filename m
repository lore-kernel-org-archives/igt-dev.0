Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98B6AD3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 02:46:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129E10E363;
	Tue,  9 Dec 2025 02:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c78qc7ik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24CD10E363
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 02:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765248365; x=1796784365;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yBHPcUV4QmjwM7loQAqEINqUJsmsuYLTWUayVgRArKU=;
 b=c78qc7ikQ/VIvCquUiibLk8WSJBr/RVYdb1zx6rsTG9gvRvNRQEG2ZEI
 R8mOk0plIthYb9ixpxNrfDzR1uBdiUrG1UxRN7nso1zGVRNLTo/Pok26o
 LfxvExxcD+KvOa3Oo5R+sV5p+/NyYIq5l7dS6UoS8atzhUwTWr7afJnJc
 1wqqZiLULWplyD4s5ylUQyNkwg/HDN5BTgqrlDfHWQfaKlqFgmXe7LioS
 Za/MvQXIoYGY0MVaPIQYnmeg2TGCHYhTfx1QSegSOXQEJsXKc/YEAtuSj
 L+T4NHAdD+WGDyhHAWpGLd7l57Yvpw7mMWiMytnWbLxi6BC2vJAd74E4G A==;
X-CSE-ConnectionGUID: 5O6dQlLsSbCcWPLmcKebnQ==
X-CSE-MsgGUID: G4EtU5lpS6e34RQZYpBzlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="54744561"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="54744561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 18:46:04 -0800
X-CSE-ConnectionGUID: kp3FUhCUQZyyL65yZkRAQg==
X-CSE-MsgGUID: EGAE8mN/T3GTkn7drZ7N8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="196882521"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 18:46:04 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 18:46:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 18:46:03 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.10) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 18:46:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aU26LxOtZ391WSbsipyalk6ymtDxOA2oS6dWq+N/UD3xDGJgYgOlRVxYrbmrAENjMmROazp1KWdS9r9nGY2VFs6+Rx2qdG8AU9dHXuuUzYvU6RZALWxn1r0TI77e8bH4ywkUD0cqat4NJqgaAbSijcSHV8J/bQbLjE9fA+ewpm9TDq4r/z/q+xeQ1TJJN7zV55D6YdQDsFcdEYV2gUERt+/SPJTQaGXypp1RMsOkS8E+ajjtx/+UZc5pMYe6CB2NAXrvfamLoeowCHkebc1jCRVK9FnueasJpeb5guOR9O+FC+tlC2gylVIhP2fwtiu8Vrkc91N+rwhTAZO8ys8bfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dw9VXzZiGkSzzEwT0pVv3/1wTlhDwbn1Pjxhvg9gY24=;
 b=tfsCG+r17OWZiM+InK6OosbM8QhTGgm68Q8OjqONDl19TjpyJVFIYls+ldAh98reHB+wxkD4cEhRDbV0Il2PXRdTfwWhTMOl7jFmWUQLesT9Xj+1bsxUB0wj23LP2UClPN/5r1XjSoPSkO8VFaaBqKZL5D51lQOUKa9ORt5h+QpIawJdciF78/SS/lT9H15Uis41OWcI+Nrythz3ztLXKqxk/ov3ijwcgFbtgR5XMU7fOyTSDTjxn4G2Ew1SUn174vmKOWEeNZdwZkxiEM88QbnNAL/zdQxuHCkgdMHimjJHj//q6NqH+lmP/aXXQZFIEK1YfKNks4SwlSF38jlbEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 02:45:56 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%4]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 02:45:56 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "chaitanya.kumar.borrah@intel.com" <chaitanya.kumar.borrah@intel.com>,
 "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe
 due to missing writeback support
Thread-Topic: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe
 due to missing writeback support
Thread-Index: AQHcaDV2BkHOiWnYk0uqyflTwyMr+rUYmz1Q
Date: Tue, 9 Dec 2025 02:45:56 +0000
Message-ID: <DM4PR11MB63121171BA58A269DDACA7C990A3A@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20251208113243.1242127-1-swati2.sharma@intel.com>
In-Reply-To: <20251208113243.1242127-1-swati2.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA0PR11MB8379:EE_
x-ms-office365-filtering-correlation-id: 5a923a26-3836-4cac-08d5-08de36cd13e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?83qre/KwnDkyuYVMptojJMZmCo+dLVSsC03wKP/fjqCpB51OWCmQe9D6qSGs?=
 =?us-ascii?Q?QinQeak4j1ptNwmZ4nzZrnsAaIi3ARtvHkUlKaPTGYCQOOgj/nUVsDFsiP3O?=
 =?us-ascii?Q?hw7qswgrUSai2YjRnQPBZJoWf7VTlAex4SZx0DbgZ2uNskgkQfhn6Wrs870J?=
 =?us-ascii?Q?FzV6vTuTVwNyW7Fs/leZjT2NTFUKJFdfK5dSXuQr4TB9RbCqSGaFId2S7ct6?=
 =?us-ascii?Q?MRzf8OCHMAH+0mliG5j+IHkPMSQpMb58MOwUznIQuiqX/Z+vG3xMV7nDCPtD?=
 =?us-ascii?Q?jNpiZs7RSStiXNl9DVGZd6K2oVvlovGvy0JbpglaA5kliHZsKWP5YXD/nadc?=
 =?us-ascii?Q?ienHP0X0EOPKxrf9AB7MIhVn+WEqa5xnZAj0SYXIhiLV65FBF81WZp95+HMO?=
 =?us-ascii?Q?Zx+YU348+5KVIWo4Iv42e8pcmET6Lr8cRMuHTx0OjFIfsJpx6rFiosCsD3i9?=
 =?us-ascii?Q?7/ORpJwEYZqddX7lFdmCRCiMnJJRz+lqji6fDg90ukuA2f/3URvoDWapO2FO?=
 =?us-ascii?Q?bDx6IrcTDuxfBM+gSDjlDo4HzGxFOo9uBpQaMB80JDcmqdlVNYiCPcizfhCZ?=
 =?us-ascii?Q?aTn89SFx2xsNNgvAFtGsH26H5czUvR5Tzf0EQdyYPf/4lxpIgbQJd6QnKeK4?=
 =?us-ascii?Q?sQ7D5AvwTdnsSCG4DYlz2DOlP0vmJU5dxARrVxGCtXPViFU9TDq8u9O6/fLZ?=
 =?us-ascii?Q?H5AVaQLzasQZYuxV0zkPDJLTYF3FPaQ6CxFwuQ49zZVIGeKAy7iPggyY0PJC?=
 =?us-ascii?Q?nHiUggYU7q+zpEUMM7LBycKSp73jh7QEpkp9qcPmgaEBtm6l/gwMx2mkI8UJ?=
 =?us-ascii?Q?MApQUDQ+gKnJmlS3gC8Q52LyrJyyLG4CkS+xps6FVCm2IjILEKTtH9w+oM0G?=
 =?us-ascii?Q?JMMJHAsj9QUYCkQp/cLcXk7g17caWaNQGJ3KrPfeHdAB9wgGtKbxxWkpOzZ/?=
 =?us-ascii?Q?SJUsJTHHFu7rbZPFD7nJpm+tdnqtpb5YHxz+5o2G8O1QWIR2i3cPoE1h7weJ?=
 =?us-ascii?Q?I95yPnRHDRf6gJOtBCTX4cE5JnMYjYUrIFPwbP0XGlg3aO7Mt3grh5nL2RZo?=
 =?us-ascii?Q?TOLDjwtXAlJNvYBmyYFIwL2MUP9BXJ7vA3DMVMFK/233iyL2fmb5evLZKBBr?=
 =?us-ascii?Q?JIK7PNGZQPfHRyuD79eZXymRwpKpHJDZFvqrtpaMEv9KAx5IZ64qqfKcOaD6?=
 =?us-ascii?Q?yZA527SYLkuFxRuQVxb76mew5kH3069i0Su68q+/XVhdcpKZOHXjbxWrWmsE?=
 =?us-ascii?Q?OP7BGncNNzZq8sWdIhoYvfnkOeUqMQKLXAAmZbFB8aQ/1sEqA5P6H+PDSLZ2?=
 =?us-ascii?Q?khKAiZiCs8UNn/N4jmQtpVy7KCNQZhkRraBLSkAKCmIH1sZHRZiZFON487sJ?=
 =?us-ascii?Q?tvQ1WY/82HJU0MG1A9KqPu6awBixWR2z4hskHa+fIw6Cp2VYvc7uivrU7RIv?=
 =?us-ascii?Q?Ct1cj7CiS4MeLMNJvdyr8IHT1GFVIkEiyPuC+3onFvCDWUs6mvGfh3YHtjw5?=
 =?us-ascii?Q?ScIKw9pVbWFlE2eAxppyqSWCq5/m3JLjaxGI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TQF7AsHwaCPKXNa5ZbY/B+4DpjzY1hQ6J9ciaj8GKUuvahb8msA23ixKkbHW?=
 =?us-ascii?Q?0FwWXWu2q9If1VgwBRmbpY+zIw13VtY218EyykD/8SvQPDudTGTkQZFWsRN3?=
 =?us-ascii?Q?h8heXg6sHcEj52PExiTVcJCZyyE8TVq+MVE0V+u/iXrC3IrItpX21YPcvvb1?=
 =?us-ascii?Q?8MhiAEXwockqFRKFs7CxPW0VIizp0+41jUZ26s+xnqrEEAsu3H+uPsypLaMb?=
 =?us-ascii?Q?HYdjfGYVdHBPqUBbypRG6b0Otr5JCQ7AlSxNbu4/bwcI005LAG1eWt9fYPBR?=
 =?us-ascii?Q?f8qi8jCfp9WxqML2vZk8R3Mb75pK7Aje678rZFtlJYzlrfPtvVNrcOLaSTn0?=
 =?us-ascii?Q?nsmu1dS3qwZC+JLPiObEfqUNdzTQi/QVXZeJyvMNakNg6wHvq6be9S85qYAn?=
 =?us-ascii?Q?lbSPfBNeTBR1MyJLsR+vZfBVI4+immFaPlIZ571TGXr+e13rn6aWELXEvOSq?=
 =?us-ascii?Q?sixKX5zIvCMzUUVVFhROe+tqPmNRMxisZxTc1Cznu/kk4P2FaLI1JkisQH0e?=
 =?us-ascii?Q?/IZn2qDEjK176VO453AkHW2Vw0Ob2evkVP9WSHl1VXeqMrDBoZoU/IicwMU9?=
 =?us-ascii?Q?093yzmcRZdw/woiW1rXoVKzyx8cmUZqG/xCwkTg28kDZE27GgiP1fdHnkQle?=
 =?us-ascii?Q?jrtN76RSFcADYd9acKJQMHkrTHNMCJ3iljESHbPET9QHq/FePzPxs4J6NkgX?=
 =?us-ascii?Q?2XWdMB5A6GWP/llE0lTRMiUpUCvR/t4U+j+LdckilVfsrMpb4u4zQ8FCffDT?=
 =?us-ascii?Q?LcIo10atqN0bJRzZKqL0NJ0kdT7aLgosG70mps5TPRkAT5jGy0LGPK/z/RW8?=
 =?us-ascii?Q?F9NhDHeFWOVRAUSnIIBuKWCCPmIlXVcfYDO2h9e3ydiVZldPKgl/i+tP4cWg?=
 =?us-ascii?Q?/aWBX6npT4BRKXOiN9r6bFAvFIKJo7dbFx+7Zd3g9QVI2VG2Qo4Vw9Jnum2M?=
 =?us-ascii?Q?aVV/RJt0g6pRWpmKsdJCno7YkzwO/23p3Kci8AqSgQXya5CAPR/1isqHXc6/?=
 =?us-ascii?Q?jMj0LMfp1+OiXWKT3VyKzQgJogWHZEjB0CnTUNEq242d2XPNjZtI78uIDkfJ?=
 =?us-ascii?Q?wZTI9hdNhCUZiEByCFJUHw2aPbmlQu4wzjwMt2jl2+BWJo0V9UStdLWM+DUA?=
 =?us-ascii?Q?S+DrEmyGOjI3XTjRtBAPzuiHteYXqGdjZPzrjk5kQ/Yx6oQCTmSUANUj4mLH?=
 =?us-ascii?Q?Sk/ZgtAyO6YCZanQSZ0NLUdkH9Vonjl2CoG5a9kbEfiN5yntOJT7fcGNIVvI?=
 =?us-ascii?Q?zk0MjLuHKhD5PgmOcuZ/1ppmdZHzZ3qbKEMtNA6TgTs6Jgw2XLG3kvD4XUdM?=
 =?us-ascii?Q?yFNcCpavp+zVO9Wlsz3NPObUR6Nvv1YoWTkhiCNTanZfyILr8GizEPn5aMRn?=
 =?us-ascii?Q?8TKqV3DCOEqmyDiq5NVrbHepXW8KtFe6VZ2XNBuc9E8YRe96ksafRJ7c6ONq?=
 =?us-ascii?Q?1nDcSb1vyqcHdh7ayCR+2zwkScFMUFYpsb4zoKGauOgFvF9y0rMLOT9xbTA5?=
 =?us-ascii?Q?C/09uMl/1yg/UOj7A9lb1QkfqanmGJBT8Av6WeooYaLna4NiNSJ7Lw7HdBL4?=
 =?us-ascii?Q?9ypEQXJ+NaSutaSLLNM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a923a26-3836-4cac-08d5-08de36cd13e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 02:45:56.2838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABi/ii5P0L+2HOqpjUDl+ynvXXkNCjo3Jr4PrP1oYuLgtMr7C82kM7az1FeJtG4zQdofMcEPg64OE58f/rMivw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8379
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

LGTM.=20

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
> Sharma
> Sent: Monday, December 8, 2025 5:03 PM
> To: igt-dev@lists.freedesktop.org
> Cc: chaitanya.kumar.borrah@intel.com; Sharma, Swati2
> <swati2.sharma@intel.com>
> Subject: [PATCH i-g-t] intel-ci: Blocklist kms_colorop tests on i915/xe d=
ue to
> missing writeback support
>=20
> Colorop tests rely on KMS writeback functionality, which is not yet suppo=
rted on
> i915/xe. Add the relevant kms_colorop entries to the blocklists alongside=
 existing
> writeback exclusions.
>=20
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/intel-ci/i915.blocklist.txt | 6 ++++++
>  tests/intel-ci/xe.blocklist.txt   | 1 +
>  2 files changed, 7 insertions(+)
>=20
> diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.bloc=
klist.txt
> index 96d69ca79..dffe464dc 100644
> --- a/tests/intel-ci/i915.blocklist.txt
> +++ b/tests/intel-ci/i915.blocklist.txt
> @@ -192,3 +192,9 @@ igt@kms_sysfs_edid_timing  # boards (which support 4K
> @ 60Hz) are available in the test environment.
>=20
> #################################################################
> #
>  igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
> +################################################################
> ##
> +# KMS: Yet to add/missing i915 support
> +################################################################
> ##
> +igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
> +################################################################
> ##
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklis=
t.txt index
> 63f969416..bd08aa594 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -89,6 +89,7 @@ igt@kms_plane_scaling@.*downscale-factor-0-25.*
>  igt@kms_prime@.*
>  igt@kms_scaling_modes@scaling-mode-none
>  igt@kms_writeback@writeback.*
> +igt@kms_colorop@.*
>=20
> #################################################################
> #
>  # KMS: Test was written with the idea that edid read shouldn't take an  =
#
> unreasonable amount of time. The timeout is an arbitrary value
> --
> 2.25.1

