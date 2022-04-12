Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF93810FBF3
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Apr 2022 09:17:00 +0000 (UTC)
Date: Tue, 12 Apr 2022 11:16:55 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <20220412111655.536696c2@maurocar-mobl2>
In-Reply-To: <9b72fcb4-1aed-f6d4-121c-9c959706df8c@intel.com>
References: <20220404062642.378928-1-mauro.chehab@linux.intel.com>
 <20220404062642.378928-12-mauro.chehab@linux.intel.com>
 <9b72fcb4-1aed-f6d4-121c-9c959706df8c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 11/12] code_cov_parse_info: add support for
 exclude filters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 11 Apr 2022 14:28:24 +0200
Andrzej Hajda <andrzej.hajda@intel.com> wrote:


> > +When used with B<--exclude-source>, exclusions take precedence.
> > +
> > +=item B<--exclude-source> B<[filter's file]>
> > +
> > +Exclude all files that match the regular expressions contained
> > +at the B<[filter's file]>.
> > +
> > +When used with B<--source-filters>, exclusions take precedence.
> > +  
> 
> Now there are two filtering options per functions and two per files.
> Wouldn't be better to squash include/exclude rules into one param in 
> 'rsync like' patterns:
> + include_pattern
> - exclude_pattern
> ...
> This way it would be easier to manage filters - less options, less 
> helper files.

Added support for it. I also preserved the old behavior of placing
just an include pattern without a "+", in order to be backward-compatible.

> One could think about squashing also filters for function and files, but 
> this I am not sure.

I see your point. Yet, I opted to have a single file. Btw,
depending on the file contents, the same filter file can be used as
both source and function filters. For instance, a filter file like:

	+i915
	+gem
	-display
	-selftest

can either be used for functions or sources (or both).

Regards,
Mauro
