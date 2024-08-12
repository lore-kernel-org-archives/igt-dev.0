Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DEEC52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 13:54:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F5010E21F;
	Mon, 12 Aug 2024 13:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dxXa+p4u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2354B10E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 13:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723470866; x=1755006866;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lpNwuxFtjvBAiWftOpWcT4TERrsbS7aAHdm3yaul9eQ=;
 b=dxXa+p4uuFw4jNrNT3kNsYn4ZmK1T8TOUzIYHW3hMJj0QceWeePlG5U9
 UFRxtTJJ2Hiep8xxCoI1BrrDWj7+li06re1UVUSDNSLgH3CICDRE6X2wW
 XEN10bO4afNPj89BzLsk1ZpXTwoJHLp+KbZZG5/5uo6DoxyPIkNImy/B1
 jg48QJdrZIu+0aSjij59WIntVoHZSioH+y21TP2HR/1Q22Mk0r2qORj4D
 WiOx6y9lD5qWv3cexw0Aima4brbjeTMqviaH1TqW3jAApacWJ8qY6nyqA
 UTXqhyMXmSl42DLfm2ITwMLivMAXQQ5G0ABUQNYvippKfFJ47UnFfhjzK Q==;
X-CSE-ConnectionGUID: vlQc4CLYSLGzyzsK4QToQQ==
X-CSE-MsgGUID: sDf9vPefSWWSvYPITwtsog==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="24488991"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="24488991"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 06:54:25 -0700
X-CSE-ConnectionGUID: Mrkj7AA3SFmZdt/rXb7Tjg==
X-CSE-MsgGUID: GZ9BrsaDQCOcaTNz7yqusQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="58213986"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Aug 2024 06:54:25 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:54:25 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 06:54:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 06:54:24 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 06:54:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMscJAOCKruZDoa3gGKCZOg0Prq6ACvDES1FLHGokdtz0TAeXB3Zk21956H+ipDk3OuLtis2kMwb2pFzJ6KL+xZH9SRwPri13AINuGPJB+q7A7fgHtVFp5zzuYN0WXHZLiARRPStlGXWLkFjv6BYlY3cftapzm0rg8x1BsEUbRhKdFGi6ndagi3KAcnC7SQeUGu/twssWqjNDlovaLp+z81rw9sIMZIfbclB+6muZh5I3dtijxWbxqT9vmTsHLtJ9L/NEdWkhykvZCJQovkBoQZ/k7atrZBguETpQKYDvdasdsUeoQ5O3ipjwPyzOEWl3xIBputM7HdH0jR0zoiuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q2ac6lFLRHlkXfPu29ESatRp0BbHpx6HSl19tj/AJAY=;
 b=Y4SUwf3i2qPvyQO8/zKeIBX1ThxIX5TNtVFS4KtolYRB0iaTbDdKU57VomNS+5ty0qNoPxdeaobrOW7rwF5pMm7S0FY89CsHZg+RJNCrTigpMZX3ENnxRfLinb+wTqwKlEL0DF1HcaVBR16HqIZyxrs2k+JaUU/74ouUM1/9EAFmdVXla2UCfkaJj90zjOG0ceF9Sfrq8gDfG/7BSMEeXJlWPQS56IE+MU1EzxnIzTfcoan6xRgobd5l5WKsPlDtmzkXFLJdn52l8H4t+qSOdnP+182oqNhFvGa0/2Wexq17GQTnk1894x53bMqsyapi1rbk+zDQVFfPY198C/8SJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW5PR11MB5931.namprd11.prod.outlook.com (2603:10b6:303:198::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Mon, 12 Aug
 2024 13:54:22 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7828.023; Mon, 12 Aug 2024
 13:54:22 +0000
Date: Mon, 12 Aug 2024 08:54:19 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 2/6] runner: Make it easier to extend argv
Message-ID: <pyngik2m7y4del4bp6hxadmskuur74vvspktsx3hie7yakeqyr@ii5seive2tzd>
References: <20240725142028.51735-1-gustavo.sousa@intel.com>
 <20240725142028.51735-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240725142028.51735-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR03CA0162.namprd03.prod.outlook.com
 (2603:10b6:303:8d::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW5PR11MB5931:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bf30e79-6e11-46ed-9a61-08dcbad644d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?I7lEXYzXeatbZjzjcm4HHUotpOhJodn9ZWHWNUUKeDdtrZDkuJzQv9yWXHjA?=
 =?us-ascii?Q?mg1ED9LaRVslXbw3GW2qHCwjq0D2yAybrsgqwBqaEXpnkkAEyEUQ1KN/RhVG?=
 =?us-ascii?Q?Hg/Z3jtiIPl2N/dkDn4VF9uAEchnaiolFOJiMkduCr1RgIc8GbA52JHNyAZA?=
 =?us-ascii?Q?LURS9NflODGYIkUSNRsKhpv8kmmo+509BCH7IqMdam6H2n33LynI5Pblxa03?=
 =?us-ascii?Q?7STasyuOoyslYr1AdORO0cVOf0eK7UT0jh5UY3DZXdWRxvCst54OZcVPOuRD?=
 =?us-ascii?Q?jnkMUid7u9DoVo3qiVIqWfGUPomS27SVoDNKfPYYNlP49MOyQiLTejp4SKy9?=
 =?us-ascii?Q?9TCzTwYZsFlApUWE/n0W0jbE2UDmYDfvR2oMpO3s/mVkfQB6etpabPGBK/vO?=
 =?us-ascii?Q?wekZCOmELr24wZojJKEwzIgwBlyHeoBIVcg6HEyP6pq/4yLXEP13PIaZ4iwh?=
 =?us-ascii?Q?6tzWcKuzmVmFgtuv2mXiMPFl1KSomLiR45OviI5uXbE87Tcfbbfcs8KVSsrn?=
 =?us-ascii?Q?QEEUloBc+6QTlWgtOHV6IAtkeVB7sVun5rvsO2d8CITckpq4b5LeggHmw4Qz?=
 =?us-ascii?Q?44dOFZApwr+SSAmRzZiggsucQsoPRpgh7/5vVSDcTpCs+dHHXO9HyyJrawoz?=
 =?us-ascii?Q?gz02e2P2JA6KK6sPsPNloTeEcAqGDV9/Y9TrnfPBB9Xgm591Q20g6GrnRLEA?=
 =?us-ascii?Q?/bRzcD9mh32n/a/MLuhBvWRKoUHIsQjuucfkUaFWr1p3IEx4QCLx+MtsWABI?=
 =?us-ascii?Q?sRYmSV6vSyo3NnPQbjs+POGxcbIwbl1TOtvzNtLxPz3+8vD33o6CLtxZ+Fmu?=
 =?us-ascii?Q?Pi84BYdTJ42Z/cVWkq1qKevwbu434rSK6TDVl5MKFTxKbW2FYLL+n40KDIkl?=
 =?us-ascii?Q?/msqcJ5MO+Imbh9AS9og+UI5Bk4FUvt4R6XPElGcBJPXB7Ce3+l3PH5vwDeP?=
 =?us-ascii?Q?p3+Gv1k2/d9fwoAK3O5HGyXBVOXigE8ceyyxSNBExPcBNZlJXv8a96mGypmI?=
 =?us-ascii?Q?n/9GBzypP3YQxEmKQCvER6xo9omejwNke6uu+8OTXuPHKIzZRVcFDibC1ylR?=
 =?us-ascii?Q?yzQ1vCvJz2cSGBsV7Ep4mDjZwxck0yi/+5hIcrau2/9w/O+lZy3Q9vzX3iHP?=
 =?us-ascii?Q?bWXjfGocRXlk1BX+W8ueS1bQM2h47pzgUTXzWZbGSABTr8K53VjWWUZh4kQj?=
 =?us-ascii?Q?vDZ+Xsm0pjkJj6/8P7I6EZL3f+QtOYJFtFdTRafunJEUBPVDweHHnR+Qa3Ug?=
 =?us-ascii?Q?iEQmxkXNsd3zg/JEtvTBog862sDtIkx+7q+jTteGDyJc2kpj+ez4qZslrhuT?=
 =?us-ascii?Q?aFj7DS2ma1IECUQfQBGXDaS7Oj1rNSLuQbAGyc25nGTN0Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AfW9iD3/9FVIPCat7acbTog7X0QZMcNFE+a2Xs3ya1JG3NPRMHPC+h15/3vT?=
 =?us-ascii?Q?Ddgu+j05C3G3OY9fXDszcFmmY51McqLvO847hYM+/6TRo3+g/qvV0Iq15mbZ?=
 =?us-ascii?Q?hsCakOK22lDDsqyze4DAtfeRxYtTgV9VZwp/8tp6XOmE03vuy+QodpUEKYXt?=
 =?us-ascii?Q?+lq3+m5KcmfIYDhVF68dNhAL8+dKWVwdyxNo/Se3BAeTBhgbhcw1CIAlPE5F?=
 =?us-ascii?Q?39sa7Ncr/dmilmksJWmZBVcbJq0MvM9DQWFV9zMusAKR3p2pJHftkk67oxLW?=
 =?us-ascii?Q?W91XDK50TLlYuqfh1LiqmbMtUONfmz5Fde4Ws4n/HcIE7e1CK5lgnP/0Va/r?=
 =?us-ascii?Q?4ajf+fNU4QUoQ3nStTEI2aUZPr9c5FJrxrC267qYHKrq9dU5/lpmIUcIsbcT?=
 =?us-ascii?Q?AuXrmB0rQSmmK/6O2e6vr5ErWg2eRfbhhok3FFLIZUCU4JXgf3Q7RbVzB0Q+?=
 =?us-ascii?Q?hiFbc8VWMzLiERZeYw7qJ3VpYJMIlJH3KRVtJ2WD5YAsY1MWEij+foWaEHbb?=
 =?us-ascii?Q?0NPOJr9IIJGoJwFOCsbIvjE83iB/4r2P+FvbghlSnEdDLdGeOBfl3cpOli3m?=
 =?us-ascii?Q?6iQfa0ntOge7zNjxlhGrcMLYrZGDe3o1c8ektM0fio6f2p542bwO5YfIHckA?=
 =?us-ascii?Q?ERZbAl1eaO20n43n2st/ISJKKLKTyck9mcaAfC7osZ9U2MiARW0Q6iV+tZ8p?=
 =?us-ascii?Q?F0kRGBV1MAGA/loUjIbSoyD3HDEtf26FSkLln3IYn+4Pi1Vg8LhO1mOFp4t8?=
 =?us-ascii?Q?3myZRnHzMFqAXHu2YfeQNLy91I7gpz5K78PVNCsQKrnt20xiklcbE+CHpHtx?=
 =?us-ascii?Q?sjY2ARlSJJGeIm05AlEg+fPwolBS7e4ummJ+8Kyzdc0eoQo+1mTwT+/Y35aj?=
 =?us-ascii?Q?bHXwkIzmkwEyTmByKqjV9l3b48ghVW3lxqnTjNpWySL2J1S/pw5a4SD77kt5?=
 =?us-ascii?Q?4KIUVtvjgHn9pY/+4Ti0+nkEbq7bU1qU96lROZF+58i3gGcptwujjPWYmgNc?=
 =?us-ascii?Q?nVee4mmikA94a6/25mBvoY7vNvouEMDm8l35A+VIo3q8/GJHYHu1HBEMNzw4?=
 =?us-ascii?Q?f8X3A9iRLylR8TPE02LWCXAvj8iW2flTmmauQKZGk7c20As9CqT31P7GT4lF?=
 =?us-ascii?Q?8mJR9hYAG5oxIpLQTQdX2gzJu+6hzBujkOCg4XxIcIFiNvbtY9Iz3Xl+rkym?=
 =?us-ascii?Q?6Ck0Fsi3PvcRdqiGV4OIR0oSbiFq2ZjeArZpEbAQap1Jvz0hxZqrKR0AXraj?=
 =?us-ascii?Q?DV9EvQ66xJPkvgwkOKBCzotnFMe/218aFjScpchQGJnNLAz/3I0fSSxfEaAJ?=
 =?us-ascii?Q?bITd52VZ9N39DP2NPe7KhUDcothrNt8TJJr0ZFCgp/DivbIhSs9vUq+e8054?=
 =?us-ascii?Q?fHBFIBTz7pXe2TMpUp/dECZXcznUrrQlhKoCH9diSnRlJ8Is6iUZ8Sgbp0V7?=
 =?us-ascii?Q?cpjo+BwoRIAz/Q3rGLNNyjttLcM9VY39B+FwDj2m3dwuTMxtfNGVNu99zRdl?=
 =?us-ascii?Q?FCfyrDgECe6KX3XKsUVNjpe+2oYuzcu0dklDwafoUEYEvR1cmpWKumYAf/vX?=
 =?us-ascii?Q?/+ODV5y1so2UOGYveoeuhoCe/yd39xBeauFakI5xY9NWVjPZcCMhtXcHRjN2?=
 =?us-ascii?Q?BQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bf30e79-6e11-46ed-9a61-08dcbad644d8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 13:54:22.1168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZbWQpspdYyr6EglJ+qdugzFc4l0qc53fnshTR455HBwGEJ9oFVqjPCxQg/kRx9vVLz4Nu18TmhF9rZEPgDT/hYwiXBKaUVYdK6+T4phi/F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5931
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

On Thu, Jul 25, 2024 at 11:19:35AM GMT, Gustavo Sousa wrote:
>In an upcoming change, we will be adding the option to forward the
>--hook option to the test cases, which will require updating
>execute_test_process() to add the option when asked by the user.
>
>The current implementation makes that task not quite straightforward:
>filling of argv is already dependent on stuff like entry->subtest_count
>and dynbegin; if we want to keep on using constant indices, we would
>need several conditional branches for adding arguments for --hook.
>
>Let us change the current implementation to use a dynamic vector, to
>make it easier to extend argv with more stuff as needed.
>
>v2:
>  - Squash the logic from patch "runner: Use dynamic vector for test
>    argv" directly instead of using the original logic, which used a
>    statically sized array. (Lucas)
>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
