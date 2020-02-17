Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C306E479
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 11:27:04 +0000 (UTC)
Date: Mon, 17 Feb 2020 13:26:59 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200217112659.GJ25209@platvala-desk.ger.corp.intel.com>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
 <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
 <20200217111728.GI25209@platvala-desk.ger.corp.intel.com>
 <158193856695.19707.9026913900892754337@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158193856695.19707.9026913900892754337@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Update selftests to use dynamic
 subtests
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 17, 2020 at 11:22:46AM +0000, Chris Wilson wrote:
> Quoting Petri Latvala (2020-02-17 11:17:28)
> > Oh, and in the same patch you can do this:
> > 
> > Find the ugliest line you can find in tests/igt_command_line.sh and
> > change it to a prettier one.
> 
> We can just delete it, right? Since with igt_subtest_with_dynamic() we
> always define the test group and so --list always reports something.
> Right?

The if (and the fi), yes.


-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
