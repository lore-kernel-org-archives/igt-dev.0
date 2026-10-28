Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E667F606A31A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 12:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DQxj/4XB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE0510FBE8;
	Wed, 28 Oct 2026 12:38:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442BD10E2E0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 12:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793191029; x=1824727029;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rQZ9YRkFkq8bImL4aio3+GxRGQzQXoLcuzc0SfT5FIc=;
 b=DQxj/4XBQJztfHVXrmqNmRiR3hWzGOCo1q2ialMBDFPAOfNxNffAUYb0
 CGXltZaRTqOgsKzymgwehvg+IIl+yr1Yn8dMsHFhrz+Rdmq12J+3dxPFi
 Us3PVxzgDoTDFc3vDLVzNr+rksJ/l9fBVOBhI6iJQvf99XU0cY4cEXRfG
 cWABGcCAH6JRleeZ/d5/AoXPrypXdFE1sni98BoaqNQBrwKndseVdyIio
 NTDkD1RxD6bNjtuP3kCRuVGqclH4NZ0WqLqKYCoPTYmNu9LB1G8b6TUj+
 IrwwHvuZnqkm6t86VeXwg8E59q+rOIf1mXnt/cYJdgHUbz/AuKIpCNJHP A==;
X-CSE-ConnectionGUID: 4gD6Z3fNSCe0ZG/Z7Q1Yvw==
X-CSE-MsgGUID: ivJ3lD3sRdKbftXq11iGCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1818650"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1818650"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:37:09 -0700
X-CSE-ConnectionGUID: DwHgD16cTb+IpublFllWkg==
X-CSE-MsgGUID: HwI3ezQeRJmF5s2a4+b11g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="6674012"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 05:37:08 -0700
Date: Wed, 28 Oct 2026 13:37:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v2 2/2] runner/executor: Report command used for
 test exec
Message-ID: <20261028123706.vkcmgxknerggyidv@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20261026141702.44811-1-kamil.konieczny@linux.intel.com>
 <20261026141702.44811-3-kamil.konieczny@linux.intel.com>
 <87wlr49ri6.fsf@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87wlr49ri6.fsf@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gustavo,
On 2026-10-26 at 16:44:01 -0300, Gustavo Sousa wrote:
> Kamil Konieczny <kamil.konieczny@linux.intel.com> writes:
> 
> > Add printing of command line used for executing a test, when
> > the log level is normal or above.
> >
> > v2: move constructing exec command string to separate function
> >     (Gustavo)
> >
> > Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > ---
> >  runner/executor.c | 50 ++++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 49 insertions(+), 1 deletion(-)
> >
> > diff --git a/runner/executor.c b/runner/executor.c
> > index 5bd95b929..91ad05d58 100644
> > --- a/runner/executor.c
> > +++ b/runner/executor.c
> > @@ -1626,6 +1626,49 @@ static void free_test_command(struct igt_vec *arg_vec)
> >  	igt_vec_fini(arg_vec);
> >  }
> >  
> > +static char *entry_exec_cmd(struct igt_vec *arg_vec)
> > +{
> > +	char *m, *n;
> > +	int mlen, s_len, vec_len;
> > +
> > +	mlen = 4096;
> > +	m = malloc(mlen);
> > +	if (!m)
> > +		return NULL;
> > +
> > +	vec_len = igt_vec_length(arg_vec);
> > +	s_len = 0;
> > +	for (size_t i = 0; i < vec_len; i++) {
> > +		int nlen;
> > +
> > +		n = *((char **)igt_vec_elem(arg_vec, i));
> > +		if (!n)
> > +			break;
> > +
> > +		nlen = strlen(n);
> > +		if (s_len + nlen + 2 > mlen) {
> > +			char *p;
> > +
> > +			mlen *= 2;
> > +			p = realloc(m, mlen);
> > +			if (!p)
> > +				break;
> > +
> > +			m = p;
> > +		}
> > +
> > +		if (i)
> > +			m[s_len++] = ' ';
> > +
> > +		memcpy(m + s_len, n, nlen);
> > +		s_len += nlen;
> > +	}
> > +
> > +	m[s_len++] = 0;
> > +
> > +	return m;
> > +}
> > +
> >  static void build_test_command(struct settings *settings,
> >  			       struct job_list_entry *entry,
> >  			       struct igt_vec *arg_vec)
> > @@ -1849,7 +1892,7 @@ static int execute_next_entry(struct execute_state *state,
> >  
> >  	if (settings->log_level >= LOG_LEVEL_NORMAL) {
> >  		char buf[100];
> > -		char *displayname;
> > +		char *displayname, *cmd;
> >  		int width = digits(total);
> >  		int len;
> >  
> > @@ -1864,6 +1907,11 @@ static int execute_next_entry(struct execute_state *state,
> >  		free(displayname);
> >  
> >  		outf("%s\n", buf);
> > +		cmd = entry_exec_cmd(&arg_vec);
> > +		if (cmd) {
> > +			outf("cmd: %s\n", cmd);
> > +			free(cmd);
> > +		}
> 
> The function entry_exec_cmd() and its usage look correct to me, but I
> wonder if we could avoid the memory allocation with something like
> below:
> 
>     outf("cmd:");
> 
>     for (size_t i = 0;
>          i < igt_vec_length(&arg_vec) && *(char **)igt_vec_elem(&arg_vec, i);
>          i++)
>     	outf(" %s", *(char **)igt_vec_elem(&arg_vec, i));
> 
>     outf("\n");
> 

The idea for building string was to resue it and saving it
into cmd.txt or journal.txt, so it will survive any unexpected
reboot, then put it into results.json

Let me write that part in v3.


Regards,
Kamil

> --
> Gustavo Sousa
> 
> >  	}
> >  
> >  	/*
> > -- 
> > 2.55.0
