Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA0BDCAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 17:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61E5C10E87C;
	Wed,  8 Oct 2025 17:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CBLc0o9T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0604C10E202
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 17:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759945199; x=1791481199;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NxJ2geRA3axMgEhYGJyrCkQKQSroqJA3bcJh2aFYQ6s=;
 b=CBLc0o9TLQj6jogl95XL2QszqoVqU/d8o1zoo+7AJN7csZGF0PE0xbZ9
 /lmdE7ZcF+mBgGnKsze8nWM3nV6228r211kmd3+PJyCDDUGzfxwfouIgE
 W2TAvdwjq4Gkn0LHmyDzhoA8QwQK7YxzlTXYra8qIlYYUYCZMBYayr6Vg
 p6fvS6KoE9aDTzSOboH/6bFe4HWZ9WbWRLV0oqOWI7WGiD5oTdJ3LfvgE
 LgHkBbbyW1zMaTlu4b1QVcxGMph6vbrKSLPX0qvicp/d7bv8uc9ILQQsy
 Tznm15QVWUt9vvh5x5NMgOacSZGjgXndpZ8bIKlcpoTV9Tjylyub+kkut w==;
X-CSE-ConnectionGUID: B6Gz3ZB1TO2zXkQhx/4TlQ==
X-CSE-MsgGUID: Pifb1GQ9Th2QEGuKy8Fdfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="65790068"
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="65790068"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:39:58 -0700
X-CSE-ConnectionGUID: MGNDDY83TIyVSFSX+uq9zA==
X-CSE-MsgGUID: +NHuBLuqQly+6DnNpAXFZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="180427073"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 10:39:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:39:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 8 Oct 2025 10:39:56 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.44) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 8 Oct 2025 10:39:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsW0RFNVynqlEAotboa3NzOYWcFhxMcvtEbD9rf0SV0MCCP2MWVOtPrwhSyLpJajRMRH+MPLqbkvD7ooxLtTdWpp/SL9vSkIn5wOLZznAy8C8XNUBfSFCDKmkGoLW49C4rdYFfwb525l/2VeiRL9VoEU6TxBfnnQz5xqIplNnMK8Hmj7oZxRRfHfydZQG8ixQjKZ8pUWN2Lf2sHu232fFTbi1qhSq7bHPqWRBGHQHSyFUj38x3r2ESWir7teDgN7hzgL9mX7K8+kbmST1CMj6GKwQcbKo8Vk8sNmL4L8M1ABTfnaFCtyxQ2UZyCZWzy01KM1vJm3nknhdTOBLrs37Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHThDJJLnq0wcizJwoWJbKH79a/mLSVDoHrAdNE28AA=;
 b=VFdRvH14UCF+rMG1g+wmr2Qs+VI6s6Y3DdoWgg8XjxwPbQrH96ApxM9VTqqngWdia+RepXQsCvp5hB9qkdfOr1JNal0gaIshqSBxQrUUFU946abu98hU3j7RgVMrEDBTBivguHQGLA6liIzMekI3cXCSCn5nUGU+qloATQ8JOo6cB37Ln3Q0MHGgQ5AWT6rwBX8XnlfNWv3KhE6s1T4h3DrNwFA6VmkVD2QR/2dE5CL9ctxEi5n7xGpSsEKJK+Njl9cx5M5+hfo+AiiMQWEY2mEefvJVICdgenh5Oi5ey9ahS14qDzJDlHeBspciEGrgtmGjXcyhpLDy2ovMrk7H3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 17:39:54 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 17:39:54 +0000
