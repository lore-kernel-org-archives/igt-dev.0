Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B99C5AD49
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 17:33:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5810E56D;
	Mon,  2 Jun 2025 17:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="djdxXgwn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1A10E2B8
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 17:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748885587; x=1780421587;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KmhBX9aX1BEL6naPw7k67PbI2Pnb4ypalkJJ6ZUKZ90=;
 b=djdxXgwnhmkuc+xHltSjIrYxcnRcFefYz/B2pdfb0nBnU9kNkrK2Kfd+
 eJMNa12IBV4vuWLxUfz0kU74YVlBvOTcHkiSnnVpvjbbPbICFGcusdHE0
 r2eNRVDFhrcWYPtTDVWQ9doc+XB7n6CMhF2z6UUlg02FeBo+0UYYLi19s
 FDQR1rtuX5mmEPo272AC4zxD9/bBXazfIS4RdTloKrvDdbly91H91wkI5
 lv5lU0uSzzmKBR/cNczoiVkUSHKAQdeihWn6ZKhrPRSIekv4eOh8bXdYO
 uObrvZzgXpTqiDiL94Ijtgt6VoowoOYAROIjFaG8bZJoUnpN01j+te+cW w==;
X-CSE-ConnectionGUID: YeWy6P3fQpWlkbcFeuI39Q==
X-CSE-MsgGUID: SmoO1lrfT/mqnMWIDqaiQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="61519436"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="61519436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:33:06 -0700
X-CSE-ConnectionGUID: xeZhQUU6Sdik7CHQNupAZQ==
X-CSE-MsgGUID: eUZjK2iFQuOltVuJ8rGKog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="145541658"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 10:33:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 10:33:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 10:33:02 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.59)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 10:33:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=auG3lRoq8NsE86B/biX6fo0lZ5AvctXHRMVtOqS+LbEHxIyDJv1elwbXc5tZs+T8TnQwkgD88b2TlCX63zxb0uF4qHTrF1Lw8vBpnVHTVU6pmZATSesiMTadFptYbGQ/u/Pni+VpWi8qQJsTT1psIeEqp1E7YLJiCy+zKmqmyX5Emfvep5mTsif/68t6+WLp1LxuHr6w/um02KJhnYEst4wZCsi91kfwllkx1mUAv437I6YGDNp/QASRUO26+sk/cRC2cgUgFTy0CiYmpvHmapP9Fd8ScoHsAOCYYo/TuS3H5U1SCz9fbyf39IjHALnaPZmPKvUtgFXSmkwr5O698A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KmhBX9aX1BEL6naPw7k67PbI2Pnb4ypalkJJ6ZUKZ90=;
 b=giZ0UoMtV3pyiaEkwAHS48//JF26u1OEgj0Hr8434DAcJM6RG1lbFBuO0/8Gl/5LEFiAjrXDPjebVWgaznvAwyr5C0W8uSDfTEuxmxqSyaSwyAdjUH5KmYhV3JeGhZbE8rQmV3o4eb28hAGE4fX4FpaGSQLIFsFtQDtWw5ZblEKh7a/+d5TF5JnaGOTITL7waYKX9Xn/DVhWP1IO4y/4nWfRcN6FPMcVENTJS6MR2bhVNtewaEyvOVPkCRePq15UfxmlwvjJ/llprzFOXJgesZ8FatxsoWLaRTFhdlOCuUKA8t+OUo8XoDxQUWrZ1q9J48NzTbHVUVTz2pxGLIuamQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 17:33:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8769.025; Mon, 2 Jun 2025
 17:32:59 +0000
Date: Mon, 2 Jun 2025 12:32:57 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <riana.tauro@intel.com>
Subject: Re: [PATCH i-g-t 3/4] tests/intel/xe_drm_fdinfo: Rename TEST_BUSY to
 TEST_WITH_LOAD
