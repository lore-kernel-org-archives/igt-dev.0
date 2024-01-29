Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8233C47422
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jan 2024 09:57:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8604C10F54C;
	Mon, 29 Jan 2024 09:57:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABE8210F334
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jan 2024 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706522251; x=1738058251;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DgH7LpfxhC3F8TBAN+YWg6AkS0KV3n5eQt0SM1U++Sc=;
 b=fz9FvcL5Y3hTPgr0gX08L6yA/3ngCZ3pi3eK9BJqwpJF7u/8/ufskCJA
 FKfWcuc1yOtb00y58Vjq4mSz+ha4HBpkjfilCuzW6euAH9v6KbHyzcISV
 JDXzt/LKzCdqE/iaqtmVQZ2KNXcButDOjAzuY174rWm2WKy3ZBcGN8JmE
 kdH9Ah+N37OrJuySCTguJlEVwxXI5dYt8VW8oIRt+aCmiMkc2bM+Y+086
 gBwgnjHFA1Px5dfw4n1pusVa10ZkheRZ+Ebcr2r3qAXPfcxszoOJk4ZUM
 C9P253rt9Ongmb1Khe97dE949AUEZim6yra8yT3yUKbRiQO45NzPi5DrR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="1840941"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="1840941"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 01:57:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="960851386"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; d="scan'208";a="960851386"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orsmga005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 01:57:28 -0800
Date: Mon, 29 Jan 2024 10:57:26 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] scripts/igt_doc.py: don't be verbose when
 creating testlists
Message-ID: <20240129095726.7avtbn6aon6afk7q@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
 <20240126124021.2700482-4-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240126124021.2700482-4-mauro.chehab@linux.intel.com>
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

Hi Mauro,
On 2024-01-26 at 13:37:29 +0100, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> As this target is part of meson, suppress outputs, except when
> there are errors or warnings.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  scripts/igt_doc.py | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
> index b66eefe799e9..6a1cfc2b5a56 100755
> --- a/scripts/igt_doc.py
> +++ b/scripts/igt_doc.py
> @@ -198,6 +198,8 @@ class IntelciTestlist:
>          if not os.path.exists(directory):
>              os.makedirs(directory)
>  
> +        files_written = False
> +
>          for driver, gpus in self.testlists.items():
>              driver_path = os.path.join(directory, driver)
>              try:
> @@ -225,14 +227,18 @@ class IntelciTestlist:
>                          testlist = re.sub(r"_+", "_", testlist)
>  
>                      if not subtests:
> -                        print(f"Warning: empty testlist: {testlist}")
> +                        sys.stderr.write(f"Warning: empty testlist: {testlist}\n")
>                          continue
>  
>                      fname = os.path.join(dname, testlist) + ".testlist"
>                      with open(fname, 'w', encoding='utf8') as handler:
>                          for sub in sorted(subtests):
>                              handler.write (f"{sub}\n")
> -                        print(f"{fname} created.")
> +
> +                    files_written = True
> +
> +        if not files_written:
> +            sys.stderr.write("Warning: No Intel CI test files created!")
>  
>  def main():
>      """
> -- 
> 2.43.0
> 
