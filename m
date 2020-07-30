Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204B76E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jul 2020 09:53:56 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20200730004603.8171-2-umesh.nerlige.ramappa@intel.com>
References: <20200730004603.8171-1-umesh.nerlige.ramappa@intel.com>
 <20200730004603.8171-2-umesh.nerlige.ramappa@intel.com>
From: Chris Wilson <chris.p.wilson@intel.com>
Date: Thu, 30 Jul 2020 10:53:52 +0100
Message-ID: <159610283226.13987.3607258731318740133@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH 2/2] i915/perf: Add tests for mapped OA buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Umesh Nerlige Ramappa (2020-07-30 01:46:03)
> +static void map_oa_buffer_unprivilege_access(void)
> +{
> +       void *vaddr;
> +       uint32_t size;
> +
> +       vaddr = map_oa_buffer(&size);
> +
> +       igt_fork(child, 1) {
> +               igt_drop_root();
> +               try_invalid_access(vaddr);
> +       }
> +       igt_waitchildren();
> +
> +       unmap_oa_buffer(vaddr, size);
> +}

You've also defined the ABI to disallow mmapped access after forking,
even for the privileged user. One more trivial variant to ensure that
holds.
-Chris
---------------------------------------------------------------------
Intel Corporation (UK) Limited
Registered No. 1134945 (England)
Registered Office: Pipers Way, Swindon SN3 1RJ
VAT No: 860 2173 47

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