Message-ID: <ls2vwhvgoci6ezi2syeogxsoi5xeky2nhubcx2hijqcfv7wdj6@vrgxysdc5xyi>
References: <20250520232027.351497-6-umesh.nerlige.ramappa@intel.com>
 <20250520232027.351497-9-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250520232027.351497-9-umesh.nerlige.ramappa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: 570a6a3c-5be3-4cfe-7317-08dda1fb84ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5gb5dcllSQaWOlExbQm7WA/R//vOxzgyEi2zdXXiosfGvb16ssyfsDqdi359?=
 =?us-ascii?Q?pI7OOognz9UHnyrTufa7z0Agi3KuK/jMmVWxZX0AWaXyQkd1sX9tJgkoQtij?=
 =?us-ascii?Q?ABpiwv1xqWC3Y9ch7I5OGqqPn4h2Sbhm97yhe6mSWuar7qX0AapOEdHqRKiM?=
 =?us-ascii?Q?YitDVGDY4m9mQViJL/0vSeQzOURGSmKBcPHhWflWKQlemf632GAx5vv4IbVi?=
 =?us-ascii?Q?GUWi+YDyqjVW5M+AkALs3G+2JpYJAtjOgrN8Om/9NPnBgghl6xGVViNIkKjx?=
 =?us-ascii?Q?zGH3YRuDp+R0Q5WTWoelVnxSZH9+mIskLCWk+CnjSSRSiughB0gGwOJDoIPC?=
 =?us-ascii?Q?YBPd3jMZoBCoFd171tB9mEtIMib+9IySVz882SrQmBfu0w5tZekIMw/muAy1?=
 =?us-ascii?Q?WnagYkcDfZd72qzMo8gw1afqkNkudUkuIw5EA19PVvHebF97aDIzGx7vRA0i?=
 =?us-ascii?Q?90ffWCz1qY9NUeWwFYPTH7G8PD3mJxdgd3W3ltREpZ/iTf7R5N+bXqtv82t0?=
 =?us-ascii?Q?G1ejsUEY8vI2clbFrc5/0BDer2UO8HdhEN5oSIfbpmT2Z4g63SILslEckXFU?=
 =?us-ascii?Q?Sgz4nYP9ERiSBRrpWJ8OxmU0zILQU2sxRaE11ZSe7XuU4gC0SzKfKzRYnw7S?=
 =?us-ascii?Q?oBqcX3jm4DoKVXRBoWKUjsQHfoj267TGrmEQqOx2226Z1IQZp4OLOg7CbTBb?=
 =?us-ascii?Q?ngM7sEnzJJGkzKiziWrsFTL8AlZ4qVVrnR1jF+2MR91BLT+i1RlHL0CRHsCT?=
 =?us-ascii?Q?RRucVPKYeaCe5xuJyeFKqqNNXcvYOa7rGChvsBMQt9MJidQm81K1TVVIU/Vx?=
 =?us-ascii?Q?3fZdryAynZ1lE5D2hen4ZBm5X6IZqZvnYUrUIxzGjerDFpAAt6QfOs4xwt3t?=
 =?us-ascii?Q?S0qRMAY1mGb6ic08lKzmwoHoBRrnEdf9SLLj93Gmp//QACjDjgxNdEzie6JY?=
 =?us-ascii?Q?8P7CnXAhO37NN6ir1hDcTKt4LXCtBHbf022//tannly7ODwRRUXpxFVJhVS/?=
 =?us-ascii?Q?PWMNFwkifwK+Se62XrecrvXPkmqle4EXNroll0f11el3z7f5pU2eVUiF+/SZ?=
 =?us-ascii?Q?G1J1DWJLJS3ZCdTmMdQRx8KgxYV0As+YENxVrvn4HKOV+pUBU35aj2cHHL6b?=
 =?us-ascii?Q?0x0QTrKKNr0CKN/ZKav2zdZdfQiY0eXmlwbAVlkR7mcBXmexEqRyhn40eqFG?=
 =?us-ascii?Q?wEox9jz7ZU2AXYmg0t87FTCE7kpKOqhmQokwCeSxQzBQXD8fAdqxBefehFNi?=
 =?us-ascii?Q?XVQ4HJo7fNMwocrOYwk8q3pE+RRrAvsMKe+jhXaCjjUYlR/CeM4qj0FXCI+w?=
 =?us-ascii?Q?wlOzBFxKLH1r8tCFxNvMFXlCpkgSiqU+dZHst615W9zaEGGNbcXoOv2VRnoN?=
 =?us-ascii?Q?v105cL2sG1vQcx3BMPSzoQkDwLI0Xlw34cVYrrh4OWfl1RWNFLxLoPMqjCJk?=
 =?us-ascii?Q?1iDAmnwvnxM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CfjGEOyq/bdwO625KE9iiRP2H2K0yCfSgiaM1r2G3PzxgP7RsJLbraaL7xJ?=
 =?us-ascii?Q?tAkuQr2FGm2jbuPGVPp2zDUjXmLnMWn1+N8MXj9h/reOIpx2mFOOuqAJyreQ?=
 =?us-ascii?Q?Lf4iGDY3PQopZS48hWFzdCT6GbrGg+k3SKVZKLxty+TbZcxvq+TIqH/SGrjN?=
 =?us-ascii?Q?FAgXZjF1BpGEYaKlVwvBmZdSvQh1x27oVryTgsnEfvdSEmPYsD0YbNS5+fob?=
 =?us-ascii?Q?d5hYpfNi5g4OX+Q7nf4R/bvQFoOMpv49R9/P1VQ+VqQjOGi/Z9YWtxz2jSO1?=
 =?us-ascii?Q?CeCkJyGnK7V7UVEderQFpQyoXpZQ6p4I1WbXthnX76rBnb75Zc0DF5q8XIYh?=
 =?us-ascii?Q?zyB37Dowd7EgaSpD3Er9SZO4/LDdKx1BGv97VVPqTKtz1yyqckwTadFIAVTJ?=
 =?us-ascii?Q?pCGDn3C6aAFOmSj3q454rz6QSF9jSN8iNBGv+dKNRB54KpQVPpFQuM+k3Abu?=
 =?us-ascii?Q?ty9NKC7vR2eL+rYsKsiciNqhCMLjdzcV5M0zpOsSyDgahuJC61vEDQhUQyOK?=
 =?us-ascii?Q?CwI4Sfjg2j403EgJaHHj42iiQSQT/sZJDB43v38j2FRm3BQKSkhG8yS8KJhu?=
 =?us-ascii?Q?mEPicMpj1pS+yADfIQbTZ2AvWYcck3qvPpXLMordgOBP/B2pVIy0dlJRTNjh?=
 =?us-ascii?Q?2PjUa9UmDZ4+mLJVEqdo6sKaMBz8gRwoplzaOBZGGdOqHSrZMl1Zpyyc6afa?=
 =?us-ascii?Q?+Ak4jg/XxvL+SZb7WPT4NBtVAAErJ864WOFtu5JAq6JLrvz4B9m1GWfeuh/e?=
 =?us-ascii?Q?/wnsxyPc7OAF0YIOBZ9v1p4AR553hjRMeroyGzccY4q21dxn6fwKli4Uc+TL?=
 =?us-ascii?Q?33aKqiTZFDh55OPJgFQKcwy8YvLDH2RQWBu5kcx9XdUsecQQoxN01ZzXGx6i?=
 =?us-ascii?Q?cJypEoaXEmDuIGPaleLaPjV9kqpX5Hvwz5Q8unDTkGDC29/SEuID4m9GXFbV?=
 =?us-ascii?Q?N4MpKjNgOKdEkTUFVcNySta+wvCOib/zoPuQeNDJVP2CaCwZ0Hr+5RZEas4W?=
 =?us-ascii?Q?p9AFYHW20BADo2wbmeMC/Nv1etQsce3EhSj77PbqqQkEfUyPUDeYdZxDg3w7?=
 =?us-ascii?Q?/ggOoG38pJvdWsLRzxM0V6RF/RIpSOpjiwAQ3UWYCyv8nK9C3T85/b1E8xyO?=
 =?us-ascii?Q?2E5A5gR/D0UV4ZNL4AYiiaHIQwC5QE/EpiH81RNaLxxnioUDGdt46n9FnQDO?=
 =?us-ascii?Q?CJxGwILXdU769dNv9Mx/6sPGru51KHYKfFf6vP3hiMbRSwj2Vu4JE1hIRikW?=
 =?us-ascii?Q?25TAq4vfmcvt8KQFQvSvG0OlAZKzanIrUukWhZBs8FZgmBu35/PvZnnoYbVu?=
 =?us-ascii?Q?JwmOom3t/je5zrVeZYvTmROTyMv9NxU+hi7L1uKagLwXzJmcSAO8YSbp1WjQ?=
 =?us-ascii?Q?535lYl7Zm8gmCPzfMZtaWdMtJylqJZGFUUBucvguagrdLOF3h/DsUF267OgN?=
 =?us-ascii?Q?7UHyj79jj69up076KrklIy5YHBPq1IDPnXCXwH8AnVNRMOQ1E/tyjBrX+fTF?=
 =?us-ascii?Q?YM+qyy2/4ZjMA/IzCw+GseAB9MM6vUwCrhIwCsBmzk3aL46e9bf6KUUX+09S?=
 =?us-ascii?Q?w5w4eFc0kuur0N+S2APars/ugYdrPYuQ16xBX6g1/462senuu6RjwBlEZ1ee?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 570a6a3c-5be3-4cfe-7317-08dda1fb84ef
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 17:32:59.8088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vbiUWhwKsGUn86yCqAN1ck81MdVTeeCXzEf1m5GpOd0AOIF+hDWxSlft6nYbeUZ/eROREp5m0rKe1kizfauGrjekG9rHXho8rKn4QnLreA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Tue, May 20, 2025 at 04:20:31PM -0700, Umesh Nerlige Ramappa wrote:
>TEST_BUSY flag really means test with a spinner/load, so rename it
>accordingly.
>
>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
