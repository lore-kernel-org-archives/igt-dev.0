Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5FBCFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 11:46:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB93210E627;
	Tue,  2 Dec 2025 11:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4FBU0Mf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FC610E627
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 11:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764675979; x=1796211979;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GWNajxa5xZlrKNXbuYGeUSfzrLEUGvHsS3t/g+BQTYY=;
 b=n4FBU0MfeRO0aESSQZfSrqxvtBGdlR48B9pz/nv3ZkEk6IdDzstg/7jI
 EXWwIgL03GXRNdvsrLHRkrrIXP8QEb2pkcrtkDPvRYyzLQF6AzlWNOIOm
 nw5YKExVKZy16KqmjskjBs9AXUj6jCHC0DgjA/8FddMYqDvYakGP9RRTq
 hYxZhneX+ENexso6cYN3BrmSC7LjiapCXTkJXY7LrjcC6gsNmvv6QoXmV
 xy07OZSjWAeDwX8EFdWcnPmSgpEUNGj5pNkXBNLAf5vn2o7X4peVsBkgn
 CcInb//GHph+R9J+Pv+Z4+p+xXC00JVWm5g/lH221V9B3WhoGi7lyQ30i g==;
X-CSE-ConnectionGUID: JpRFMJg5RtCtl2QovOMwoQ==
X-CSE-MsgGUID: 0q38hS8GTFCqT0r7IStCjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66528808"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66528808"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:46:18 -0800
X-CSE-ConnectionGUID: e9gXbf4LRYOP8jDULDz1wg==
X-CSE-MsgGUID: hvkDDaf5SACDcivbJe983w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="199298214"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 03:46:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:46:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 03:46:17 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 03:46:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYQTb/qtCq3L62wcENi8xMF/FJ0CmiGNKAiY8sR5lu6Mc4xQ3m9nTNmnUEoglSyBNn2QS0nPmfXT755/IpA5U+fIDaVcpF09jvuhP6DWAIcfFXMturRtj9QIjqiIJ9ejW5jq++jjEzoAwhhm7kEoev5NJhWWmQuytyr6hguW/wWPqRRZpKLCtQRrIhL9CMA4ewOhvrBvHCmb/LY2mzFjMq5eFfT8yBHCVELiwjs/luW3Eqiph2ed6YEMH6gK0macbyznv4EBKgvgIMY/4lW/QNmoLXEppDkFqY2AHuyLy1QCPPHD8zrFXBr06QStfZeTb08xxrSb49MXI2TpgxAO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqvv4vI6XQi2yE02ih7XiKg5LD/QSbkVK2rleAFlUAg=;
 b=MpjzbqG1/xZwgmbUt2wsTHG6hF70zyV+Xnn+eeVHEgV9qqbDsnjs51LusyGcBldeysoZuaM+ddkFO5URAkmgKkmV0MzK+99Fjh6ln8vS4fz50nVBPghUgscOirHf9zECb8tacnnyUdB82o9Rxh349s66gZvadxWDUlkunI1wcIBsoLDqqwD6p6OVltF7R61ukqqJju24/rKb/PQgHQNbt8lBE18ZYN3QBJRhZ0mUaJpudXLQ5f3rZK/rGG+4z6NLGtIigJK1/LuZeLAGGm+OgWZzFwBE6jKaTF1N5EOLzAJsORzLZqU1FWE/5Iv2HObuQtQOQeVanBElK3TBzZ4wTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB5747.namprd11.prod.outlook.com (2603:10b6:208:354::22)
 by DS7PR11MB8825.namprd11.prod.outlook.com (2603:10b6:8:255::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 11:46:09 +0000
Received: from BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d]) by BL3PR11MB5747.namprd11.prod.outlook.com
 ([fe80::d721:2dc5:b225:7f6d%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 11:46:09 +0000
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH v2 16/19] tests/intel/xe_exec_multi_queue: Add submission
 sanity test
Thread-Topic: [PATCH v2 16/19] tests/intel/xe_exec_multi_queue: Add submission
 sanity test
Thread-Index: AQHcWpr7LK7fHDU81EqMPbaGSpjTz7UOTROw
Date: Tue, 2 Dec 2025 11:46:09 +0000
Message-ID: <BL3PR11MB574719B064482605C0286647D0D8A@BL3PR11MB5747.namprd11.prod.outlook.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-37-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-37-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB5747:EE_|DS7PR11MB8825:EE_
x-ms-office365-filtering-correlation-id: ebefc396-cb94-4084-2d04-08de319862d3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?neBAUi7zquZgNHVMl52DmFMR7S7OJh/AlmUCyfpeQakW4D5v62ApJcmPFMrc?=
 =?us-ascii?Q?knQcQBbNvqHFsao4rCJa/SKMnjouTIKtP9IxgHJ6K6MV7I70jIwYMNU4D1ek?=
 =?us-ascii?Q?x0sfqDjPpTxIxO5qBubl823PkQSsSDWLWf62EHwPeYGh4y5Zd4gwG7GJ0u9V?=
 =?us-ascii?Q?tKHnebleUdApJrSNSR0DGLRfTEBduyxAOcMiph1SbVIvFAsCq90F2iNENexS?=
 =?us-ascii?Q?pXsB5D5B6PSZpn/i7uzzQlqC+kxUU7MGRRLY6LReuXqJEhBJKKMawbcGqWDS?=
 =?us-ascii?Q?wwtcqNW75o9PP25KgLBHPqb/msIbAvRhjOz8F2IWSlllKypee3UDx6nyQtrh?=
 =?us-ascii?Q?BwTyDagpwwGhzhreCSOt5jGq2rkJXw80h5dxfwhfe7zl9JiA0u0NFhcsF+go?=
 =?us-ascii?Q?MzAU5OkFg1uvM8wT54E0bZouleBwKTgSY7cBIn/V8zZYAhS9WgoXpe/Wy/1c?=
 =?us-ascii?Q?DrLLWUEhq+ECpc0jZmrDJLIQ44adK21fMiiqmRY8NeQD8qFcaXI+wZJxRzz5?=
 =?us-ascii?Q?DhyyLfhsTAzBTQg1VgiA/+JB5aNQfj2SSXOro41Imv0VYJpR1Nk6yh8+hjIQ?=
 =?us-ascii?Q?XGjVFMNYQ1x9uqsgpv921+4aSjK/+iYvNmoXXr1XogGiDbSgLeL5QS3VOQjm?=
 =?us-ascii?Q?DEux20KJWZJzCecTQ1+Nnk6/QX80fGh6RHZFl0aQG/IIBPcBoyy2ApKSF++Y?=
 =?us-ascii?Q?CaffGV3HMGoT6idQm8YyYxYqcSSIZtJTyJaxcPbDjxg00NUnfJdqdoOqYzIh?=
 =?us-ascii?Q?1Gd2Nl+LR0ChIqi3qqRfK4qzYsQh45gldxP5wf4DV14N75OOZbcxwsqRGzoj?=
 =?us-ascii?Q?9yhTi56IcO35khiALKEcLdpbgFTAcvpM1l/4U1opzueezU+kUVqbtTM8EF++?=
 =?us-ascii?Q?nTUtBLJ4rn9WBPEriQItX9vJIAz0WIvVUTPTnVR0TFeOjwmPLYQ/Rx1c0nnR?=
 =?us-ascii?Q?hRf3PiiYrMmvPdell8RalffTy2YAezfXGI0l673qgSxQ2F9lOwyd0h9f7P0C?=
 =?us-ascii?Q?3r/SxMTg4bVADBToV3LXlDwDwXBL71vGXCuyzpkD1WJHXbzOwGVS0nB3jk6J?=
 =?us-ascii?Q?tFDHuJte2OznVS7Vv5CjIfF50B62TXZPEZtbT4U1nlsU8aVNMCfGcSG+rOpQ?=
 =?us-ascii?Q?92OWKFn0JwcSs1YNBIF+KuR2uZKaS5ibTCE8Ac4FApfpCLFWigBLkoQA3Obn?=
 =?us-ascii?Q?XsnBAFYuLLQ8BGMBjbiv0Rlg3uifSfht3ltGl0hY1favz/YDnChEMionQ2yh?=
 =?us-ascii?Q?zRLZ3UZxfjHseDQ3HwJRpkANOzrrr79OYTXsWtEDbnusWz+aPH52J04lYvdY?=
 =?us-ascii?Q?BTpfvcWn4KcGGdDlnPu1xvgAj1Aqi7d5lT0j66Qt7Do5gTwdInA60BkY8LmW?=
 =?us-ascii?Q?RAGSMqLxs5mPioKfY+dPEBHl+lZKondB7EAtK71yJZTaT7vrroyeWy8LQ/gd?=
 =?us-ascii?Q?I77Ud4Jbjo0TL8f0pi2XfGBeJzOWjTuhx4LJpRZObO1B6DNvwUsIBzk6mSfc?=
 =?us-ascii?Q?m9RyMtjzXJJm7LFbO6bDzz0PQZxqJhmn5O51?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB5747.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?M1lIZghIWhyY6cBNA/Bgz88RB5B3/gQ5AjWYHReMMlLK8iR6zNlqWKD15W+W?=
 =?us-ascii?Q?Yp1yiEsLrA8Y6af3I6chn3tDFoZV0nwxCK7QTil7Go/v7467QwUGiET5dFgZ?=
 =?us-ascii?Q?m4rQRa75kipaqy7epnemyO/vpZOG2kFVMSttRqpBUBAvN0Ehtf/x/Uz6Xrh5?=
 =?us-ascii?Q?yUn9+9hOOK2kCzqdwmarmY/vWcoLXDGTjKFRkSYls2sPkRc8mEBngZR5UWJ8?=
 =?us-ascii?Q?7jkq4rwV0ELEa+t6wJqGJIu6FumMqLUPkXJrfW6v/3QWNAC8NXfzqJO/5AzK?=
 =?us-ascii?Q?K4ffnVnrq/15thOs40kHzPlZQ5vlGabt51mgNl0e8d9yOHPSPshoiirTiBvu?=
 =?us-ascii?Q?N5U3OK+9YX0i+szz4lTewD0vF3GZZ4cL3PvdYBAaGZeaQZsagc6z4E879upA?=
 =?us-ascii?Q?vJR8d1yPpFwUtUi8tRM8GxCObL7oMjLROMj/HH3pOxT5/7zXQBltdQwArMEM?=
 =?us-ascii?Q?wVI2xYHpnp2RIyq84I4eVvdjix+juSyEhsRJourJLlb2PEbFWCkP3ASRYOxe?=
 =?us-ascii?Q?l8EMn7+Bg53Qkq/hj9WjThSxLwNNvFZH8av6Cy8cDxLRHoKiAC+kCJcbN3Oz?=
 =?us-ascii?Q?k7iRsEev0uO73y+oSWHV12PgYvt1V+pnZljxKQedTei/VByBZ1Hadm7Jvbz/?=
 =?us-ascii?Q?QYMZNMpSs21AQY3RYUaaaS21xC3Jt3PQ5hUpE+o2WjSu+tKzr7w8kLlaHO7u?=
 =?us-ascii?Q?FR2RoJZta8eqFO6Fe4HHAU66aLuGnsawa1iUnM6JNosf2ymPSZmS/WZ38Cpa?=
 =?us-ascii?Q?c/5PndiKR+hrJdL3N4zMIP2oc5NW8BoU1HN9VMELFwoIQ2WfDYwjrgPSjZFU?=
 =?us-ascii?Q?DfvtdtGsYmVCgmkfHvy9buRbe3xaXAeZO1MvaClcWVNuCY7heOeDAvP+R8C7?=
 =?us-ascii?Q?2dW7t28YtimuzOt/4yzk4ejwCq88Ij2YV71IY7pOwNkvuBO7/4IFJ4Gomy8k?=
 =?us-ascii?Q?Jt4nTuSzunXicHBK9v5TG0RmmwgosaHfubyPfFR2CSRPI0g9TvXaL3CehleS?=
 =?us-ascii?Q?hngNtDSLB7T2D8cw+3qlE1O44L5zRxuhjq8d7SvFiapkPKrWMtxTxFCgic3/?=
 =?us-ascii?Q?zu81boVFqfKccXa29I1++YI2xDkVrgJodCfsYuOIu2B7ct9ka79UwbM6oM1y?=
 =?us-ascii?Q?IsitcXPC2cy4FRQ4ptuhaSMwV14lG1Bh2lmqVLB3rIIqm29bhMgcBsyrdDBK?=
 =?us-ascii?Q?Gwk2HMwusC0pKQQ6a+9rDM2BfUUw2tUQgN+yXDxpWM6zIY9LlAOxExqwOjoG?=
 =?us-ascii?Q?+xBt81cCIT+Ti6pkZMG1jrDNaIDJkfuSgB3STKlOU6u4BY02aJ0xplTltIqJ?=
 =?us-ascii?Q?0reLgvrzd9BSzjrfDaTdXgNy73OWz8SvU2DbHlVZCUVqITohvGFzFZHoJ/iy?=
 =?us-ascii?Q?aYwyqxe3s5bh27JSytJzyC6bl63Ak0Lz8Lr5Jd/8s/ibJWEmK4cuRJ06kq7K?=
 =?us-ascii?Q?wuHKy/SSVZ/pcmxu/e/79iXEs9DhFzaeCHzclQcQP/GDtdHIUYXGC/xap99z?=
 =?us-ascii?Q?5xWVwT6oIMZEdkbcP8g9BfRc8bdQTn8p1khkGpfBGTOg9qJECgUnza2Timg8?=
 =?us-ascii?Q?DnIq2YO6+Q6FdA3BEJu1Tct7a9/RJPxPt3dcH5++?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB5747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebefc396-cb94-4084-2d04-08de319862d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 11:46:09.5714 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fyl54LayL+K8qLpOQOWZuhGivZGtOWyhUMkVgfowOawfvJ0QGQL7IQXeimMRSsxIaPElz6Da7/6GAveHSK3DH8qIMcMRhiM2nPC/C9MfKaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8825
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
>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>Sent: Friday, November 21, 2025 9:27 AM
>To: igt-dev@lists.freedesktop.org
>Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>; Dandamudi, Priyanka
><priyanka.dandamudi@intel.com>; kamil.konieczny@linux.intel.com
>Subject: [PATCH v2 16/19] tests/intel/xe_exec_multi_queue: Add submission
>sanity test
>
>Add sanity test involving exec submissions in multi queue group.
>
>v2: Remove simulation related code (Priyanka)
>    Use BASE_ADDRESS macro for address (Sai)
>
>Signed-off-by: Niranjana Vishwanathapura
><niranjana.vishwanathapura@intel.com>
>---
> tests/intel/xe_exec_multi_queue.c | 139
>++++++++++++++++++++++++++++++
> 1 file changed, 139 insertions(+)
>
>diff --git a/tests/intel/xe_exec_multi_queue.c
>b/tests/intel/xe_exec_multi_queue.c
>index 06e898a47..9f7b3b4d7 100644
>--- a/tests/intel/xe_exec_multi_queue.c
>+++ b/tests/intel/xe_exec_multi_queue.c
>@@ -44,6 +44,9 @@
>
> #define BASE_ADDRESS	0x1a0000
>
>+/* Number of queues in exec sanity tests */
>+#define NUM_QUEUES		2
>+
> static void
> __test_sanity(int fd, int gt, int class, bool preempt_mode)  { @@ -216,6
>+219,138 @@ test_sanity(int fd, int gt, int class)
> 	__test_sanity(fd, gt, class, true);
> }
>
>+static void
>+__test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci,
>+unsigned int flags) {
>+#define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>+	struct drm_xe_sync sync =3D { };
>+	struct drm_xe_exec exec =3D {
>+		.num_batch_buffer =3D 1,
>+		.num_syncs =3D 1,
>+		.syncs =3D to_user_pointer(&sync),
>+	};
>+	uint64_t vm_sync =3D 0, addr[NUM_QUEUES];
>+	uint32_t vm, exec_queues[NUM_QUEUES], bo[NUM_QUEUES];
>+	int64_t fence_timeout =3D NSEC_PER_SEC;
>+	struct xe_spin *spin[NUM_QUEUES];
>+	size_t bo_size;
>+	struct drm_xe_ext_set_property multi_queue =3D {
>+		.base.name =3D
>DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>+		.property =3D
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP,
>+		.value =3D DRM_XE_MULTI_GROUP_CREATE,
>+	};
>+	uint64_t ext =3D to_user_pointer(&multi_queue);
>+	bool preempt_mode =3D flags & PREEMPT_MODE;
>+	int i;
>+
>+	sync.flags =3D DRM_XE_SYNC_FLAG_SIGNAL;
>+	if (preempt_mode) {
>+		sync.type =3D DRM_XE_SYNC_TYPE_USER_FENCE;
>+		sync.timeline_value =3D USER_FENCE_VALUE;
>+	} else {
>+		sync.type =3D DRM_XE_SYNC_TYPE_SYNCOBJ;
>+		sync.handle =3D syncobj_create(fd, 0);
>+	}
>+
>+	vm =3D xe_vm_create(fd, preempt_mode ?
>DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
>+	bo_size =3D xe_bb_size(fd, sizeof(struct xe_spin));
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		bo[i] =3D xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>eci[0].gt_id),
>+
>DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>+		spin[i] =3D xe_bo_map(fd, bo[i], bo_size);
>+		exec_queues[i] =3D xe_exec_queue_create(fd, vm, eci, ext);
>+		if (i =3D=3D 0)
>+			multi_queue.value =3D exec_queues[i];
>+
>+		addr[i] =3D BASE_ADDRESS + i * bo_size;
>+	}
>+
>+	if (preempt_mode)
>+		sync.addr =3D to_user_pointer(&vm_sync);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		xe_vm_bind_async(fd, vm, 0, bo[i], 0, addr[i], bo_size, &sync,
>1);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>fence_timeout);
>+			vm_sync =3D 0;
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
>+
>+	/* Validate job submission on secondary queue before primary queue
>*/
>+	for (i =3D 1; i >=3D 0; i--) {
>+		xe_spin_init_opts(spin[i], .addr =3D addr[i]);
>+		if (preempt_mode)
>+			sync.addr =3D addr[i] + (char *)&spin[i]->exec_sync -
>(char *)spin[i];
>+
>+		exec.exec_queue_id =3D exec_queues[i];
>+		exec.address =3D addr[i];
>+		xe_exec(fd, &exec);
>+		xe_spin_wait_started(spin[i]);
>+		xe_spin_end(spin[i]);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &spin[i]->exec_sync,
>USER_FENCE_VALUE, exec_queues[i], fence_timeout);
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
>+
>+	/* Destroy primary queue */
>+	xe_exec_queue_destroy(fd, exec_queues[0]);
>+
>+	/* Validate submission on secondary queues fail after destroying the
>primary */
>+	xe_spin_init_opts(spin[1], .addr =3D addr[1]);
>+	if (preempt_mode)
>+		sync.addr =3D addr[1] + (char *)&spin[1]->exec_sync - (char
>*)spin[1];
>+
>+	exec.exec_queue_id =3D exec_queues[1];
>+	exec.address =3D addr[1];
>+	igt_assert_eq(__xe_exec(fd, &exec), -ECANCELED);
>+
>+	if (preempt_mode)
>+		sync.addr =3D to_user_pointer(&vm_sync);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		xe_vm_unbind_async(fd, vm, 0, 0, addr[i], bo_size, &sync, 1);
>+		if (preempt_mode) {
>+			xe_wait_ufence(fd, &vm_sync, USER_FENCE_VALUE, 0,
>fence_timeout);
>+			vm_sync =3D 0;
>+		} else {
>+			igt_assert(syncobj_wait(fd, &sync.handle, 1,
>INT64_MAX, 0, NULL));
>+			syncobj_reset(fd, &sync.handle, 1);
>+		}
>+	}
>+
>+	/* Destroy secondary queue */
>+	xe_exec_queue_destroy(fd, exec_queues[1]);
>+
>+	for (i =3D 0; i < NUM_QUEUES; i++) {
>+		munmap(spin[i], bo_size);
>+		gem_close(fd, bo[i]);
>+	}
>+
>+	if (!preempt_mode)
>+		syncobj_destroy(fd, sync.handle);
>+
>+	xe_vm_destroy(fd, vm);
>+}
>+
>+/**
>+ * SUBTEST: exec-sanity
>+ * Description: Run exec submission sanity tests
>+ * Test category: functionality test
>+ */
>+static void
>+test_exec_sanity(int fd, struct drm_xe_engine_class_instance *eci) {
>+	__test_exec_sanity(fd, eci, 0);
>+	__test_exec_sanity(fd, eci, PREEMPT_MODE); }
>+
> static void
> __test_priority(int fd, struct drm_xe_engine_class_instance *eci,
> 		unsigned int flags)
>@@ -901,6 +1036,10 @@ igt_main
> 			xe_for_each_multi_queue_engine_class(class)
> 				test_sanity(fd, gt, class);
>
>+	igt_subtest_f("exec-sanity")
>+		xe_for_each_multi_queue_engine(fd, hwe)
>+			test_exec_sanity(fd, hwe);
>+
LGTM
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 	igt_subtest_f("virtual")
> 		xe_for_each_gt(fd, gt)
> 			xe_for_each_multi_queue_engine_class(class)
>--
>2.43.0

