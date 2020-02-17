Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190E26E8A4
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 11:32:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200217112659.GJ25209@platvala-desk.ger.corp.intel.com>
References: <20200214214829.4054673-1-chris@chris-wilson.co.uk>
 <20200217110130.GH25209@platvala-desk.ger.corp.intel.com>
 <20200217111728.GI25209@platvala-desk.ger.corp.intel.com>
 <158193856695.19707.9026913900892754337@skylake-alporthouse-com>
 <20200217112659.GJ25209@platvala-desk.ger.corp.intel.com>
Message-ID: <158193913746.19707.7183869886572842911@skylake-alporthouse-com>
Date: Mon, 17 Feb 2020 11:32:17 +0000
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Tomi Sarvela <tomi.p.sarvela@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Petri Latvala (2020-02-17 11:26:59)
> On Mon, Feb 17, 2020 at 11:22:46AM +0000, Chris Wilson wrote:
> > Quoting Petri Latvala (2020-02-17 11:17:28)
> > > Oh, and in the same patch you can do this:
> > > 
> > > Find the ugliest line you can find in tests/igt_command_line.sh and
> > > change it to a prettier one.
> > 
> > We can just delete it, right? Since with igt_subtest_with_dynamic() we
> > always define the test group and so --list always reports something.
> > Right?
> 
> The if (and the fi), yes.

--- a/tests/igt_command_line.sh
+++ b/tests/igt_command_line.sh
@@ -92,10 +92,8 @@ check_test ()
                # Subtest enumeration of kernel selftest launchers depends
                # on the running kernel. If selftests are not enabled,
                # they will output nothing and exit with 0.
-               if [ "$testname" != "i915_selftest" -a "$testname" != "drm_mm" -a "$testname" != "kms_selftest" -a "$testname" != "dmabuf" ]; then
-                       echo "    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!"
-                       fail $test
-               fi
+               echo "    test does seem to be using igt_main() (should have subtests) and yet --list-subtests is empty!"
+               fail $test
        fi
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
