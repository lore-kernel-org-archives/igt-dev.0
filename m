Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE87C3ABCB
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 14:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E058910E087;
	Mon, 12 May 2025 14:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFzC0ZeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB36910E087
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747061451; x=1778597451;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qV8qD5d1FMv5xjBQiZH1ptfEe9fLIrorGgWBWASd4Ow=;
 b=fFzC0ZeO3uD4Zwr4fPP9PFxQCCx7PjV86Gr6JWPNi/qzrePKaYU2930g
 CoUALXj+GPJ7HQPPbOObJpOHbWezWpNtx/7hYPMkaho2eOaH58NXfoTX/
 XpNTR7UUzgGXpDgCDBV5xSdpqj12FbgDQ5PR4CRBS0wgbuB+GCXjOvcjf
 SV3Q5MMb2S6WEjS72O7rr2P0II6c+egCsQ+8g41GZz5WBxjcHnegDYwk+
 WbRI+1c2KoMqqystoPoOMWgt83po/mxd7v4GOB2hQCkD4O3ko0WrCHUOL
 HZ+eeAYX4Bx8l7alEBRsuwGnSQU2Egy8IDT17pI0WiDKnouGx45f0IZvy A==;
X-CSE-ConnectionGUID: FeboLDq3QICkX0PyV4T9qQ==
X-CSE-MsgGUID: CrT15MCPTnevXHRRNqHziw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48111869"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="48111869"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:50:50 -0700
X-CSE-ConnectionGUID: uH84G8cOTWS8LEOnZxLCag==
X-CSE-MsgGUID: gb6fkdQUTfqRfzV/durGww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; d="scan'208";a="138356174"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 07:50:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 07:50:49 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 07:50:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 07:50:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCMe5QrmqsmOy5Jjn5POVynxeklR6cI50UJLqbMtc+I/+3rodyS3/5+VQYjPm0GQM7q2NAU6zD1MEM7+zXPtZk/BdHbxu7v8RtZDRbOrjgIQ9J/hEsxThRCPLkaqU5172hOnoeyO4lBu7SdXQcR4riHOccwGeQ1RLnm5j6DdCVq/Vc+xsPzA5sJBFLda1Nm6cjZszjX26qqyWflWTTYr7ho+sD1HpGfRdCoZKlzcdlHAujpxYwWIc/Tu9B4JjN6Y7luSSy5L8F2qmpVMVq3ao1GNtUwb8bzD2+2bo0U7U13ZzQq08HQG8pK5QgctU7RCLmaEXPumqOpePXYtp4rhwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=crmHlV0qn/WX25oYcgb6lxTWEE6TT3G+NrEeHc/UVP8=;
 b=eH89JZSYPqQaYFivb05SdUgnwvCoVn27t2sH5wtzr5tsBaQyRsU8UHsd/FeUTsfxqzizwNIFmmr/s4WEUZzDiP4ArCGOyex6SSLxrkvf1IvLqtYxX2n4KBTuUaO2uNRsyA+dCZ+D7nKdLRUG2rECyNtLgbfSF2iA16INIMS87bXN7vi8d3d3BE8bXkQgek0QruVe11rpEJcsyH5Gyp2oamKb4NT52XUx6EBrJ1gVvAHIzv5ecc3muAPLG3HJIGUxcxJsYi9kmNO4Mm7+kc7Bmd7rb8/NlpxjMs7C3uF/zQjRiyOh+vBJapXLf1f8FVBJYO9cp/A2inkh2KHh4C8oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA1PR11MB7245.namprd11.prod.outlook.com (2603:10b6:208:42f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Mon, 12 May
 2025 14:50:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8678.027; Mon, 12 May 2025
 14:50:46 +0000
Date: Mon, 12 May 2025 09:50:43 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <kamil.konieczny@linux.intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <louis.chauvet@bootlin.com>
Subject: Re: [PATCH i-g-t 5/5] tests/intel/xe_configfs: Add test to validate
 survivability mode
Message-ID: <ep7uvcb7lc4hi33y5ijdrwvvxqbhgqfymq7bfezdh2agh5wgsh@bomhlo3kt5ee>
References: <20250422095602.55041-1-riana.tauro@intel.com>
 <20250422095602.55041-6-riana.tauro@intel.com>
 <rxwug7vusfk3npmlpvad43qhgo2rqa7jwi4wtfbhnei4f46sty@wjylvkykbjgr>
 <aAfuM25ln-ugZd_W@intel.com>
 <md6mljnmwsujfhv3up22l6rqhlmfyhg4qicqonkhfetabsako6@z5drpnypwqyr>
 <5a646900-7853-40a9-a217-e5d3021818fe@intel.com>
 <5278b1c6-38a0-4b05-bd25-46e5ea10b5e4@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5278b1c6-38a0-4b05-bd25-46e5ea10b5e4@intel.com>
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA1PR11MB7245:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c49b561-ed2e-4ddc-7967-08dd91646094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iKurnZktD8LXrJG+AGa4DDnkyDZsXtDV3aL2E2MkETy//y/tLpDFSYd4Y2?=
 =?iso-8859-1?Q?U9yzhNfCXumuw719zqE6o/dVuiCEppQ6S6fERa84w2LFrFoUjDev52bSq2?=
 =?iso-8859-1?Q?/jqAWuVX5oWTvH18WuyHp8C2L95NegQjJY8+klsEA2H0ajQ6SYEP60ruwq?=
 =?iso-8859-1?Q?UJqFFxXl52kk1+OuZxx6YmwBS0f3oQpoMpYRbZ+D4JwfD57Xgkht+wIqNq?=
 =?iso-8859-1?Q?LyevoaDjULUULcPjjNxmP98X/7f8DW3vDSfsP8qTi0ckQXRSgLJdO4oyVe?=
 =?iso-8859-1?Q?YUhZjRKRhQRz3e5oynK7Vs1SxxP273nDS02pQjORx9NqMqXENDgg4TCRgI?=
 =?iso-8859-1?Q?Su/VUcH9QnfFhDYeZz5qagEuCR8EPMNK8pWRzquO726gYfdSHdk/RSlZDK?=
 =?iso-8859-1?Q?WSOd2OGztQxDEpexUUhhzXki90p3+Dki9zBzNBT80sC4zAvB8R5vqkSPGd?=
 =?iso-8859-1?Q?rz9EaxAyqEhfZWo4hOlZ15yDmkjhRdRuyU3nYGtBoCDui0alkvtTLqyoG0?=
 =?iso-8859-1?Q?+fQBm0pxsE2Hf/4G4U1jj2x+DaErvK6G7QGXytGGPKXvJKpWH+Y1GSdjHZ?=
 =?iso-8859-1?Q?r7KPwToeYjFILG5/xqL9d4TXBS1tuRJ/gFlZwryFbsIUutCKlthnG5ljDk?=
 =?iso-8859-1?Q?zrthdqFzVAHJUzPt6Bs31yzRFgSLLBCQsFfvx/hhCx+Ou3cPuPnijhCT2J?=
 =?iso-8859-1?Q?y9rQporeKaDsHNSggGdx30fkpPUmKDCOecXiKHRn8Hv+LwOpaeMibwHNYg?=
 =?iso-8859-1?Q?9pCYBWyQW6YknhzFFYBSeGGAc9SUVRjb4sONuqSHASN65e/EwpHANnPKPH?=
 =?iso-8859-1?Q?RvVZf7R+xnzPeHu3QhAZjmPm1us9zSM5DVbtSbwcShKvJTc1EzCq/6RFnu?=
 =?iso-8859-1?Q?8N7gGvbbbDli7S8mDLi7A6T+XjtpGeMigl8V8w4teD8wty9UJbSy4MO6CC?=
 =?iso-8859-1?Q?LwzMgYvSL/1kfjwrkc3SjZbeprL0lC58Gk4p/d+P2+8CcDpGILs0WJ+nRo?=
 =?iso-8859-1?Q?GoVfgJWQ3I4unMORCWK6CtDDOczXNcezCyKsccE0FrxuPhWP5AeXoGnnwZ?=
 =?iso-8859-1?Q?6OVaVxSk/DNQLpoVDC92R9SWn1ZyTJtQ/CFF5QLlafaQQBRDQhOVOZCLid?=
 =?iso-8859-1?Q?41AnGu8zm7BFu9DHhMbPpz+jVverbbCFj9UFjHoc7qZnmrLp2YkL89WYzf?=
 =?iso-8859-1?Q?rs9b2SJQrbXgRuxnit4ytCtQQTF3e1JFE0yTP1tRJQ4J3fHwBDYXlGfaQ/?=
 =?iso-8859-1?Q?u+KQEMqmXBp4BSxIjZq+CLzLWAFnE6RI9cbBYWHZA9cWjNambaUG1zSum/?=
 =?iso-8859-1?Q?F22eRTRLphvN/I7Ptn+vTsKMIqRcK1ZtO/NQSG0nWT9g6B39R7ZU81nBXn?=
 =?iso-8859-1?Q?S0Lzbrj+ac+PP35zmNI1QkvuKDxWXqtJxYbI9OycXJnevbXcuKyEjPzj0S?=
 =?iso-8859-1?Q?kceLarvAtYVNbTQqHm2vfsjmagpwyWvedRn1xAXgVuRms4yErKdqjJG2NG?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?hkq8j6tAHNIZUU1+O6N2kJnkSZi0zpKp9C9EphJVfSivr/iGNSQqp4KXma?=
 =?iso-8859-1?Q?z9H8Pp+uCOUVIfY3CD9YqMM4S6TvDZoEzimkQHeO9c/bO1H/DuCftvBI//?=
 =?iso-8859-1?Q?l/+XFyOcd91sqFrmvjhi+J8sCM9ME8cxIhlnJr1+XirDZ7CeKu0APMR0Q8?=
 =?iso-8859-1?Q?WSAvvMzMOv38zmv1yTc/G/m1fsJWmEpNP60jgrshRIETcL0Yfxba8CUfby?=
 =?iso-8859-1?Q?IK4vzQnkES3zUSHjlWprNKRZOSKPdGOMBnjkcUhOIxfta1LDnRdT+8IVGL?=
 =?iso-8859-1?Q?TIsOH8ChA5yLt3L7tfw4JPiZcKtd+PmwtqByr0Epjox+PCVfDaxMK0CpYG?=
 =?iso-8859-1?Q?qllf9hQ2u34ZleaD7QogoqMmz85AXVAj5gRw8cZrDxHu1yV/2qUEl8JITV?=
 =?iso-8859-1?Q?bK6lv1kfyI3wuDFnJ/okWWILd51OtNDpdbtl/69o0aNIqymSC/bR9xtXT0?=
 =?iso-8859-1?Q?8LENYWZGeqbwD4azYbiirhP03fCRiqHm0swLZiRMUeLrxLC7AZLxgPB5Qs?=
 =?iso-8859-1?Q?AHXOz5Yz45sEOESY4RS4yh0fXLEU6IopONVdD4+tvWm7vBi3Cl8trHcbSs?=
 =?iso-8859-1?Q?CyDxqbUQ68y95eEOnthxQsLuTMSW+pjFblQUmu4TGgNAUqp0wb8j5bwKJj?=
 =?iso-8859-1?Q?vBdLI5EeYk25cr4/CIRJ1wBU7Ss0cscexUx5vUF8NDADXN+qdbs8u6kVpc?=
 =?iso-8859-1?Q?EeXqx7upFvjTa0HvTcQ1wEtxTIEPU5xAcjMBNpKTMlqLqyQtm0NOjuXu/p?=
 =?iso-8859-1?Q?lOKAHpqtsdV4Iu62WhFAJJ4W5LvL1eLHrd2+42xlKv0Lu99BIFgZL3Yt2a?=
 =?iso-8859-1?Q?3RRtTd0kB+lS34nic4vDM4iQAQVBFaYmnGk+34pf1td3UF/RxbrzaljcTx?=
 =?iso-8859-1?Q?Hn4BjT+mhPwQNUmvkGrlu5ND6gmz2d6zSvw1VrCpyCwjGIK9QWA8NLKZLm?=
 =?iso-8859-1?Q?w141GvgowoyqDDJgG18soWBaI8wvDdl5tJBSv64am7mzr9M2bhc6nKawER?=
 =?iso-8859-1?Q?G30zNtFjk4nyR8usUgoCKhLjzlv8WwRznnqAFwoeUkDF8ugEmQt0fYW9yf?=
 =?iso-8859-1?Q?CXTu3MjdoEC+75VF4mgl4HHKzquf4z+gAnZqLIbUjFDHEztv+A+leHr8Fc?=
 =?iso-8859-1?Q?AgAKrfQzsPFxoByhI6sK8LtBd1f13It9xrCAlodhMqSq8oF495tnJoLxAB?=
 =?iso-8859-1?Q?wPtDPO5U0HJQEu0M5TPnUiep2/PuRo2o7qGfAQqQAp5d//xsiHdRqLBLpe?=
 =?iso-8859-1?Q?tifdVsJ88ySUHnKmYougBC0HM+PbTHtLiSwsVkoO989NPYxp+iwxS9/1lx?=
 =?iso-8859-1?Q?5E4lKJRVA2UvspXk5l257iXZwQeQlnOzpt8YnWJ4wJdEon37savsb1RpHb?=
 =?iso-8859-1?Q?pnVqdsOgb1g2am3MxXj+HUe1D4VwtbJzdzvaiui5VFV7oUCTmqxtTKXIiX?=
 =?iso-8859-1?Q?mMOuPsFh9d381JckMDMrhn/ghIlIMcZch+dP+1HthHnrOG57j9Kr64WH1S?=
 =?iso-8859-1?Q?bg/AuO5HKISN86EGLfepCXdBVIMyUwGMuI1Fh9MXYG+FMxrzQU5eMItxWt?=
 =?iso-8859-1?Q?G1mv3qQo4uBg7lEba6qslRL0idef/XEhUAkqbUlTduxfcfvoZLJ3fjkFZZ?=
 =?iso-8859-1?Q?lc7Gf7aDeb/r7UVQf18H7GyMzgBPunDiRvDaaQlvhZ0zSu0ntriCommw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c49b561-ed2e-4ddc-7967-08dd91646094
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 14:50:46.1185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7pKTT91vjM2tUO8+844HtK6yI5WLCFoQxoHr127gFMQjqNvbncIdqF+UBPhfpSL2QIJS4IZx8yAzv/ZnpKE1d+2pnRD4/RPG/w5qg7MrAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7245
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

On Mon, May 12, 2025 at 04:24:05PM +0530, Riana Tauro wrote:
>Hi Lucas/Rodrigo
>
>On 4/24/2025 11:11 AM, Riana Tauro wrote:
>>
>>
>>On 4/24/2025 9:47 AM, Lucas De Marchi wrote:
>>>On Tue, Apr 22, 2025 at 03:29:55PM -0400, Rodrigo Vivi wrote:
>>>>On Tue, Apr 22, 2025 at 08:57:35AM -0500, Lucas De Marchi wrote:
>>>>>On Tue, Apr 22, 2025 at 03:26:01PM +0530, Riana Tauro wrote:
>>>>>> The test validates if survivability mode is enabled on supported
>>>>>> platforms when configured using configfs attribute.
>>>>>>
>>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>>> ---
>>>>>> tests/intel/xe_configfs.c | 112 
>>>>>++++++++++++++++++++++++++++++++++ ++++
>>>>>> tests/meson.build         |   1 +
>>>>>> 2 files changed, 113 insertions(+)
>>>>>> create mode 100644 tests/intel/xe_configfs.c
>>>>>>
>>>>>> diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>>>>>> new file mode 100644
>>>>>> index 000000000..414af4a86
>>>>>> --- /dev/null
>>>>>> +++ b/tests/intel/xe_configfs.c
>>>>>
>>>>>
>>>>>humn... does it make sense to test survivability mode in a xe_configfs
>>>>>test? configfs is just the way to trigger it. For completly different
>>>>>areas of the driver I don't think we should bundle the tests into a
>>>>>configfs test: we don't test if xe can be loaded without display in a
>>>>>xe_param.c test, or if we can inject faults in a xe_debugfs.c 
>>>>>test, etc.
>>>>>
>>>>>My suggestion is to have a dedicated test for survivability in which
>>>>>configfs is part of it.
>>>>
>>>>Well, that would work for survivability itself. But perhaps it is good
>>>>to have dedicated entry points for the knobs we expose, like we have
>>>>a single place to toggle all sysfs and debufs. So we don't forget to
>>>>add new cases and we have a single entry point to quickly exercises
>>>>the knobs.
>>>
>>>humn... dunno. The problem I see here is that the answer for "does it it
>>>work?" is quite different for each configfs file we implement. Some may
>>>even be honored on probe only vs others that can be set in runtime. If
>>>we had a generic way to test the configfs like:
>>>
>>>1) write XYZ to file
>>>2) read file
>>>3) make sure it's XYZ
>>>
>>>then it'd make sense. But for these tests, checking that is not testing
>>>much.
>>>
>>>For survivability we should test:
>>>
>>>     1) bind the module in survivability mode
>>>     2) read something to make sure it is in that mode
>>>     3) flash the same firmware... possible?
>>>     4) unbind the module and remove configfs
>>>     5) bind the module
>>>
>>>For possible other things coming to configfs:
>>>
>>>A) Extra Workarounds
>>>
>>>     1) write a {gt/engine/lrc} regiter-save-restore
>>>     2) bind the module
>>>     3) check for each of them, via 
>>><debugfs>/register-save-restore that         the value is 
>>>correctly set.
>>>     4) repeat test for write types like rmw, write, set bit, etc
>>>
>>>B) Fuse off engines in software
>>>
>>>     1) write a file with the possible possible engines that we 
>>>should export
>>>     2) bind the module
>>>     3) check via debugfs that the exposed are at the most those
>>>
>>>C) Do not attempt enabling display (i.e. a substitute to the module
>>>param)
>>>
>>>... etc
>>>
>>>Are we going to shove all of them in a xe_configfs test even if the
>>>tests are totally different? I think it will be harder to maintain, but
>>>we can always move to something else later if it becomes overwhelming.
>>>So.. I'm not sure. Any additional thoughts?
>
>
>Can i retain this under xe_configfs.c ?

I'm not convinced about that but since there are more people agreeing
with that, I also don't want to block it. Yes, go ahead with
xe_configfs.c

Lucas De Marchi



>
>Thanks
>Riana
>
>
>>>
>>>Lucas De Marchi
>>>
>>
>>
>>If we have a single test for each entry, wouldn't it be better to 
>>place it in xe_configfs file?
>>
>>There can be a couple of basic tests along with this like (read all 
>>entries, invalid directory creation etc)
>
>
>>
>>Thanks
>>Riana
>>
>>
>>>>
>>>>>
>>>>>Lucas De Marchi
>>
>
