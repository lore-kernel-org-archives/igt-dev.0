Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F194EC282D1
	for <igt-dev@archiver.kernel.org>; Thu,  6 Mar 2025 19:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A497510E28F;
	Thu,  6 Mar 2025 19:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l22UNFRW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D310E11B
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Mar 2025 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741290926; x=1772826926;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=og73q4XnjeLp9Bi4PL6SaZObhMglejhL0CgBHNCumpA=;
 b=l22UNFRWsSnBkMYRwNaenxjrTyofjE/YbyuOMG29wZK+KY4gT14BV3WE
 8fva+T0PiobRFcZla7aX73hIKN4O6mEn/lkcNpCBiG/jZnbjfCaK0YXMW
 VC5y/bZIPB+58OawCi+5JwctQ9DsAdunAU4SfQzPpo6pKuBfkVNTkqQAF
 3oUuRlA90u1imoYrpuyACuDMgXvH0VmG9C9UNsS6E4ybknZG6yRk6+N2X
 HRpAYhYaIqee4JWcZNDmMcC7qPJD5p68/V+Z2cJiotMdBd5vkNuejBQj1
 DCqysGYXyGvD/fW4DPTsYQRo+SbrEBPnNws70ovPhg2NErSms/yNQVvTw A==;
X-CSE-ConnectionGUID: C8hAkTL4RFSruSHnW8XyqA==
X-CSE-MsgGUID: 3RJAL+KnT7GO13FMcNLPbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64769991"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="64769991"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:55:25 -0800
X-CSE-ConnectionGUID: 2ntHWkVHRqKGwXhWUXUOeQ==
X-CSE-MsgGUID: ZTP/RbulQWeE2d34KVQnOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; d="scan'208";a="124058230"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 11:55:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 6 Mar 2025 11:55:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 11:55:24 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 11:55:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NBJvMhtn9vS2quNp2sMz5aiCdRjGYM62pLySuJP6qlsykKtgs2g93A3et7c/mYCc4+Ns/CKO2b2iqU5T+xUwGMis76cJdjT/c6Wo40hIDwZ+Pwj0wfbmZDnHsWI7ajUC5MXUy6fhhnZdCKYhP3rsGbOduRzjM6qO0DpFtQIjsB2Bh+m5p9r9kj5nQqZBEJ0iXiXOd9Yka+CRNMgqu5YfJ/2u/4TBPz+nRWqrZSgX/qU3qqXhTMySlIS66skKbw9U2zs6g8dODk54Ad5/QYIS4EF+p+1Y8KWUM55VFv1vGVP2zQzaL8L4sbGyqPxM5gD/J1JpntFZZPGbfPw5kLoA8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2k8SNJgr5wBIDoF/7DMwyB3l3wIx0yN92TtZZLlgtw=;
 b=C/t6OxM1pcl1rHKw8S2blVQV1HJNMILtAKhJuRexC821ytE1IhJiIANxrS7TBApSKvwddpk3g7FHyU9FTfGWYkPhG7Az4ElOJLxSKtbnXHgBmNj65iMRDYxiGbssoWKIQXdcoOYorCqSkwnRHWQTMKc4je63YLmwFpFt5QYzbOBqI3PjjWoNNL2sro4JssG/GQ/SFIDEbVs1g0ImvDi8c5ULPcoKj6ikhUQ44sLaFkz3RY48Ac1qK6MXwCMIlVhLil7bFPGMksPYL1gPab271Ahn5Fo9NTaG5woWy2tYE2YffaZWftXcHet9AvrDL1Ld8wSCo44yrw4Wa2DBnHUsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB7242.namprd11.prod.outlook.com (2603:10b6:930:95::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 19:55:22 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 19:55:22 +0000
Date: Thu, 6 Mar 2025 14:55:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: "Gupta, Anshuman" <anshuman.gupta@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Tauro, Riana" <riana.tauro@intel.com>,
 "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
Message-ID: <Z8n9pix0pglefdoA@intel.com>
References: <20250306112754.1483363-1-soham.purkait@intel.com>
 <20250306135100.ey6vkuzvezylu7jt@kamilkon-desk.igk.intel.com>
 <yc7bfsm5qm7ciipadix2ahhwzazmnkkvbvvyfa5a27qu7vxq5o@5p7nmvftovgx>
 <CY5PR11MB6211DFD1745310E81E6C498095CA2@CY5PR11MB6211.namprd11.prod.outlook.com>
 <xrwfe4zfyiwwcpl7ak6vdvgueznly344jqnkkiuraozz45tec5@w2cldwxkb3bh>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <xrwfe4zfyiwwcpl7ak6vdvgueznly344jqnkkiuraozz45tec5@w2cldwxkb3bh>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB7242:EE_
X-MS-Office365-Filtering-Correlation-Id: a9c611b8-3932-4c9b-d02f-08dd5ce8d456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JROx1cIPMnoHZ7crUGRrt6JcdzkJ79qWmmo9M8ka+wzau5P9dDpIOLejiIYB?=
 =?us-ascii?Q?uJ6L1LMaNFWATjWbOVWMcIUQwqyM6bQx9NNnJZkQRz+wh++mhqG3B9fXHuN5?=
 =?us-ascii?Q?m9T4fv4uHMOKhFanHd5BZOzu2SSbxPqNY0sZNkZQKGGhn+HRHymGdk8TEH2W?=
 =?us-ascii?Q?ZJyHNaAzw4EGHq470thdMUuqD7d7efAjvalV+VinN6gh+m7eYrqS2W/bFgAF?=
 =?us-ascii?Q?0jFcjegyILGBnDaCKPJjmTuT7445zmN5dKfpZBes+RaF6UXzRCLmLZKORNwB?=
 =?us-ascii?Q?pzkgr2NjjlEKhkYPdd2Cg2Ef59HOEliTMkRLLD3kZHF35CJbaXilhflPNizm?=
 =?us-ascii?Q?K8bkkMgQ6Xyw4QuxrEiRc+UHFL4THFT8HuLDKtvovt5MH6u1JEXm8KgQrYFu?=
 =?us-ascii?Q?/sHuoYFyow5aD9L72i9dKagPkLgeT00CWgo1pYLitHXbuUvOHlN6VjOVb5lF?=
 =?us-ascii?Q?Sz9LxIgHVXvZG4pY+be/rWQhn+snjRJXk/SybExgYMj9ccIT2qtm+trFv/JV?=
 =?us-ascii?Q?sAr6od4lI/xbl+6C18lQGS1Fe/WSdFgpIP3G+gUKG5iKsCHVmksmtVGYvWi6?=
 =?us-ascii?Q?+IHmetcxE/arhBj9sGxyTOrLFDN8n4tvdu0mgKkMPTUrKQmZFrSpGO6F3FnP?=
 =?us-ascii?Q?Iz1VxAZ6yMw73fg12oipF02zSqkKFa3gQf2MIVngUkCLvz8x4xXR2GA6wcmI?=
 =?us-ascii?Q?G9FsMSxCMZk4UbkCyQQz620yo8z6MtDj7yKa2xXBdCN/9gr308tgIKvN/hG3?=
 =?us-ascii?Q?0AjPRtrcOmgHUxgZAUtxHBjpVJlxRNSE22ZH6X1JteTvz1pp6BMdBFVDTXPj?=
 =?us-ascii?Q?QQ3gq/5iAP0G/H3+1ku1xyQl4C17Zcu+hCO1gs8AlFJbGjqjV7MZYeKKUtWT?=
 =?us-ascii?Q?ngVEVg//wQC+mMd9gwlV7sQp9Ga3tmrLdc+iDZ9r/4QXphKZ6Jvd7G/MZVfb?=
 =?us-ascii?Q?Yp0GFRr6KEwhcihUrzE/vyngBj85kjfb8UQ6H16s1U2TU7/mI913RG36vyTN?=
 =?us-ascii?Q?8BC+pcdSXSKgAxzyECYN7t+XK92Xl6PfOZi+NeS144ayQpjY6MiqVR1nnhfE?=
 =?us-ascii?Q?LEzpZqINlMmlvfLoqxzxUTaMuO+m6bfSfhdYB2R7fFjWHX17mV3uWWofyE+/?=
 =?us-ascii?Q?lmTX1ADxkE/hhvC9UqcWCD10l1nxZxvr0Qkzmz+ffdM2sa9SkvWmtqHqPcKT?=
 =?us-ascii?Q?NTA5FwPBfby6kBfpsy6e7iR5ODFya0zhPkDHyR69UTHDWg4BHORibz4NRsM5?=
 =?us-ascii?Q?DEQeY2DTc1uS6vtIeQgJlYzZNaiBIRI52iEfGYqO9XfjHRZdm2LlJY/myoII?=
 =?us-ascii?Q?qgtNgxkJJcX5N3cf6KOfn1Nb9nQjl4oBCVfIkBVW45rdLqmRPe1sUxHCYmAy?=
 =?us-ascii?Q?KGuFbs8xTu2ozqn+WDMHlVyb84XC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jm/hxZv9nLH2ofzAv6xzJDSMJ5ietMWe7O1/DfydsGcbK7bXG9PpA+VrqIl7?=
 =?us-ascii?Q?Mu7y2rxvybecr//2gItg1RV+DevWRoLbWcf1Fm8/T/avK2vDzpn6j3hdC4Rc?=
 =?us-ascii?Q?dUFgOv4PuHVn6jMxIIp9H00GXrDbSMQnwDg39tXUroRTyJta4tXPZ0A2zFMv?=
 =?us-ascii?Q?7AQjDorYCvoYxmy8uVjaW/4wEn5CkyQeFtfdy3yGdKCpt6dFqardpDgLObYr?=
 =?us-ascii?Q?Xensih0kt9oujNo59bPPuRhjzCe6fgccl1kNRz2ygO6Cl5UXPfqjUd5Pd7+Z?=
 =?us-ascii?Q?fQ1fNFpuH6FZVYmo3LwuC/bt2IyWnaQO/vt6kqUFdI8zVSNjf7Jlvd0xIRpN?=
 =?us-ascii?Q?wZX+PoT9PPMdr520yOqq29s5BtU8wJM/WyPeJHFsyTlG9F+d01FWv9Ln87+s?=
 =?us-ascii?Q?raaC7DQiH9Kg3ItH3vZT3X0AlJz4VYwinCI36omYSyfae9PjJ39XGHSvykW4?=
 =?us-ascii?Q?Csu8dGG2Az6FWti+PYumgAzVq1SfBji8y70fZqFn/9rnFYBXGlZz3bmFuj2P?=
 =?us-ascii?Q?gKeFfT9jeEDRG0gJgj5YkovlQPRn6iAwZ18wyp4tN/qSbYNaCp/St6bS/d/9?=
 =?us-ascii?Q?6ssIkb+TDsBfsb9I3h9YmZ441Q23TvWISdxpCRBUpD6/cDgpIaXT2nN6hTWn?=
 =?us-ascii?Q?u0pOy7YYr2v+5stDJXKOgvK97tWabfrjXNT0FLkVo106sPaKB8LQ/kATbIMy?=
 =?us-ascii?Q?DfXAW65SA3/eLt/gU1C5CvccQ+yY8UUdajBb4g4izg7kzPhvNPvMDHD0gf29?=
 =?us-ascii?Q?NCNHFMO/gxkw4uS8LNxjZ7BMkgRS3WQtrO02saTyulY6mrrb7Dy8CshyXhGl?=
 =?us-ascii?Q?QSoqmHPo4NA/vLJJOXphbORLszNnVLTO7w/AN06K5wr2n/eSpKQnwL85ToJF?=
 =?us-ascii?Q?OueB0/Cpftvv+NgmBPUDPV0gogeld893elkE8bqyLB1dM16WdHcckBxmJhr5?=
 =?us-ascii?Q?udDgjLdjjuP/oxJgiD7Hc+Hq/CWu+FQVd19m/dbJ4hkRPPc70ey8RGajjrA+?=
 =?us-ascii?Q?PzGjGu7rv0J3exO51pULrcrhOrxPSTX0c5J71P9ZnTgS1JzNcJ6tmx9ngDO6?=
 =?us-ascii?Q?Jn1aXEtNs2aS3E4DP1+eNjIFLVN1Apookf44GpU75yQyprvh+grdbz5skm48?=
 =?us-ascii?Q?ek9ahRy5y0knt0Wb5q5Y2U5e1gnrYwnIUUSLKdoPDQo2HDpxJ1mNMMHj2gF0?=
 =?us-ascii?Q?82NkbQzrhKQ5xLDE5UhB1hxGOaWSZry9niJa5+E/UvVR2rgM7D8XvlYiJsQI?=
 =?us-ascii?Q?+43gOM7ozNYtSvsJ0uvzSF7oXgQ2wVmf6pw/KxIFMBm1lR/9XXXrw/wXHr+V?=
 =?us-ascii?Q?nuErCywIIrVGcMe8TE/GKwkSb/rG4zuxAuCf5LxsD5noQsvJiGrANiyxhegN?=
 =?us-ascii?Q?vJFLaNMv8oUZyqaOj3nz56dMX2OGbJaJVyUpAt2tYFiSGpn8M/UyfTgvWdik?=
 =?us-ascii?Q?BKoGaFHYYFKGCiQSSJah6HjiVFIifi70jjP4NpnP6hQP0OzhXyu3hH18F8Tw?=
 =?us-ascii?Q?akduNW9WOtgdWr3dIjONXZAe6lw0/olrdrYT4vbdINUMFwiN7IskWQGlq7v1?=
 =?us-ascii?Q?jALsff3nNaAU5Nqiszx4+oD9TNahqVZxe2HgTRyz2p8vTIC3ThMQ60tn7qhM?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9c611b8-3932-4c9b-d02f-08dd5ce8d456
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 19:55:22.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a7GVAKV6eaxmzOGwcsQyGs5if8LZxDjqpag5XmT08QSapyxsMxv5DxdJcG6WBSD2JWeVBNjMBP5CFKiygUPo4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7242
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

On Thu, Mar 06, 2025 at 10:25:16AM -0600, Lucas De Marchi wrote:
> On Thu, Mar 06, 2025 at 10:06:01AM -0600, Gupta, Anshuman wrote:
> > 
> > 
> > > -----Original Message-----
> > > From: De Marchi, Lucas <lucas.demarchi@intel.com>
> > > Sent: Thursday, March 6, 2025 9:20 PM
> > > To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; Purkait, Soham
> > > <soham.purkait@intel.com>; igt-dev@lists.freedesktop.org; Tauro, Riana
> > > <riana.tauro@intel.com>; Belgaumkar, Vinay <vinay.belgaumkar@intel.com>;
> > > Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
> > > <rodrigo.vivi@intel.com>
> > > Subject: Re: [PATCH i-g-t v1] Add support for runtime pm for xe driver
> > > 
> > > On Thu, Mar 06, 2025 at 02:51:00PM +0100, Kamil Konieczny wrote:
> > > >Hi Soham,
> > > >On 2025-03-06 at 16:57:54 +0530, Soham Purkait wrote:
> > > >
> > > >add prefix 'tools/intel_pm_rpm:' in subject, so it will be:
> > > >
> > > >[PATCH i-g-t v1] tools/intel_pm_rpm: Add support for Xe driver
> > > >
> > > >> Add support for runtime power management for Xe driver.
> > > >>
> > > >
> > > >Add here your s-o-b:
> > > >
> > > >Soham Purkait <soham.purkait@intel.com>
> > > >
> > > >Please use checkpatch.pl for some obvious corrections like this, you
> > > >can find this script in Linux kernel sources, also read CONTRIBUTING.md
> > > >in i-g-t sources for some options for checkpatch.
> > > >
> > > >> ---
> > > >>  tools/intel_pm_rpm.c | 2 +-
> > > >>  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c index
> > > >> 08c25ca8a..945247d2e 100644
> > > >> --- a/tools/intel_pm_rpm.c
> > > >> +++ b/tools/intel_pm_rpm.c
> > > >> @@ -151,7 +151,7 @@ int main(int argc, char *argv[])
> > > >>  			goto exit;
> > > >>  		}
> > > >>  	} else {
> > > >> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> > > >> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> > > >> +!igt_device_find_first_xe_discrete_card(&card)) {
> > > >
> > > >Split this line:
> > > >		if (!igt_device_find_first_i915_discrete_card(&card) &&
> > > >		    !igt_device_find_first_xe_discrete_card(&card)) {
> > > 
> > > I'd rather stop spreading this. Particularly in **tools**.
> > > If env_device is NULL, why don 't we rather build a match string with the thing
> > > we want aka
> > > 
> > > 	"pci:vendor=8086,device=discrete"
> > > 
> > > I'd replace in tools the current uses of
> > > igt_device_find_first_i915_discrete_card() with:
> > > 
> > > 	"pci:vendor=8086,device=discrete,driver=i915"
> > > 
> > > ... and implement the driver= match in igt_device_scan if it's not there. Then if
> > > it works with either i915 or xe, we remove it.
> > > 
> > > I also think the tool is being less than helpful by trying to work with discrete-
> > > only device.
> > This tool implemented with intention put the discrete cards in runtime d3cold as it requires to tune each pcie device in the topology.
> > As d3cold only supported on  dgpu, we don't need this tool for igpu.
> 
> ok, but should this be a check by discrete for each driver or checking
> power state and d3cold_allowed in the pci layer?
> 
> What do you do if the user passed 00:02.0 as device?

This should be something similar we have on xe_pm for d3cold.
It should skip if we don't have the firmware_node/real_power_state.
But then if the goal is d3cold, we should also check this value to ensure
we are in d3cold.

So, something still seems off to me in this patch. Or we need a bigger
refactor in this test case here or improve the xe_pm with the missed case
*there* with what we are trying to cover with this patch here.

> 
> Lucas De Marchi
> 
> > Thanks,
> > Anshuman.
> > > 
> > > It looks like SET_I915_AUTOSUSPEND_DELAY also needs to be abstracted?
> > > 
> > > 
> > > Lucas De Marchi
> > > 
> > > 
> > > >
> > > >Btw should we also add support for other cards in multi-GPU case? If
> > > >yes this is some more work for another patch.
> > > >
> > > >Regards,
> > > >Kamil
> > > >
> > > >>  			igt_warn("No discrete gpu found\n");
> > > >>  			ret = EXIT_FAILURE;
> > > >>  			goto exit;
> > > >> --
> > > >> 2.34.1
> > > >>
