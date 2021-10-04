Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251EA6E1A7
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 11:14:10 +0000 (UTC)
Date: Mon, 4 Oct 2021 14:17:31 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVriy3hQjucowhGk@platvala-desk.ger.corp.intel.com>
References: <20210903123027.1433-1-contact@emersion.fr>
 <YVrKRXeGi2V37xCP@platvala-desk.ger.corp.intel.com>
 <hLg9fLkq8x4hy7DqsQM-GFlKgXYsJJ97Jug9rX1JwxIsVUoRFiZM4CeAG8rpwpMxrXjgaqzXl8G2H3z3id9dMw4XGLExOW19G7OitDw2_J4=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hLg9fLkq8x4hy7DqsQM-GFlKgXYsJJ97Jug9rX1JwxIsVUoRFiZM4CeAG8rpwpMxrXjgaqzXl8G2H3z3id9dMw4XGLExOW19G7OitDw2_J4=@emersion.fr>
Subject: Re: [igt-dev] [RFC i-g-t] tests/kms_lease: add empty lease test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 04, 2021 at 09:34:18AM +0000, Simon Ser wrote:
> On Monday, October 4th, 2021 at 11:29, Petri Latvala <petri.latvala@intel.com> wrote:
> 
> > When is the kernel change going to hit drm-tip? We're going to need a
> > bug report and cibuglog filter for this failing without it if this is
> > merged before kernel. (Which is ok, with the bug filing done)
> 
> Thanks for the review!
> 
> Sorry, I got a bit eager and forgot about IGT. I've already merged that
> patch to drm-misc-next, so it should be in drm-tip already.

Great!

I fired a retest on this patch to verify.


-- 
Petri Latvala
