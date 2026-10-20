Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA04606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 10:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mBt5xtVJ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8496610E38F;
	Tue, 20 Oct 2026 10:58:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FA489A5C
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 10:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792493843; x=1824029843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lV/zzJL1SDxiBxSQxkjq9gd3CoevRtmrJ+uN7C5JPbY=;
 b=mBt5xtVJcCsuZf75v+XILIXRU/UasBtpkhxYG3y6xWRCAhdcMZHBuBk/
 Zx17MnN6DkAWVBUybEsHOd82DCD2Yb5lMIW3XDxtmuKlWfz8zFJEjibfT
 jk7r30gEqtHk5i+c4jk/ZGNZigggvel1SrBl0hmnCyC5wa+v8sREYVPC6
 LwZGgnlRkQeF889KPQ0/Tc//XS3Lcdersi1fe6eHmKbUdBuDlIaHcuBAX
 2C0hqt/s1Lc/yrwW2kmNhPiuRzqrYtKUFf/PpOGGW0Rma4dff3n2zI353
 BoUTswM3BnPzlLo0YMd/9Y3ergag99dqNEr/YzjcFb8LmvbaQvVY5026u A==;
X-CSE-ConnectionGUID: NskCJfTETuSD4Vu4TlqMWw==
X-CSE-MsgGUID: izFFWUf9T/Wi6VVaJ4ok4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1206993"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1206993"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:57:21 -0700
X-CSE-ConnectionGUID: /gzkKhoqQpyMwSzGfoyZYA==
X-CSE-MsgGUID: 23LBvncTRPSA729lw+P0pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2679153"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 03:57:19 -0700
Date: Tue, 20 Oct 2026 12:57:17 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
Subject: Re: [PATCH i-g-t] tools/vmtb: Add VMTB BMG and PTL testlists
Message-ID: <20261020105717.cnlxvt2hsavi7bhq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 igt-dev@lists.freedesktop.org, marcin.bernatowicz@linux.intel.com,
 jakub1.kolakowski@intel.com
References: <20261020074432.58422-1-adam.miszczak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261020074432.58422-1-adam.miszczak@linux.intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Adam,
On 2026-10-20 at 09:44:32 +0200, Adam Miszczak wrote:
> Add testlists to enable VMTB full test runs on BMG and PTL:
> - basic VF driver load/remove
> - idle VF migration (save-restore)
> - busy VF migration with WSIM and IGT workloads
> - double migration with resfix stoppers (requires debug KMD build)
> 
> Signed-off-by: Adam Miszczak <adam.miszczak@linux.intel.com>
LGTM
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/vmtb/vmm_flows/intel-ci/bmg.testlist | 25 ++++++++++++++++++++++
>  tools/vmtb/vmm_flows/intel-ci/ptl.testlist | 20 +++++++++++++++++
>  2 files changed, 45 insertions(+)
>  create mode 100644 tools/vmtb/vmm_flows/intel-ci/bmg.testlist
>  create mode 100644 tools/vmtb/vmm_flows/intel-ci/ptl.testlist
> 
> diff --git a/tools/vmtb/vmm_flows/intel-ci/bmg.testlist b/tools/vmtb/vmm_flows/intel-ci/bmg.testlist
> new file mode 100644
> index 000000000..a0b8a0b7a
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/intel-ci/bmg.testlist
> @@ -0,0 +1,25 @@
> +#####################################################
> +#
> +# VMM Flows BMG test list:
> +# defines tests to be executed on BMG only.
> +#
> +#####################################################
> +##########################
> +# Basic VF/VM operations
> +##########################
> +test_basic.py::TestVfDriverLoadRemove
> +#######################################
> +# VF/VM save-restore - cold migration
> +#######################################
> +test_migration.py::TestIdleMigration
> +test_migration.py::TestBusyMigrationWsim2
> +test_migration.py::TestBusyMigrationWsim3
> +test_migration.py::TestBusyMigrationIgtExecReset1
> +test_migration.py::TestBusyMigrationIgtExecReset8
> +test_migration.py::TestBusyMigrationIgtExecReset11
> +test_migration.py::TestBusyMigrationIgtExecReset12
> +test_migration.py::TestBusyMigrationIgtExecReset13
> +test_migration.py::TestBusyMigrationIgtExecThreads1
> +test_migration.py::TestBusyMigrationIgtExecThreads4
> +test_migration.py::TestDoubleMigration1Resfix1
> +test_migration.py::TestDoubleMigration2Resfix2
> diff --git a/tools/vmtb/vmm_flows/intel-ci/ptl.testlist b/tools/vmtb/vmm_flows/intel-ci/ptl.testlist
> new file mode 100644
> index 000000000..d7be6190d
> --- /dev/null
> +++ b/tools/vmtb/vmm_flows/intel-ci/ptl.testlist
> @@ -0,0 +1,20 @@
> +#####################################################
> +#
> +# VMM Flows PTL test list:
> +# defines tests to be executed on PTL only.
> +#
> +#####################################################
> +##########################
> +# Basic VF/VM operations
> +##########################
> +test_basic.py::TestVfDriverLoadRemove
> +#######################################
> +# VF/VM save-restore - cold migration
> +#######################################
> +test_migration.py::TestIdleMigration
> +test_migration.py::TestBusyMigrationWsim1
> +test_migration.py::TestBusyMigrationIgtExecReset1
> +test_migration.py::TestBusyMigrationIgtExecThreads1
> +test_migration.py::TestBusyMigrationIgtComputePreempt
> +test_migration.py::TestDoubleMigration1Resfix3
> +test_migration.py::TestDoubleMigration2Resfix4
> -- 
> 2.39.1
> 