Date: Wed, 8 Oct 2025 10:39:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v2] intel-ci: Unblock the xe_evict multi-thread tests
Message-ID: <aOah57Qq298M/n3W@lstrano-desk.jf.intel.com>
References: <20250917072153.50919-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250917072153.50919-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: MW4PR03CA0342.namprd03.prod.outlook.com
 (2603:10b6:303:dc::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 416f56f4-52b7-49e4-373f-08de0691b0ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?oKZJekI6oCUXQOeb9tXOT9JUxZEElXpJKyyPEdDCXojrP/Dhk6FEPMFpUn?=
 =?iso-8859-1?Q?yJ4CjBsk9VBpZ+XOyycjzal7eESOsDbRS0r3izRYxqFoBHDjBZ+tGTNklK?=
 =?iso-8859-1?Q?zSqOzabrATzbFmhOcB/Ln6QSUMLbNMuE/PTyFWKCu7XzOKb+4kS67FczW9?=
 =?iso-8859-1?Q?rJlJaH5lGjHP2TNddu3DR7TdqIGCifJ+2EXZ770uHpD5Cdpc7DAwEVPVOn?=
 =?iso-8859-1?Q?UR3MWiZwBtcCOilrGJ1aHbdbMmJ5V+Hbpo/F3EDheYxoi86EWD1QILMQUb?=
 =?iso-8859-1?Q?GF5LaT0Fdh+LqCzTOqblqKjF8IUAPqpKsTXgFolDoh/eFreKX6kxxs94UX?=
 =?iso-8859-1?Q?k7+gCFeTjeHP9n1Ig81ZjEjjnRcMI+DTNs2OCrbVP3LGJqBXzhILgJEt0i?=
 =?iso-8859-1?Q?bDbe5BanM0MAa2hSCJF5qodQBNO6NGDgT0dmxWBWimI/e94nEKmd0vNHRe?=
 =?iso-8859-1?Q?8KDGEuBongKOMSM4dGKfWJFmTKi035sLQXocQGodTdG6/oqP+a+Ls/EV79?=
 =?iso-8859-1?Q?lv6YSu0bHICza0XmV/73MDGUG3sdZ5rB4uam8zjY4AcrVVfWv4lmRDQbWS?=
 =?iso-8859-1?Q?Q3FHuPlFS3fDEzhZTtd0BbERSdDAWpmsQOdor4gXCAwd2Qjz/pEtSLf3fg?=
 =?iso-8859-1?Q?XV5EdszOwr8AkxdhIbSQ2wQOXlogzlG3c3T9qTE5TWdaiMTzCSAe6dOqyt?=
 =?iso-8859-1?Q?C0FKkwm41JwXvy3pFPD5NwalG9xoVyP6mX+JEQbyFiQ7vOWH50olfiuBjT?=
 =?iso-8859-1?Q?SgaHVrQbNFBXnK9goKQYME3Dg6j6bBWk3nhyD1T4Klz4o5i7TScvdmsRz8?=
 =?iso-8859-1?Q?LdqoNHVceTSVqcOGOPw9Ezc60gMEB2BFn+wl8ngP4uDlaU/IbUiYB6MJvj?=
 =?iso-8859-1?Q?QSkljvvb70CbtjQoTVlWzHJWvfad4vO2M/iADEz7eubDrUo1DQxt/0+fe7?=
 =?iso-8859-1?Q?Ry028ye8zrqpYk5wBPRcMVGX0vZMX/sE6iQ1gRv8SND6aV4dyWPU4JZJHG?=
 =?iso-8859-1?Q?WMh8QX//bLNKWj+MqyzC084cizJYT/pMErnFuotoaIMHcD9n7518l6vtpy?=
 =?iso-8859-1?Q?OwkjhEHOtCH4cz16vOb9fsVS/5HgH+Cm/AV498BB4rVs3HLkVcoh5ivpBG?=
 =?iso-8859-1?Q?eYLyzz7/1Kz0gepWyDSF6QsvmCL37tDAJGh/C2FucHn69BvGVN/6DC+VzY?=
 =?iso-8859-1?Q?+1SF02kFD3srCDZ7xrDDi3n3WK9j6bFpzLiLXw/uXvj6y82I+4DrAr14cq?=
 =?iso-8859-1?Q?mZsRbpxuPlnibVth8RIX22WfjLJ6sSKcij1/QwkPwSAQH0+AgPDk68Mb4h?=
 =?iso-8859-1?Q?MKUB3+7bDoHW0sLphurIA3l02+KMxtagi3HZZezmWbtHi0ZQ0Rd+jEX0o0?=
 =?iso-8859-1?Q?OBbT4wqtRGEmBm62sQCEkNu6PNOWrqyGacewuG11vPHOBJUQOpC5znNx9C?=
 =?iso-8859-1?Q?AgFHI53Po86SHi4qN6xIsM0ZOxDpcFXtoHHFe2+NyNaZcILq9pLkVxi1BQ?=
 =?iso-8859-1?Q?YIIywCmtLDSMFrCPVvvFBs?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q5GnrP4PQnVViBSGNwyg0OoE9+OrN1dZHQ7lCN1dX/K5SSFTJxSFE4T7UF?=
 =?iso-8859-1?Q?1RpqMr7ojSzxInUD6VIUaIK9YjgEickmh9CUtN1E3/Q8hL+Y3wKXaNLCHk?=
 =?iso-8859-1?Q?OwC0YRzz1FAKqHBXQD4mK01HH/9Kfmhi0iuWD0k3DaL0ycDJAbRnvb79/q?=
 =?iso-8859-1?Q?T8DxsdbluBksWdxokCqFoHW6J3GhuqCRLVnQJ5TKdH733Y6ilB6T/9sGW5?=
 =?iso-8859-1?Q?H05Dl0IdTJJEszbH1B+DL6cHj3WYLKFkalnqb7Coy39hIbBV3gLkswwfje?=
 =?iso-8859-1?Q?HYN11H2D8Oia/BSlIiLxnwd9YXWEkP+bXO7U3Eqg2tMeRS4eLcOgr48kP6?=
 =?iso-8859-1?Q?ozFIRUxPag3YP3F4sl7R049mJ/qednFd7lJgm7MhKC3LNpCJVSGGLzkkij?=
 =?iso-8859-1?Q?+QRICMSLkf1o2gFKPCjfPjyN3LngMPLvk3PSAW3iMhnA1toKjHDSmDUGBc?=
 =?iso-8859-1?Q?Dy9qm9mcj2g4mWhTmAc9x12pORi7ZtTJIRjl10xrpk4s2fb3NDFw8vrj1a?=
 =?iso-8859-1?Q?HeFq7M30f1BCLr+FiXRbouR8vIiUiFIts6vpVwPWSxnJ8tqkh3yLGzCkEF?=
 =?iso-8859-1?Q?CBkVnjQ4XKcueyBUvg052XlJfNRC2X/Pyp2EYMFgD7cvOMH1iTz03IG35h?=
 =?iso-8859-1?Q?tTm7gO7c2H3afKpIYuCJo8ySdDyuELzk864RAj58SMlsR5kxwdsGK6gRTo?=
 =?iso-8859-1?Q?tiS4tRKt1RaX99QUTBNL/y87FgzagvRQp5siwUTmmQrUKc1XUI4xApUnta?=
 =?iso-8859-1?Q?4zIrwRRfB/zg8hNLf0w2lOKN1wsHYurCzvvg1+20aXDJnj07P1iLp8DD5Z?=
 =?iso-8859-1?Q?ty59NCw5Mk7vmK2dMq2slZmEQKbtj77Ev23J24wXk29KdkLnLwXWB1SELa?=
 =?iso-8859-1?Q?N/++MI2ZeyLra2Q64rxpLG/p78xVSpPJ5NDIpDgS0Zq/Zety2cR87oc1AX?=
 =?iso-8859-1?Q?TWSh9XsUcj0kfry7GRHvMJwK2u6ggcf1Xu0tmdfjC8igkDzUccJJ33iyBq?=
 =?iso-8859-1?Q?n4RX9a88j/IiaFDRf8rFG5C1MPSUqjjv7XmvnPBMa42f4KItUXyKDMDLvL?=
 =?iso-8859-1?Q?BIKvYH1JHUU66ZhJ/GlrFBKja2Tz0h4smRRaOljJnwYEBksbzqFimYuV1n?=
 =?iso-8859-1?Q?p1dGLYmUel7sSnSS/QDZUiQ5P48xodebG8DO7vVqQ/dtghEO588igwEvrw?=
 =?iso-8859-1?Q?lTpViyBVg91V/3F3x1OIh9KYlxIDFX/RQAoTprhQXcgRIBkbzY48yS5Wvm?=
 =?iso-8859-1?Q?Sjj4EwGIEmGqk0bl+/YH7c1BOJYFEe0WwyUSLFktddu/cdzvGVNIgc/wBp?=
 =?iso-8859-1?Q?dK451Qy5pt+/ArRGl39zVCDoqppl/SPBJ3TGHo+/r7DtZgFQ3J49i3zESX?=
 =?iso-8859-1?Q?95vxpF9OgSANRw/mxnEdhRJZZS8aoXVshA+nwLUksimr/ipWKrqA4Kkt4J?=
 =?iso-8859-1?Q?9TruidnEHVT0bWhEoXZ+RemqkhLu60X90ss9w+K7+6cq5ecwtNxEU3nDs2?=
 =?iso-8859-1?Q?a2JAvw4CK8FPXmaMuYa9mFmuIau4tFGxd2eRuI8tn0u/ULiRQe2eyabIwn?=
 =?iso-8859-1?Q?SzQ/sFGgYnqRoDL5nb62YewDKoJyiO9QGmu42+3vZEBNGv88iOXCYrqjjA?=
 =?iso-8859-1?Q?lxLSbyDCJ+cI8MViBsk2rdNs/zmLQE/+nl0CeMfOo8RNGvpnCAJYj50w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 416f56f4-52b7-49e4-373f-08de0691b0ee
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 17:39:54.3963 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g3Fn9AFQcrhoH/OLfsV+OGUfoRkh//6dBs2k59Rbg8Xs/HQPQ05nlmmXRnb6TDI8PDKbYj1Xj1yWAcw4AKcPfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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

On Wed, Sep 17, 2025 at 09:21:53AM +0200, Thomas Hellström wrote:
> With xe exhaustive eviction now merged, unblock the
> xe_evict tests that saw failures due to lack of exhaustive eviction.
> 
> v2:
> - Rebase
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/intel-ci/xe.blocklist.txt | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
> index 2e1ebf299..d464f6798 100644
> --- a/tests/intel-ci/xe.blocklist.txt
> +++ b/tests/intel-ci/xe.blocklist.txt
> @@ -110,13 +110,6 @@ igt@sriov_basic@enable-vfs-autoprobe-on$
>  igt@sriov_basic@enable-vfs-bind-unbind-each$
>  igt@sriov_basic@bind-unbind-vf$
>  ##################################################################
> -# Exclude xe_evict tests that are not expected to succeed
> -# due to missing TTM exhaustive eviction
> -##################################################################
> -igt@xe_evict@.*-multi-vm-cm.*
> -igt@xe_evict@.*-threads-.*
> -# igt@xe_evict@.*-cm.* # Rebind and VM_BIND may race.
> -##################################################################
>  # Chamelium V1 HDMI receiver supports a maximum resolution
>  # of 4K @ 30Hz. This test enforces an EDID with 4K @ 60Hz,
>  # which exceeds the capabilities of V1 hardware and results
> -- 
> 2.51.0
> 
