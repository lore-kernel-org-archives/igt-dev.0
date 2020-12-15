Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58A86E17D
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Dec 2020 09:07:22 +0000 (UTC)
Date: Tue, 15 Dec 2020 11:07:15 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20201215090715.GG7444@platvala-desk.ger.corp.intel.com>
References: <20201214211024.142704-1-jcline@redhat.com>
 <20201215090422.GF7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201215090422.GF7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] resultgen: avoid null pointer
 dereference from realloc
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
To: Jeremy Cline <jcline@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 15, 2020 at 11:04:22AM +0200, Petri Latvala wrote:
> On Mon, Dec 14, 2020 at 04:10:24PM -0500, Jeremy Cline wrote:
> > realloc() and friends return NULL if they fail; simplify the
> > new_escaped_json_string() by allocating all the necessary memory
> > up-front and checking for a failed allocation.
> > 
> > new_escaped_json_string() can already return NULL since
> > json_oject_new_string_len() returns NULL for various undocumented error
> > paths, and NULL is valid input for json_object_object_add(), which this
> > new_escaped_json_string() is currently exclusively used with. Thus,
> > returning NULL when memory allocation fails should be safe.
> > 
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> 
> Nice cleanup, thanks.
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>

And now merged.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
